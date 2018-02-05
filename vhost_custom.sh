#!/bin/bash

MY_WEB_CONFIG='server {
        listen 80;
        listen [::]:80;

        root /var/www/website/public;
        index index.html index.htm index.nginx-debian.html;
        access_log /home/vagrant/access_log;

        server_name website.local website.local;

        location / {
            try_files $uri $uri/ =404;
        }
    }'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/website.local
    sudo ln -s /etc/nginx/sites-available/website.local /etc/nginx/sites-enabled

MY_KIBANA_CONFIG="server {
    listen 80;
    server_name elk.local;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}"
    echo "$MY_KIBANA_CONFIG" | sudo tee /etc/nginx/sites-available/kibana.local
    sudo ln -s /etc/nginx/sites-available/kibana.local /etc/nginx/sites-enabled
