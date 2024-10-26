#! /bin/bash

#to Install execute
# bash -c "$(wget -qLO - https://raw.githubusercontent.com/qoldaqgit/ci4/refs/heads/main/install_requirements.sh)"


#install minimum requirements
sudo apt update && sudo apt upgrade -y
sudo apt install apache2  php zip unzip php-zip php-curl libapache2-mod-php php8.1-mbstring php-intl php-mysql gh nano ssmtp git -y 
sudo apt install php-cli php-json php-mbstring php-xml php-pcov php-xdebug -y
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

#download CI4 installation scripts
wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/create_project.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/create_controller.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/uninstall_ci4.sh

clear

echo "
List of installed Software:

Apache2 - Web Server
PHP - Server Side code
gh - to get Github repositories
nano - Text file editor
ssmtp - Email sender, run sudo nano /etc/ssmtp/ssmtp.conf to add you config


List of Available Software:
CodeIgniter 4 - PHP Framework

To create your CI4 project: bash create_project.sh [[project name]]
To create your CI4 controller: bash create_controller.sh [[project name]] [[controller name]]

composer create-project codeigniter4/appstarter project-root-name

#To install Shield
composer require codeigniter4/shield
php spark shield:setup
"



if ! [[ "18.04 20.04 22.04 23.04" == *"$(lsb_release -rs)"* ]];
then
    echo "Ubuntu $(lsb_release -rs) is not currently supported for MS ODBC and MSSQL drivers.";
    exit;
fi

wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/ubuntu_ODBC18_driver.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/ubuntu_mssql_driver_php8.sh

echo "

ODBC18 Driver - run sudo bash ubuntu_ODBC18_driver.sh to install
MSSQL Driver - run sudo bash ubuntu_mssql_driver_php8.sh to install
"
#to log into a git repository
#gh auth login
#to get files from repo
#gh repo clone [user]/[repo]
