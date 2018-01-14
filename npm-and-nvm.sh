#!/bin/bash

# On installe nvm pour télécharger Node et le mettre à jour, la scotchbox possède une version de node trop ancienne
# on passe donc d'une 3.3.0 à une 9... après installation de NVM
# NVM permet de bypasser les problèmes rencontré avec une trop vieille version de NPM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# On met à jour NPM
sudo npm cache clean -f
sudo npm install -g npm