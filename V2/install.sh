#!/bin/bash

# /*=================================
# =            VARIABLES            =
# =================================*/
INSTALL_NGINX_INSTEAD=1
WELCOME_MESSAGE='
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░▓████████████████████████▒░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░▓█████▓▒░░░░░░░░░░░░░░░▒██████▒░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░████▒░░░░░░░░░░░░░░░░░░░░░░░░░▓███▒░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░
░░░░░░░░░░░░░▒██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██░░░░░░░░░░░░░░
░░░░░░░░░░░░▒██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░
░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░
░░░░░░░░░░░██▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░██░░░░░░░░░░░░
░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░
░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░
░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░
░░░░░░░░░░░██▒░██▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██▓░▒██░░░░░░░░░░░
░░░░░░░░░░░░██░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██░░░░░░░░░░░░
░░░░░░░░░░░░██▒░██░░░░░▒▒▓███▒░░░░░░░▒███▓▒▒░░░░░██░▓██░░░░░░░░░░░░
░░░░░░░░░░░░░██░██░░██████████▒░░░░░▓██████████░░██▒██░░░░░░░░░░░░░
░░░░░░░░░░░░░░████░████████████░░░░░████████████░████░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░███░▒██████████░░░░░░░██████████▒░██▒░░░░░░░░░▒░░░░░
░░░▒████░░░░░░░▓█▒░░█████████░░░░░░░░░█████████░░▒█▓░░░░░░▓████░░░░
░░░██░▒██▒░░░░░██░░░░██████▓░░░░█░█░░░░███████░░░░██░░░░░███░░██░░░
░░░██░░░██▓░░░░██░░░░░░▒▓▓░░░░▒██░██░░░░░▓▓▒░░░░░▒██░░░░███░░░██░░░
░▓██▒░░░░████▓░░██░░░░░░░░░░░░███░███░░░░░░░░░░░░██░░█████░░░░▓██▒░
██▓░░░░░░░░▒████████▓░░░░░░░░████░███▓░░░░░░░▒▓████████░░░░░░░░░███
██▓▒▓███▓░░░░░░▓████████▓░░░░████░███▓░░░░▓████████▓░░░░░░████▓▓███
░███████████▒░░░░░░███████░░░░██░░░██░░░░██████▓░░░░░░▓███████████░
░░░░░░░░░░▓█████░░░░██▓▓░██░░░░░░░░░░░░░██░█▒██░░░▒█████▓░░░░░░░░░░
░░░░░░░░░░░░░▒█████▒▒█▓█░███▓▓▒▒▒▓▒▒▓▓▓███▒███░▓█████░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░▒████▒▓█▒▒█░█▒█░█░█▓█▒█▓░█░█████▒░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░██░░██▓█▓█▓█▒█▒█▓█▓████░▓█▓░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░▓████▓░▓█▓█░█▒█░█░█▒█▒███▒░██████░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░▓█████░░██░░░▒█████▓█▓█████▒░░░██░▒█████▓░░░░░░░░░░░░░
░░░░▒██████████▓░░░░░███░░░░░░░░░░░░░░░░░░░██▒░░░░░▓██████████▒░░░░
░░░░██░░░▓▓▓░░░░░░▒██████▓░░░░░░░░░░░░░░░███████▒░░░░░░▓▓▒░░▒██░░░░
░░░░▓██░░░░░░░░▓████▓░░░█████▒░░░░░░▒▓█████░░░▓████▓░░░░░░░▒██▓░░░░
░░░░░░███░░░░████▒░░░░░░░░▓█████████████▒░░░░░░░░▒████░░░░███░░░░░░
░░░░░░░██░░░██▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓██░░░██░░░░░░░
░░░░░░░██▒▓██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██▒▓██░░░░░░░
░░░░░░░░████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

 _       __     __                             __  __            ___ 
| |     / /__  / /________  ____ ___  ___     / / / /___  ____  / (_)
| | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \   / /_/ / __ \/ __ \/ / / 
| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/  / __  / /_/ / /_/ / / /  
|__/|__/\___/_/\___/\____/_/ /_/ /_/\___/  /_/ /_/\____/\____/_/_/   
                                                                     


For help, please visit box.scotch.io or scotch.io. Follow us on Twitter @scotch_io and @whatnicktweets.
'

reboot_webserver_helper() {

    if [ $INSTALL_NGINX_INSTEAD != 1 ]; then
        sudo service apache2 restart
    fi

    if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
        sudo systemctl restart php7-fpm
        sudo systemctl restart nginx
    fi

    echo 'Rebooting your webserver'
}


# /*=========================================
# =            CORE / BASE STUFF            =
# =========================================*/
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y build-essential
sudo apt-get install -y tcl
sudo apt-get install -y software-properties-common
sudo apt-get install -y vim
sudo apt-get install -y git

