#!/bin/sh
# Log in as the root user
su

# Create a password for SQL server
echo "Enter a password for the SQL server"
read -s sqlPass

# Update the operating system
sudo apt update --assume-yes

# Install Apache, PHP & MySQL
sudo apt install apache2 php libapache2-mod-php php-fpm php-pear php-mysql --assume-yes

# Enter the password for & install SQL server
run bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password password $sqlPass"'
run bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $sqlPass"'
sudo apt install mysql-server --assume-yes
mysql_secure_installation

# Create a web page
echo "Enter a domain name for the web page (without '.com')"
read webPageName

# Create an HTML file for the web page
sudo mkdir -p /var/www/${webPageName}.local/public_html
sudo chown -R $USER:$USER /var/www/${webPageName}.local/public_html
sudo chmod -R 755
sudo echo "<html> \
        \n <head> \
        \n <title>${webPageName}</title> \
        \n </head> \
        \n <body>Hello! Welcome to ${webPageName}</body> \
        \n </html> " >> /var/www/${webPageName}.local/public_html/index.html

# Finalize the configuration files for the web page
sudo echo "<VirtualHost *:80> \
               \n\t ServerAdmin info@${webPageName}.local \
               \n\t ServerName ${webPageName}.local \
               \n\t ServerAlias www.${webPageName}.local \
               \n\t DocumentRoot /var/www/${webPageName}.local/public_html \
               \n\t ErrorLog ${APACHE_LOG_DIR}/error.log \
               \n\t CustomLog ${APACHE_LOG_DIR}/access.log combined \
               \n <VirtualHost>" >> /etc/apache2/sites-available/${webPageName}.local.conf
sudo echo "Enter an IP address to access your webpage"
read ipAddress
sudo echo "${ipAddress} ${webPageName}.local" >> /etc/hosts
sudo a2dissite /etc/apache2/sites-available/000-default.conf
sudo service apache2 restart
sudo a2ensite /etc/apache2/sites-available/${webPageName}.local.conf

# Open the web page in a web browser
sudo firefox $ipAddress
