
```bash

echo -e "\n---- Update Server ----"
sudo apt-get update
sudo apt-get upgrade -y


WKHTMLTOX_X64=https://downloads.wkhtmltopdf.org/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb

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

# Install libssl libs
sudo apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev

sudo pip install gdata psycogreen ofxparse XlsxWriter

echo -e "\n--- Install other required packages"
sudo apt-get install node-clean-css -y
sudo apt-get install node-less -y
sudo apt-get install python-gevent -y

sudo apt-get install nodejs npm -y
sudo npm install -g less -y
sudo npm install -g less-plugin-clean-css -y
    
sudo ln -s /usr/bin/nodejs /usr/bin/node


sudo wget $WKHTMLTOX_X64
sudo gdebi --n `basename $WKHTMLTOX_X64`
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

sudo git clone --depth 1 --branch 13.0 https://github.com/OCA/OCB odoo13

```


# Fix 'root' postgres user issue
    1- Open Terminal and enter => sudo su postgres
    2- Enter password for postgres System user (if it is necessary)
    3- createuser root -s
    4- psql template1
    5- alter role root with password 'yourpassword';
    6- \q
    7- exit
    
source: https://www.odoo.com/forum/help-1/question/operationalerror-fatal-role-root-does-not-exist-123992


# Setup Odoo13

```
cd odoo13
pip3 install setuptools wheel
pip3 install -r requirements.txt
```

# Running Odoo13

```
sudo service postgresql restart
python3 odoo-bin --addons-path=addons

```
