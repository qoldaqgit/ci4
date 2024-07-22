#! /bin/bash

#install minimum requirements
sudo apt update && sudo apt upgrade -y
sudo apt install apache2  php libapache2-mod-php php8.1-mbstring php-intl php-mysql -y 
wget https://raw.githubusercontent.com/qoldaqgit/ci4/main/create_project.sh
wget https://raw.githubusercontent.com/qoldaqgit/ci4/main/create_controller.sh

echo "To create your project: bash create_project.sh [[project name]]"
echo "To create your controller: bash create_controller.sh [[project name]] [[controller name]]"
