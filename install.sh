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

'

reboot_webserver_helper() {

    if [ $INSTALL_NGINX_INSTEAD != 1 ]; then
        sudo service apache2 restart
    fi

    if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
        sudo systemctl restart php7.1-fpm
        sudo systemctl restart nginx
    fi

    echo 'Rebooting your webserver'
}


# /*=========================================
# =            CORE / BASE STUFF            =
# =========================================*/
sudo apt-get install -y apt-transport-https
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
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update
sudo apt-get install -y php7.1

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
    sudo apt-get install -y php7.1-fpm
    sudo systemctl enable php7.1-fpm
    sudo systemctl start php7.1-fpm

    # Fix path FPM setting
    echo 'cgi.fix_pathinfo = 0' | sudo tee -a /etc/php/7.1/fpm/conf.d/user.ini
    sudo systemctl restart php7.1-fpm

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
            fastcgi_pass unix:/run/php/php7.1-fpm.sock;
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
# sudo apt-get install -y php-common
# sudo apt-get install -y php-all-dev

# Common Useful Stuff
sudo apt-get install -y php7.1-bcmath
sudo apt-get install -y php7.1-bz2
sudo apt-get install -y php7.1-cgi
sudo apt-get install -y php7.1-cli
sudo apt-get install -y php7.1-imap
sudo apt-get install -y php7.1-intl
sudo apt-get install -y php7.1-json
sudo apt-get install -y php7.1-mbstring
sudo apt-get install -y php7.1-mcrypt
sudo apt-get install -y php7.1-odbc
sudo apt-get install -y php7.1-pear
sudo apt-get install -y php7.1-pspell
sudo apt-get install -y php7.1-tidy
sudo apt-get install -y php7.1-xmlrpc
sudo apt-get install -y php7.1-zip
sudo apt-get install -y php7.1-xml
sudo apt-get install -y php7.1-xdebug

# Enchant
sudo apt-get install -y libenchant-dev
sudo apt-get install -y php7.1-enchant

# LDAP
sudo apt-get install -y ldap-utils
sudo apt-get install -y php7.1-ldap

# CURL
sudo apt-get install -y curl
sudo apt-get install -y php7.1-curl

# GD
sudo apt-get install -y libgd2-xpm-dev
sudo apt-get install -y php7.1-gd

# IMAGE MAGIC
sudo apt-get install -y imagemagick
sudo apt-get install -y php7.1-imagick


# /*===========================================
# =            CUSTOM PHP SETTINGS            =
# ===========================================*/
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    PHP_USER_INI_PATH=/etc/php/7.1/fpm/conf.d/user.ini
else
    PHP_USER_INI_PATH=/etc/php/7.1/apache2/conf.d/user.ini
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
    sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/7.1/fpm/php.ini
else
    sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/7.1/apache2/php.ini
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
sudo apt-get install -y php7.1-mysql
reboot_webserver_helper


# /*=================================
# =            PostreSQL            =
# =================================*/
sudo apt-get install -y postgresql postgresql-contrib
echo "CREATE ROLE root WITH LOGIN ENCRYPTED PASSWORD 'root';" | sudo -i -u postgres psql
echo "ALTER ROLE root WITH CREATDB;" | sudo -i -u postgres psql
sudo -i -u postgres createdb --owner=root hooli
sudo apt-get install -y php7.1-pgsql
# On met a jour les fichiers de configuration postgres que la connexion avec pgadmin se fasse facilement
sudo echo "host all all all password" | sudo tee -a /etc/postgresql/9.4/main/pg_hba.conf > /dev/null
sudo echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/9.4/main/postgresql.conf > /dev/null
reboot_webserver_helper


# /*==============================
# =            SQLITE            =
# ===============================*/
sudo apt-get install -y sqlite
sudo apt-get install -y php7.1-sqlite3
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
sudo apt-get install -y php7.1-mongodb
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    echo 'extension = mongo.so' | sudo tee -a /etc/php/7.1/fpm/conf.d/user.ini
else
    echo 'extension = mongo.so' | sudo tee -a /etc/php/7.1/apache2/conf.d/user.ini
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
# Utile pour Drupal
# wget http://files.drush.org/drush.phar
# sudo chmod +x drush.phar
# sudo mv drush.phar /usr/local/bin/drush

# /*=============================
# =            NGROK            =
# =============================*/
# sudo apt-get install ngrok-client

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
# sudo npm install -g gulp
# sudo npm install -g grunt
# sudo npm install -g bower
# sudo npm install -g yo
# sudo npm install -g browser-sync
# sudo npm install -g browserify
# sudo npm install -g pm2
# sudo npm install -g webpack

# /*============================
# =            YARN            =
# ============================*/
# sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo apt-get update
# sudo apt-get install -y yarn

# /*============================
# =            RUBY            =
# ============================*/
sudo apt-get install -y ruby
sudo apt-get install -y ruby-dev

# Use RVM though to make life easy
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4.1
rvm use 2.4.1

