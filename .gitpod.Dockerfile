FROM gitpod/workspace-postgres

USER gitpod

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils  && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wkhtmltopdf

# ---- Install tool packages ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install wget git bzr python3-pip gdebi-core libpq-dev -y

# ---- Install python packages ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python-dateutil python-lxml python-mako python-pyparsing python-simplejson python-tz python-werkzeug-doc python-xlwt-doc python-yaml python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-decorator python-passlib python-pil apt-utils -y

# --- Other packages (Only ubuntu >= 18.04) ---
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python-pypdf2 python3-pypdf2 python3-lxml python-babel python3-babel -y

# ---- Install python packages LDAP based on OpenLDAP ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python-dev libldap2-dev libsasl2-dev gcc -y

# ---- Install zbar packages ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install zbar-tools -y

# ---- Install python libraries ----
# This is for compatibility with Ubuntu 16.04. Will work on 14.04, 15.04 and 16.04
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-suds -y

# --- Install other required packages (node, less) ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install node-clean-css node-less -y

# --- Install python libraries ---

#fix: use_2to3 compatibility issue
RUN pip install -U setuptools==57.5.0 wheel
# Install extra required packages
RUN pip install gdata psycogreen ofxparse XlsxWriter
# Install packages from requirements file
RUN pip install -U -r https://raw.githubusercontent.com/OCA/OCB/13.0/requirements.txt

# Already satisfied by Gitpod workspace
#RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs npm -y
#RUN sudo npm install -g less -y
#RUN sudo npm install -g less-plugin-clean-css -y
#RUN sudo ln -s /usr/bin/nodejs /usr/bin/node
