#! /bin/bash

#install minimum requirements
sudo apt update && sudo apt upgrade -y
sudo apt install apache2  php libapache2-mod-php php8.1-mbstring php-intl php-mysql gh nano ssmtp -y 

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
MSSQL Driver - run sudo bash uubuntu_mssql_driver_php8.sh to install
"