# /*======================
# =            JAVA      =
# ======================*/
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo bash -c "echo deb http://http.debian.net/debian jessie-backports main >> /etc/apt/sources.list"
sudo bash -c "echo deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list"
sudo bash -c "echo deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/webupd8team-java.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
sudo apt-get -y upgrade

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selectionssudo 

sudo apt-get -y install oracle-java8-installer oracle-java8-set-default

# /*===============================
# =            ELASTICSEARCH      =
# ===============================*/
# https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html#deb-running-systemd
# https://www.it-connect.fr/installer-java-sous-debian-8-via-apt-get/
# Port used 9200
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update
sudo apt-get install elasticsearch
# Démarre automatiquement elastisearch au boot via un daemon
sudo /bin/systemctl daemon-reload

   ELASTIC_CONFIG='
cluster.name: "hooli"
node.name: "node-1"
network.host: "192.168.33.10"
network.bind_host: "0.0.0.0"
network.publish_host: "0.0.0.0"
http.port: 9200
'
    echo "$ELASTIC_CONFIG" | sudo tee -a /etc/elasticsearch/elasticsearch.yml

sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
# changer les Heaps 512m pour elastic dans sudo vim /etc/elasticsearch/jvm.options

# /*=============================
# =            LOGSTASH         =
# =============================*/
sudo apt-get install -y logstash


MY_LOGSTASH_NGINX_LOG = 'input {
  file { path => "/home/vagrant/access_log"}
}
filter {
    grok {
      match => { "message" => ["%{IPORHOST:[nginx][access][remote_ip]} - %{DATA:[nginx][access][user_name]} \[%{HTTPDATE:[nginx][access][time]}\] \"%{WORD:[nginx][access][method]} %{DATA:[nginx][access][url]} HTTP/%{NUMBER:[nginx][access][http_version]}\" %{NUMBER:[nginx][access][response_code]} %{NUMBER:[nginx][access][body_sent][bytes]} \"%{DATA:[nginx][access][referrer]}\" \"%{DATA:[nginx][access][agent]}\""] }
      remove_field => "message"
    }
    mutate {
      add_field => { "read_timestamp" => "%{@timestamp}" }
    }
    date {
      match => [ "[nginx][access][time]", "dd/MMM/YYYY:H:m:s Z" ]
      remove_field => "[nginx][access][time]"
    }
    useragent {
      source => "[nginx][access][agent]"
      target => "[nginx][access][user_agent]"
      remove_field => "[nginx][access][agent]"
    }
    geoip {
      source => "[nginx][access][remote_ip]"
      target => "[nginx][access][geoip]"
    }
}
output {
  elasticsearch {
    hosts => "localhost:9200"
    manage_template => false
    index => "logstash-nginx-website-local"
  }
}'
echo "$MY_LOGSTASH_NGINX_LOG" | sudo tee /etc/logstash/conf.d/website.local.conf

sudo systemctl enable logstash.service
sudo systemctl start logstash.service

# sudo -E /etc/logstash/conf.d/website.local.conf
# Y coller les pipeline de notre dossier logstash
# changer les Heaps 512m pour logstash dans sudo vim /etc/logstash/jvm.options
# https://www.youtube.com/watch?v=IJ1IkALLChI&t=656s

# /*=============================
# =            KIBANA           =
# =============================*/
sudo apt-get install -y kibana

# /*=============================
# =            REDIS            =
# =============================*/
sudo apt-get install -y redis-server
sudo apt-get install -y php7.1-redis
reboot_webserver_helper


# /*=================================
# =            MEMCACHED            =
# =================================*/
sudo apt-get install -y memcached
sudo apt-get install -y php7.1-memcached
reboot_webserver_helper


# /*==============================
# =            GOLANG            =
# ==============================*/
# Nécessaire pour MailHog
sudo wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
sudo tar -xvf go1.9.2.linux-amd64.tar.gz
sudo mv go /etc/
sudo -u vagrant mkdir ~/gocode


# /*===============================
# =            MAILHOG            =
# ===============================*/
go get github.com/mailhog/MailHog

# Ne marche pas via le VagrantFile
# Enable and Turn on
sudo tee /etc/systemd/system/mailhog.service <<EOL
[Unit]
Description=MailHog Service
After=network.service vagrant.mount
[Service]
Type=simple
ExecStart=/usr/bin/env /home/vagrant/gocode/bin/MailHog > /dev/null 2>&1 &
[Install]
WantedBy=multi-user.target
EOL
sudo systemctl enable mailhog
sudo systemctl start mailhog

# Install Sendmail replacement for MailHog
go get github.com/mailhog/mhsendmail
sudo ln ~/gocode/bin/mhsendmail /usr/bin/mhsendmail
sudo ln ~/gocode/bin/mhsendmail /usr/bin/sendmail
sudo ln ~/gocode/bin/mhsendmail /usr/bin/mail

# Make it work with PHP
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    echo 'sendmail_path = /usr/bin/mhsendmail' | sudo tee -a /etc/php/7.1/fpm/conf.d/user.ini
else
    echo 'sendmail_path = /usr/bin/mhsendmail' | sudo tee -a /etc/php/7.1/apache2/conf.d/user.ini
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