# /*======================================
# =            INSTALL APACHE            =
# ======================================*/
if [ $INSTALL_NGINX_INSTEAD != 1 ]; then

    # Install the package
    sudo apt-get install -y apache2

    # Remove "html" and add public
    mv /var/www/html /var/www/public

    # Clean VHOST with full permissions
    MY_WEB_CONFIG='<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/public
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
        <Directory "/var/www/public">
            Options Indexes FollowSymLinks
            AllowOverride all
            Require all granted
        </Directory>
    </VirtualHost>'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/apache2/sites-available/000-default.conf

    # Squash annoying FQDN warning
    echo "ServerName scotchbox" | sudo tee /etc/apache2/conf-available/servername.conf
    sudo a2enconf servername

    # Enabled missing h5bp modules (https://github.com/h5bp/server-configs-apache)
    sudo a2enmod expires
    sudo a2enmod headers
    sudo a2enmod include
    sudo a2enmod rewrite

    sudo service apache2 restart

fi

# /*=====================================
# =            INSTALL NGINX            =
# =====================================*/
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then

    # Install Nginx
    sudo apt-get install -y nginx
    sudo systemctl enable nginx

    # Remove "html" and add public
    mv /var/www/html /var/www/public

    # Make sure your web server knows you did this...
    MY_WEB_CONFIG='server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/public;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
            try_files $uri $uri/ =404;
        }
    }'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/default

    sudo systemctl restart nginx

fi

# /*===================================
# =            INSTALL PHP            =
# ===================================*/
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y php7.0

# Make PHP and Apache friends
if [ $INSTALL_NGINX_INSTEAD != 1 ]; then

    sudo apt-get install -y libapache2-mod-php

    # Add index.php to readable file types
    MAKE_PHP_PRIORITY='<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
    </IfModule>'
    echo "$MAKE_PHP_PRIORITY" | sudo tee /etc/apache2/mods-enabled/dir.conf

    sudo service apache2 restart

fi

# Make PHP and NGINX friends
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then

    # FPM STUFF
    sudo apt-get install -y php7.0-fpm
    sudo systemctl enable php7.0-fpm
    sudo systemctl start php7.0-fpm

    # Fix path FPM setting
    echo 'cgi.fix_pathinfo = 0' | sudo tee -a /etc/php/7.0/fpm/conf.d/user.ini
    sudo systemctl restart php7.0-fpm

    # Add index.php to readable file types and enable PHP FPM since PHP alone won't work
    MY_WEB_CONFIG='server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/public;
        index index.php index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }

        location ~ /\.ht {
            deny all;
        }
    }'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/default

    sudo systemctl restart nginx

fi

# /*===================================
# =            PHP MODULES            =
# ===================================*/

# Base Stuff
sudo apt-get install -y php-common
sudo apt-get install -y php-all-dev

# Common Useful Stuff
sudo apt-get install -y php-bcmath
sudo apt-get install -y php-bz2
sudo apt-get install -y php-cgi
sudo apt-get install -y php-cli
sudo apt-get install -y php-fpm
sudo apt-get install -y php-imap
sudo apt-get install -y php-intl
sudo apt-get install -y php-json
sudo apt-get install -y php-mbstring
sudo apt-get install -y php-mcrypt
sudo apt-get install -y php-odbc
sudo apt-get install -y php-pear
sudo apt-get install -y php-pspell
sudo apt-get install -y php-tidy
sudo apt-get install -y php-xmlrpc
sudo apt-get install -y php-zip

# Enchant
sudo apt-get install -y libenchant-dev
sudo apt-get install -y php-enchant

# LDAP
sudo apt-get install -y ldap-utils
sudo apt-get install -y php-ldap

# CURL
sudo apt-get install -y curl
sudo apt-get install -y php-curl

# GD
sudo apt-get install -y libgd2-xpm-dev
sudo apt-get install -y php-gd

# IMAGE MAGIC
sudo apt-get install -y imagemagick
sudo apt-get install -y php-imagick


# /*===========================================
# =            CUSTOM PHP SETTINGS            =
# ===========================================*/
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    PHP_USER_INI_PATH=/etc/php/7.0/fpm/conf.d/user.ini
else
    PHP_USER_INI_PATH=/etc/php/7.0/apache2/conf.d/user.ini
fi

echo 'display_startup_errors = On' | sudo tee -a $PHP_USER_INI_PATH
echo 'display_errors = On' | sudo tee -a $PHP_USER_INI_PATH
echo 'error_reporting = E_ALL' | sudo tee -a $PHP_USER_INI_PATH
echo 'short_open_tag = On' | sudo tee -a $PHP_USER_INI_PATH
reboot_webserver_helper

# Disable PHP Zend OPcache
echo 'opache.enable = 0' | sudo tee -a $PHP_USER_INI_PATH

# Absolutely Force Zend OPcache off...
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/7.0/fpm/php.ini
else
    sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/7.0/apache2/php.ini
fi
reboot_webserver_helper

# /*================================
# =            PHP UNIT            =
# ================================*/
sudo wget https://phar.phpunit.de/phpunit-6.1.phar
sudo chmod +x phpunit-6.1.phar
sudo mv phpunit-6.1.phar /usr/local/bin/phpunit
reboot_webserver_helper

