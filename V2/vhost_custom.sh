#!/bin/bash

MY_WEB_CONFIG='server {
        listen 80;
        listen [::]:80;

        root /var/www/website/public;
        index index.php index.html index.htm index.nginx-debian.html;

        server_name website.local website.local;

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
    echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/website.local
    sudo ln -s /etc/nginx/sites-available/website.local /etc/nginx/sites-enabled
