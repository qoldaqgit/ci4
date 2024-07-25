#! /bin/bash

#install minimum requirements
sudo apt update && sudo apt upgrade -y
sudo apt install apache2  php libapache2-mod-php php8.1-mbstring php-intl php-mysql gh nano ssmtp -y 
wget https://raw.githubusercontent.com/qoldaqgit/ci4/main/create_project.sh
wget https://raw.githubusercontent.com/qoldaqgit/ci4/main/create_controller.sh

echo "To create your project: bash create_project.sh [[project name]]"
echo "To create your controller: bash create_controller.sh [[project name]] [[controller name]]"

clear

echo "List of installed Software:\n
Apache2 - Web Server\n
PHP - Server Side code\n
gh - to get Github repositories\n
nano - Text file editor\n
ssmtp - Email sender\n"



if ! [[ "18.04 20.04 22.04 23.04" == *"$(lsb_release -rs)"* ]];
then
    echo "Ubuntu $(lsb_release -rs) is not currently supported for MS ODBC and MSSQL drivers.";
    exit;
fi

wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/ubuntu_ODBC18_driver.sh
wget -q https://raw.githubusercontent.com/qoldaqgit/ci4/main/ubuntu_mssql_driver_php8.sh

echo "List of AAvailable Software:\n
ODBC18 Driver - run sudo bash ubuntu_ODBC18_driver.sh to install\n
MSSQL Driver - run sudo bash uubuntu_mssql_driver_php8.sh to install\n"
