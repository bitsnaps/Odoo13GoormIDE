#!/bin/bash
################################################################################
# Script for installing Odoo V10 on Ubuntu 16.04, 15.04, 14.04 
# Author: Yenthe Van Ginneken
# Adjusted: Ray Carnes
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
WKHTMLTOX_X64=https://downloads.wkhtmltopdf.org/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
WKHTMLTOX_X32=https://downloads.wkhtmltopdf.org/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-i386.deb

#--------------------------------------------------
# Update Server
#--------------------------------------------------
echo -e "\n---- Update Server ----"
sudo apt-get update
sudo apt-get upgrade -y
#--------------------------------------------------
# Install PostgreSQL Server
#--------------------------------------------------
service postgres status
if [ "$?" -gt "0" ]; then
  echo -e "\n---- Install PostgreSQL Server ----"
  sudo apt-get install postgresql -y
else
  echo -e "\n---- PostgreSQL Server already installed - skipping install ----"
fi
echo -e "\n---- Creating the ODOO PostgreSQL User  ----"
sudo su - postgres -c "createuser -s odoo" 2> /dev/null || true
#--------------------------------------------------
# Install Dependencies
#--------------------------------------------------
echo -e "\n---- Install tool packages ----"
sudo apt-get install wget subversion git bzr bzrtools python-pip gdebi-core -y
	
echo -e "\n---- Install python packages ----"
sudo apt-get install python-suds python-dateutil python-feedparser python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-pypdf python-decorator python-requests python-passlib python-pil -y
	
# Removed libs
#sudo apt-get remove python-werkzeug
#sudo apt-get remove python-ldap

# then I reinstalled libssl libs
sudo apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev


echo -e "\n---- Install python libraries ----"
sudo pip install gdata psycogreen ofxparse XlsxWriter

echo -e "\n--- Install other required packages"
sudo apt-get install node-clean-css -y
sudo apt-get install node-less -y
sudo apt-get install python-gevent -y

sudo apt-get install nodejs npm -y
sudo npm install -g less -y
sudo npm install -g less-plugin-clean-css -y
    
sudo ln -s /usr/bin/nodejs /usr/bin/node

echo -e "\n---- Install wkhtml and place shortcuts on correct place for ODOO 10 ----"
#pick up correct one from x64 & x32 versions:
if [ "`getconf LONG_BIT`" == "64" ];then
    _url=$WKHTMLTOX_X64
else
    _url=$WKHTMLTOX_X32
fi
sudo wget $_url
sudo gdebi --n `basename $_url`
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

#sudo git clone --depth 1 --branch 10.0 https://www.github.com/bistaray/odoo /opt/odoo10/odoo
#sudo git clone --depth 1 --branch 10.0 https://www.github.com/bistaray/enterprise /opt/odoo10/enterprise
# Replaced by:
sudo git clone --depth 1 --branch 13.0 https://github.com/OCA/OCB /opt/odoo13/odoo

#sudo cp /opt/odoo10/odoo/debian/odoo.conf /etc/odoo-server.conf
sudo cp /opt/odoo13/odoo/debian/odoo.conf /etc/odoo-server.conf

echo -e "\n---- Create Log directory ----"
#sudo mkdir /var/log/odoo10
sudo mkdir /var/log/odoo13
#sudo chown odoo:odoo /var/log/odoo10
sudo chown odoo:odoo /var/log/odoo13

echo "\n---- Create startup script file ---"
sudo cat <<EOF > /etc/systemd/system/odoo10.service

[Unit]
Description=Odoo
Documentation=http://www.odoo.com/

[Service]
# Ubuntu/Debian convention:
Type=simple
User=odoo
ExecStart=/opt/odoo10/odoo/odoo-bin -c /etc/odoo-server.conf

[Install]
WantedBy=default.target

EOF

sudo chmod a+x /etc/systemd/system/odoo10.service

echo -e "\n---- Addons path ----"

echo -e "\n---- logfile ----"

echo -e "* Starting Odoo Service"
#sudo systemctl start odoo10.service
sudo systemctl start odoo13.service

echo -e "* Activating Odoo Service to autostart at boot time"
#sudo systemctl enable odoo10.service
sudo systemctl enable odoo13.service