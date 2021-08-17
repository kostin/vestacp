# vestacpim

rm -rf /opt/scripts
mkdir -p /opt/scripts

cd /opt/scripts
git clone https://github.com/kostin/vestacpim

chmod +x /opt/scripts/vestacpim/*.sh
yes | cp -aRf /opt/scripts/vestacpim/php-nginx/* /usr/local/vesta/data/templates/web/nginx/php-fpm/
yes | cp -aRf /opt/scripts/vestacpim/php-mod/* /usr/local/vesta/data/templates/web/httpd/
yes | cp -aRf /opt/scripts/vestacpim/nginx/* /usr/local/vesta/data/templates/web/nginx/

chmod 751 /usr/local/vesta/data/templates/web/httpd/*.sh
