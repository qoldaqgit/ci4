#! /bin/bash

#install minimum requirements
sudo apt install apache2  php libapache2-mod-php php8.1-mbstring php-intl php-mysql -y 
wget https://github.com/qoldaqgit/ci4/blob/main/create_project.sh
echo "To create you project: bash create_project.sh [[project name]]"
