cd /var/www/
ls | grep -xv "html" | sudo xargs rm -r

cd /etc/apache2/sites-available/

 ls | grep -xv "000-default.conf" | grep -xv "default-ssl.conf" | sudo xargs rm -r

sudo a2ensite 000-default.conf
sudo a2enmod rewrite

sudo systemctl restart apache2
