pip install checksumdir raven pysftp pyopenssl acme cryptography dnspython josepy
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-tools.git server-tools

pip install unidecode
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/bank-payment.git bank-payment

pip install num2words
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-payment.git account-payment

pip install Avalara
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-fiscal-rule.git account-fiscal-rule
 
pip install pyzbar pdf2image
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-ux.git server-ux

pip install freezegun
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/e-commerce.git e-commerce

pip install openupgradelib
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/management-system.git management-system

pip install -U email-validator==1.1.1
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/partner-contact.git partner-contact

pip install premailer extract-msg
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/social.git social

pip install -U bokeh==1.1.0 matplotlib==3.4.1 mpld3==0.3
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/web.git web

pip install -U sqlalchemy mysqlclient==2.0.1 pymssql
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-backend.git server-backend

# Unstable/Unverified Addons
pip install -U numpy==1.19.4 numpy-financial==1.0.0
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-financial-tools.git account-financial-tools

pip install -U pandas==0.22.0
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/ddmrp.git ddmrp

pip install -U cachetools==2.0.1
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/connector.git connector

pip install pycountry
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/community-data-files.git community-data-files

pip install PyPDF2 phonenumbers
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/edi.git edi

pip install freezegun
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/stock-logistics-workflow.git stock-logistics-workflow

ip install postgis
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/geospatial.git geospatial

#shapely==1.6.4.post2 cause an error
#pip install -U shapely==1.6.4.post2 geojson==2.4.1
pip install -U shapely geojson==2.4.1

#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/field-service.git field-service

pip install -U email_validator python-ldap==3.1.0 zxcvbn-python==4.4.24 python-jose pysaml2
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-auth.git server-auth

pip install pika
#sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/iot.git iot
