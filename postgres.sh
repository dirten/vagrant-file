#!/bin/bash

# On met a jour les fichiers de configuration postgres que la connexion avec pgadmin se fasse facilement
sudo echo "host all all all password" | sudo tee -a /etc/postgresql/9.3/main/pg_hba.conf > /dev/null
sudo echo "listen_addresses = '*'"    | sudo tee -a /etc/postgresql/9.3/main/postgresql.conf > /dev/null