#https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=ubuntu18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline
if ! [[ "18.04 20.04 22.04 23.04" == *"$(lsb_release -rs)"* ]];
then
    echo "Ubuntu $(lsb_release -rs) is not currently supported.";
    exit;
fi

curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc

curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
# optional: for unixODBC development headers
sudo apt-get install -y unixodbc-dev

#https://learn.microsoft.com/en-us/sql/connect/php/installation-tutorial-linux-mac?view=sql-server-ver16
#Step 1. Install PHP
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php8.1 php8.1-dev php8.1-xml -y --allow-unauthenticated
sudo apt install php8.1-mbstring php-intl php-mysql nano ssmtp -y 

#Step 2. Install prerequisites
sudo apt-get install unixodbc-dev php-pear
pecl channel-update pecl.php.net

#Step 3. Install the PHP drivers for Microsoft SQL Server 
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv
sudo printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.1/mods-available/sqlsrv.ini
sudo printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.1/mods-available/pdo_sqlsrv.ini
sudo phpenmod -v 8.1 sqlsrv pdo_sqlsrv

#Step 4. Install Apache and configure driver loading
sudo apt-get install libapache2-mod-php8.1 apache2
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo a2enmod php8.1

#Step 5. Restart Apache and test the sample script
sudo service apache2 restart