# /*=============================
# =            MYSQL            =
# =============================*/
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server
sudo mysqladmin -uroot -proot create scotchbox
sudo apt-get install -y php-mysql
reboot_webserver_helper


# /*=================================
# =            PostreSQL            =
# =================================*/
sudo apt-get install -y postgresql postgresql-contrib
echo "CREATE ROLE root WITH LOGIN ENCRYPTED PASSWORD 'root';" | sudo -i -u postgres psql
sudo -i -u postgres createdb --owner=root scotchbox
sudo apt-get install -y php-pgsql
reboot_webserver_helper
# JG : Penser a mettre a jour pour pgadmin les fichiers de config


# /*==============================
# =            SQLITE            =
# ===============================*/
sudo apt-get install -y sqlite
sudo apt-get install -y php-sqlite3
reboot_webserver_helper


# /*===============================
# =            MONGODB            =
# ===============================*/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

sudo tee /lib/systemd/system/mongod.service  <<EOL
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target
Documentation=https://docs.mongodb.org/manual

[Service]
User=mongodb
Group=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
EOL
sudo systemctl enable mongod
sudo service mongod start

# Enable it for PHP
sudo pecl install mongodb
sudo apt-get install -y php-mongodb
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    echo 'extension = mongo.so' | sudo tee -a /etc/php/7.0/fpm/conf.d/user.ini
else
    echo 'extension = mongo.so' | sudo tee -a /etc/php/7.0/apache2/conf.d/user.ini
fi

reboot_webserver_helper

# /*================================
# =            COMPOSER            =
# ================================*/
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
php composer-setup.php --quiet
rm composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod 755 /usr/local/bin/composer

# /*==================================
# =            BEANSTALKD            =
# ==================================*/
sudo apt-get install -y beanstalkd

# /*==============================
# =            WP-CLI            =
# ==============================*/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp


# /*=============================
# =            DRUSH            =
# =============================*/
wget http://files.drush.org/drush.phar
sudo chmod +x drush.phar
sudo mv drush.phar /usr/local/bin/drush

# /*=============================
# =            NGROK            =
# =============================*/
sudo apt-get install ngrok-client

# /*==============================
# =            NODEJS            =
# ==============================*/
sudo apt-get install -y nodejs
sudo apt-get install -y npm

# Use NVM though to make life easy
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 6.10.3

# Node Packages
sudo npm install -g gulp
sudo npm install -g grunt
sudo npm install -g bower
sudo npm install -g yo
sudo npm install -g browser-sync
sudo npm install -g browserify
sudo npm install -g pm2
sudo npm install -g webpack

# /*============================
# =            YARN            =
# ============================*/
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y yarn

# /*============================
# =            RUBY            =
# ============================*/
sudo apt-get install -y ruby
sudo apt-get install -y ruby-dev

# Use RVM though to make life easy
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4.1
rvm use 2.4.1

# /*=============================
# =            REDIS            =
# =============================*/
sudo apt-get install -y redis-server
sudo apt-get install -y php-redis
reboot_webserver_helper


# /*=================================
# =            MEMCACHED            =
# =================================*/
sudo apt-get install -y memcached
sudo apt-get install -y php-memcached
reboot_webserver_helper


# /*==============================
# =            GOLANG            =
# ==============================*/
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y golang-go

# /*===============================
# =            MAILHOG            =
# ===============================*/
sudo wget --quiet -O ~/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64
sudo chmod +x ~/mailhog

# Enable and Turn on
sudo tee /etc/systemd/system/mailhog.service <<EOL
[Unit]
Description=MailHog Service
After=network.service vagrant.mount
[Service]
Type=simple
ExecStart=/usr/bin/env /home/vagrant/mailhog > /dev/null 2>&1 &
[Install]
WantedBy=multi-user.target
EOL
sudo systemctl enable mailhog
sudo systemctl start mailhog

# Install Sendmail replacement for MailHog
sudo go get github.com/mailhog/mhsendmail
sudo ln ~/go/bin/mhsendmail /usr/bin/mhsendmail
sudo ln ~/go/bin/mhsendmail /usr/bin/sendmail
sudo ln ~/go/bin/mhsendmail /usr/bin/mail

# Make it work with PHP
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    echo 'sendmail_path = /usr/bin/mhsendmail' | sudo tee -a /etc/php/7.0/fpm/conf.d/user.ini
else
    echo 'sendmail_path = /usr/bin/mhsendmail' | sudo tee -a /etc/php/7.0/apache2/conf.d/user.ini
fi

reboot_webserver_helper

# /*=======================================
# =            WELCOME MESSAGE            =
# =======================================*/

# Disable default messages by removing execute privilege
sudo chmod -x /etc/update-motd.d/*

# Set the new message
echo "$WELCOME_MESSAGE" | sudo tee /etc/motd

# /*====================================
# =            YOU ARE DONE            =
# ====================================*/
echo 'Booooooooom! We are done. You are a hero. I love you.'
