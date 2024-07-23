#https://learn.microsoft.com/en-us/sql/connect/php/installation-tutorial-linux-mac?view=sql-server-ver16
#Step 1. Install PHP
#sudo su
#add-apt-repository ppa:ondrej/php -y
#apt-get update
#apt-get install php8.1 php8.1-dev php8.1-xml -y --allow-unauthenticated

#Step 2. Install prerequisites
sudo apt-get install unixodbc-dev php-pear
pecl channel-update pecl.php.net

#Step 3. Install the PHP drivers for Microsoft SQL Server 
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv
sudo su
printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.1/mods-available/sqlsrv.ini
printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.1/mods-available/pdo_sqlsrv.ini
exit
sudo phpenmod -v 8.1 sqlsrv pdo_sqlsrv

#Step 4. Install Apache and configure driver loading
sudo su
#apt-get install libapache2-mod-php8.1 apache2
a2dismod mpm_event
a2enmod mpm_prefork
a2enmod php8.1
exit

#Step 5. Restart Apache and test the sample script
sudo service apache2 restart
