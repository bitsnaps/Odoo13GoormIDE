OE_VERSION="13.0"

# depends on: [server-env]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-tools.git server-tools
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-payment.git account-payment
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-fiscal-rule.git account-fiscal-rule
# requires: [unidecode]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/bank-payment.git bank-payment
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-reconcile.git account-reconcile
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/bank-statement-import.git bank-statement-import
# depends on: [product-attribute, stock-logistics-warehouse, account-invoicing, server-tools, partner-contact, stock-logistics-workflow, bank-payment]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/sale-workflow.git sale-workflow

git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/commission.git commission
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/crm.git crm
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/e-commerce.git e-commerce
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/event.git event

git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/knowledge.git knowledge
#depends on: [knowledge]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/management-system.git management-system
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/margin-analysis.git margin-analysis
# requires: [email-validator==1.1.1]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/partner-contact.git partner-contact

git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/pos.git pos
# depends on: [project-reporting, server-tools, timesheet]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/project.git project
# depends on: [reporting-engine, stock-logistics-warehouse]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/product-attribute.git product-attribute
# depends on: [server-tools, server-backend]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/reporting-engine.git reporting-engine
# requires: [premailer, extract-msg], depends on: [server-tools, web]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/social.git social
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/website.git website
# requires: [bokeh==1.1.0, matplotlib==3.4.1, mpld3==0.3], depends on: [sale-workflow]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/web.git web

git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-ux.git server-ux

# requires: [--pre odoo11-addon-mis_builder (error!)], depends on: [web,server-ux,reporting-engine]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/mis-builder.git mis-builder
# requires: [sqlalchemy, mysqlclient==2.0.1, pymssql]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-backend.git server-backend
# depends on: [queue, server-tools, server-ux, server-backend, product-attribute, stock-logistics-workflow]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-invoicing.git account-invoicing

# depends on: [contract]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/brand.git brand
# depends on: [brand, server-ux, product-attribute]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/purchase-workflow.git purchase-workflow
# depends on: [product-attribute, purchase-workflow, stock-logistics-warehouse, management-system]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/manufacture.git manufacture

# Accounting
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-closing.git account-closing


# Business Requirement Deliverable
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/business-requirement.git business-requirement


# Unstable/Unverified Addons
# requires: [checksumdir, raven, pysftp, pyopenssl, acme, cryptography, dnspython, josepy], depends on: [server-env]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-tools.git server-tools
# requires: [numpy<=1.19.4, numpy-financial<=1.0.0], depends on: [server-ux, reporting-engine, stock-logistics-warehouse]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-financial-tools.git account-financial-tools
# depends on: [account-financial-tools]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-analytic.git account-analytic
# depends on: [sale-workflow]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/queue.git queue
# depends on: [bank-payment, sale-reporting]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/contract.git contract
# depends on: [contract, server-tools]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/maintenance.git maintenance
# requires: [pandas>=0.22.0], depends on: [stock-logistics-warehouse, web, manufacture, server-tools]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/ddmrp.git ddmrp
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-env.git server-env
# depends on: [account-analytic, connector, product-attribute, sale-workflow, server-env, server-ux, web, wms]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/stock-logistics-warehouse.git stock-logistics-warehouse
# depends on: [reporting-engine, manufacture]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/manufacture-reporting.git manufacture-reporting
# requires: [cachetools>=2.0.1], depends on: [queue]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/connector.git connector
# requires: [pycountry], depends on: [bank-payment]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/community-data-files.git community-data-files
# requires: [PyPDF2, phonenumbers], depends on: [partner-contact, community-data-files, server-tools, bank-payment, sale-workflow]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/edi.git edi
# depends on: [web]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/product-variant.git product-variant
# depends on: [mis-builder]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/operating-unit.git operating-unit
# requires: [freezegun], depends on: [product-attribute, stock-logistics-warehouse, partner-contact, server-tools]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/stock-logistics-workflow.git stock-logistics-workflow
# depends on: [stock-logistics-workflow]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/account-invoice-reporting.git account-invoice-reporting
# depends on: [account-invoice-reporting]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/sale-reporting.git sale-reporting
# requires: [postgis]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/geospatial.git geospatial
# requires: [shapely==1.6.4.post2, geojson==2.4.1], depends on: [contract, geospatial, hr, web]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/field-service.git field-service
# depends on: [server-ux, reporting-engine, sale-reporting]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/stock-logistics-reporting.git stock-logistics-reporting
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/currency.git currency
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/stock-logistics-transport.git stock-logistics-transport
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/project-reporting.git project-reporting
# requires [odoo-test-helper, python-barcode, barcodenumber], depends on: [product-attribute, stock-logistics-warehouse]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/stock-logistics-barcode.git stock-logistics-barcode
# requires: [email_validator python-ldap==3.1.0 zxcvbn-python==4.4.24 python-jose pysaml2], depends on: [server-env]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-auth.git server-auth

# depends on: [product-attribute, rest-framework, server-auth, server-tools, stock-logistics-workflow, stock-logistics-warehouse, web]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/wms.git wms

# DeBranding Server
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/server-brand.git server-brand

# HR
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/hr.git hr

# Hotel & Restaurant Management
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/vertical-hotel.git vertical-hotel

# Helpdesk
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/helpdesk.git helpdesk

# Muk
git clone --depth 1 --branch $OE_VERSION https://github.com/muk-it/muk_base.git muk_base
# depends on: [muk_base]
git clone --depth 1 --branch $OE_VERSION https://github.com/muk-it/muk_web.git muk_web
# depends on: [muk_base, muk_web]
git clone --depth 1 --branch $OE_VERSION https://github.com/muk-it/muk_dms.git muk_dms
# depends on: [muk_base, muk_web, muk_misc, muk_dms]
git clone --depth 1 --branch $OE_VERSION https://github.com/muk-it/muk_quality.git muk_quality

# Timesheet
# depends on: [project, web]
git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/timesheet.git timesheet

# Beta


# requires: [cerberus pyquerystring parse-accept-language jsondiff graphene graphql-server-core marshmallow marshmallow-objects>=2.0.0 apispec], depends on: [connector]
#git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/rest-framework.git rest-framework

# Extra
#git clone --depth 1 --branch $OE_VERSION https://github.com/pledra/odoo-product-configurator.git product-configurator
#git clone --depth 1 --branch $OE_VERSION https://github.com/dhongu/deltatech.git deltatech
#git clone --depth 1 --branch $OE_VERSION https://github.com/robinhli/Oddapps.git dashu-tech

# Unstable
#git clone --depth 1 --branch $OE_VERSION https://github.com/guohuadeng/app-odoo.git sunpop
