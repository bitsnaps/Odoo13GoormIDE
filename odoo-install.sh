#!/bin/bash
################################################################################
# Script for installing Odoo v13 CE on Ubuntu 18.04
# Assumes you already have an Ubuntu user called "odoo" with a home folder
# Here is how to create an `odoo` user with sudo permission on ubuntu with username=odoo and password=odoo
# adduser odoo
# usermod -aG sudo odoo
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano odoo-install.sh
# Place this content in it and then make the file executable:
# sudo chmod +x odoo-install.sh
# Execute the script to install Odoo:
# ./odoo-install
################################################################################
#trusty
#WKHTMLTOX_X64=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.trusty_amd64.deb
#WKHTMLTOX_X32=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.trusty_i386.deb

#bionic
WKHTMLTOX_X64=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
WKHTMLTOX_X32=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_i386.deb

#focal
WKHTMLTOX_X64=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.focal_amd64.deb

#--------------------------------------------------
# Update Server
#--------------------------------------------------
echo -e "\n---- Update Server ----"
sudo apt-get update
# in case of error
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5DC22404A6F9F1CA
# where <PUBKEY> is your missing public key for repository.
# you can list all installed public keys using:
#sudo apt-key list
# then delete the expired one using:
#sudo apt-key del <keyid>

sudo apt-get upgrade -y
#--------------------------------------------------
# Install PostgreSQL Server
#--------------------------------------------------
service postgresql status
if [ "$?" -gt "0" ]; then
  echo -e "\n---- Install PostgreSQL Server ----"
  sudo DEBIAN_FRONTEND=noninteractive apt-get install postgresql -y
else
  echo -e "\n---- PostgreSQL Server already installed - skipping install ----"
fi
echo -e "\n---- Creating the ODOO PostgreSQL User  ----"
sudo su - postgres -c "createuser -s odoo" 2> /dev/null || true
#--------------------------------------------------
# Install Dependencies
#--------------------------------------------------
echo -e "\n---- Install tool packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install wget subversion git bzr bzrtools python-pip gdebi-core -y
	
echo -e "\n---- Install python packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install python-suds python-dateutil python-feedparser python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-pypdf python-decorator python-requests python-passlib python-pil -y
# old packages (ubuntu 16): python-pybabel python-pypdf
sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-babel python-pypdf2 -y
# PS. "python-pypdf2" may be replaced by "python3-pypdf2"
	
# Remove old libs
#sudo apt-get remove python-werkzeug
#sudo apt-get remove python-ldap

# then I reinstalled libssl libs
sudo DEBIAN_FRONTEND=noninteractive apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev python-gevent -y

# Install MySQL Config driver (needed by some modules)
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server libmysqlclient-dev -y


echo -e "\n---- Install python libraries ----"
sudo pip install gdata psycogreen ofxparse XlsxWriter

echo -e "\n--- Install Node packages"
sudo DEBIAN_FRONTEND=noninteractive apt-get install node-clean-css node-less -y

sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs npm -y
sudo npm install -g less -y
sudo npm install -g less-plugin-clean-css -y
    
sudo ln -s /usr/bin/nodejs /usr/bin/node

echo -e "\n---- Install wkhtml and place shortcuts on correct place for ODOO ----"
#pick up correct one from x64 & x32 versions:
if [ "`getconf LONG_BIT`" == "64" ];then
    _url=$WKHTMLTOX_X64
else
    _url=$WKHTMLTOX_X32
fi
sudo wget $_url
sudo DEBIAN_FRONTEND=noninteractive gdebi --n `basename $_url`
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin


sudo git clone --depth 1 --branch 13.0 https://github.com/OCA/OCB /opt/odoo13/odoo
#sudo git clone --depth 1 --branch 13.0 https://www.github.com/bistaray/enterprise /opt/odoo13/enterprise

# Or in a local directoy:
#sudo git clone --depth 1 --branch 13.0 https://github.com/OCA/OCB odoo13

# Uninstall conflicts packages
pip3 uninstall matplotlib bokeh flask

# Install python packages
pip3 install setuptools wheel
pip3 install -U -r requirements.txt
pip3 install psycopg2-binary # removes psycopg2 warning

sudo cp /opt/odoo13/odoo/debian/odoo.conf /etc/odoo-server.conf

echo -e "\n---- Create Log directory ----"
sudo mkdir /var/log/odoo13
sudo chown odoo:odoo /var/log/odoo13

echo "\n---- Create startup script file ---"
sudo cat <<EOF > /etc/systemd/system/odoo13.service

[Unit]
Description=Odoo
Documentation=http://www.odoo.com/

[Service]
# Ubuntu/Debian convention:
Type=simple
User=odoo
ExecStart=/opt/odoo13/odoo/odoo-bin -c /etc/odoo-server.conf

[Install]
WantedBy=default.target

EOF

sudo chmod a+x /etc/systemd/system/odoo13.service

echo -e "\n---- Addons path ----"

echo -e "\n---- logfile ----"

echo -e "* Starting Odoo Service"
sudo systemctl start odoo13.service

echo -e "* Activating Odoo Service to autostart at boot time"
sudo systemctl enable odoo13.service