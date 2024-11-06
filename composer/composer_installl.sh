#!/bin/bash

# bash -c "$(wget -qLO - https://raw.githubusercontent.com/qoldaqgit/ci4/refs/heads/main/composer/composer_installl.sh)"

sudo apt update && sudo apt upgrade -y
sudo apt install apache2  php zip unzip php-zip php-curl libapache2-mod-php php8.1-mbstring php-intl php-mysql gh nano ssmtp git -y 
sudo apt install php-cli php-json php-mbstring php-xml php-pcov php-xdebug -y
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
wget https://raw.githubusercontent.com/qoldaqgit/ci4/refs/heads/main/composer/createProject.sh
wget https://raw.githubusercontent.com/qoldaqgit/ci4/refs/heads/main/composer/createController.sh
wget https://raw.githubusercontent.com/qoldaqgit/ci4/refs/heads/main/uninstall_ci4.sh
clear

echo "
Composer installation complete
To create your CI4 project: bash createProject.sh [[project name]]
"
