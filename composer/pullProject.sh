                                                              
#!/bin/bash
#installer 
# bash -c "$(wget -qLO - https://raw.githubusercontent.com/qoldaqgit/ci4/refs/heads/main/composer/pullProject.sh )"

#Project name $1



#set Variables
project=$(echo $1 | tr '[:upper:]' '[:lower:]')
#version=$(echo '4.5.3')
ip=$(ip a | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
$repository=$2
#(echo 'https://gitea.qoldaq.duckdns.org/Project-Car/core.git')


#echo $repository

#Install CI4 with compose
#mkdir /var/www/$project
#composer create-project codeigniter4/appstarter $project

cd /var/www/
git clone $repository
#https://gitea.qoldaq.duckdns.org/Project-Car/core.git
cd $project
composer install
sudo chown -R $USER /var/www/$project
sudo chown -R www-data /var/www/$project/writable/
git remote add origin $repository
#https://gitea.qoldaq.duckdns.org/Project-Car/core.git

sudo touch /etc/apache2/sites-available/$project.conf

echo '
<VirtualHost *:80>

        DocumentRoot /var/www/'$project'/public
        <Directory /var/www/'$project'/public>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' | sudo tee -a /etc/apache2/sites-available/$project.conf > /dev/null

sudo a2ensite $project.conf
sudo a2dissite 000-default.conf
sudo a2enmod rewrite

sudo systemctl restart apache2


#Setup Dev Env
touch /var/www/$project/.env
echo "CI_ENVIRONMENT = development
app.baseURL = http://$ip
# database.default.hostname = 10.8.0.3
# database.default.database = ci4
# database.default.username = newuser
# database.default.password = password" > /var/www/$project/.env
