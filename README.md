# Install Odoo 13 CE on GoormIDE

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/from-referrer/)

Use the `odoo-install.sh` script to install
```bash
sudo chmod +x odoo-install.sh
./odoo-install.sh
```

## Fix 'root' postgres user issue
    1- Open Terminal and enter => sudo su postgres
    2- Enter password for postgres System user (if it is necessary)
    3- createuser root -s
    4- psql template1
    5- alter role root with password 'yourpassword';
    6- \q
    7- exit
    
source: https://www.odoo.com/forum/help-1/question/operationalerror-fatal-role-root-does-not-exist-123992

## Setup Odoo13

```
cd /path/to/odoo13
pip3 install setuptools wheel
pip3 install -U -r requirements.txt
```

# Running Odoo13

```
sudo service postgresql restart
python3 odoo-bin --addons-path=addons

```
