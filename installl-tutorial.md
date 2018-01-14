### procédure d'installation d'une VM scotchbox

##Etape 1 :
Télécharger virtual box
Télécharcher vagrant

##Etape2 - Installer cette box
https://app.vagrantup.com/scotch/boxes/box

en faisant tout simplement
git clone https://github.com/scotch-io/scotch-box [Mon-projet-name]
PUIS suivi de 
vagrant up

De là sur l'ip 192.168.33.10 nous pouvons voir si l'installation a réussi et ce qu'il y as d'installé sur la machine

19/12/2017 un bug sur les versions de PHP7 ne nous permettent pas de l'utiliser complètement il faut donc ensuite se connecter avec vagrant ssh puis de faire ceci (pour PHP 7.0):

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get -y install php7.0
sudo apt-get -y install php-xml
sudo apt-get install php7.0-xml
sudo apt-get install libapache2-mod-php7.0 libphp7.0-embed libssl-dev openssl php7.0-cgi php7.0-cli php7.0-common php7.0-dev php7.0-fpm php7.0-phpdbg
Normalement a partir de ce moment nous devrions avoir une machine fonctionnelle

##Etape 3
Ci dessous une mise a jour a mettre dans le VagrantFile pour éviter de faire des opérations manuelles a chaque nouvelle mouture. (installation de PHP 7.1)

    # -*- mode: ruby -*-
    # vi: set ft=ruby :
    Vagrant.configure("2") do |config|
    
    # This is Scotch Box 3.0 (the free version)
    # _________________________________________
    # If you want PHP7, MySQL 5.7, Ubuntu 16.04, Build Scripts (customize your own boxes in minutes)...
    # ... an NGINX version, PHPUnit, Yarn, WebPack, improved email testing with MailHog...
    # ... generally Higher versions of things, Ruby (via RVM), Node (via NVM), WebPack ready, and more.
    
    # Just go to https://box.scotch.io/pro
    # Your support will help keep this project alive!
    config.ssh.username = "vagrant"
    config.ssh.password = "vagrant"

    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
    end
    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "projects"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    
    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
    config.vm.provision "shell", inline: <<-SHELL
            sudo add-apt-repository ppa:ondrej/php
            sudo apt-get update
            sudo apt-get install -y php7.1 php7.1-xml php7.1-mysql php7.1-curl php7.1-mbstring php7.1-zip

            sudo a2dismod php7.0
            sudo a2enmod php7.1
            sudo service apache2 restart
        SHELL
    end

### Création du VHOST
Aller dans etc/apache2/sites-available
copier le scotchbox.local.conf et adapter le vhost a ce que vous voulez

Aller ensuite coller dans le host de votre machine hote le serverName de votre vhost avec l'ip 192.168.33.10
A l'issue du VHOST vous devriez pouvoir accéder a votre site depuis son DNS.


### Configuration de heidi SQL
Connexion via tunnel SSH avec donc les identifiants ci-dessus et l'adresse ip ci-dessus
Et puis c'est tout.


### Configuration de postgreSQL
sudo nano /etc/postgresql/9.3/main/pg_hba.conf => host all all all password
sudo nano /etc/postgresql/9.3/main/postgresql.conf => listen_addresses = '*'

(faire gaffe aux quoite simple)
Redemarrer la box (vagrant halt + up).