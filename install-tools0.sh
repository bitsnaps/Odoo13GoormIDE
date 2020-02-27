echo -e "\n---- Install python packages ----"
sudo apt-get install python-suds python-dateutil python-feedparser python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-pypdf python-decorator python-requests python-passlib python-pil -y
	
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

