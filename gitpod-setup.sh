echo "---- Install python libraries ----"
pip install -U setuptools==57.5.0 wheel #fix: use_2to3 compatibility issue
pip install gdata psycogreen ofxparse XlsxWriter
echo "---- Clone repository ----"
git clone --depth 1 --branch 13.0 https://github.com/OCA/OCB odoo13
echo "---- Install requirements ----"
pip install -U -r ./odoo13/requirements.txt
echo "Running Odoo..."
echo "./odoo-bin --addons-path=./addons --db_host 127.0.0.1" > ./odoo13/run.sh
sudo chmod +x ./odoo13/run.sh