# -*- mode: ruby -*-
# vi: set ft=ruby :

$set_environment_variables = <<SCRIPT
sudo tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF

export GOPATH=/home/vagrant/gocode
export GOROOT=/etc/go
export PATH=/home/vagrant/gocode/bin:/etc/go/bin:$PATH
export APPLICATION_ENV=development

EOF
SCRIPT

# Config
Vagrant.configure("2") do |config|
    config.vm.box = "bento/debian-8.7"

    # Stats de la machine
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
      # On veut une UI ou pas false par défaut
      v.gui = false

      v.name = "hooli_dev_vm_debian_8"
    end

    config.vm.hostname = "hooli"
    config.vm.network "forwarded_port", guest: 80, host: 8090
    config.vm.network "forwarded_port", guest: 9200, host: 9200
    config.vm.network "forwarded_port", guest: 1025, host: 1025
    #MySQL
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    # Kibana
    config.vm.network "forwarded_port", guest: 5601, host: 5601
    config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "127.0.0.1", id: 'ssh'

    config.vm.network "private_network", ip: "192.168.33.10"

    # Rsync performant, permettant la synchro one-way (de host => guest) l'inverse pas possible
    # Rsync avec le owner et le group www-data
    config.vm.synced_folder ".",
        "/var/www",
        type: "rsync",
        rsync_auto: true,
        rsync__exclude: [".git/", ".idea/", ".build/", '.vagrant/', '.vendor/', '.public/assets'],
        group:"www-data",
        :owner=> 'www-data',
        :mount_options => ["dmode=777","fmode=666"]

    # Sync de type NFS pour le dossier assets généré côté guest afin qu'il redescende côté host et éviter les desync
    config.vm.synced_folder "./website/public/assets/", "/var/www/website/public/assets", :mount_options => ["dmode=777","fmode=666"]
   
    
    
    config.vm.synced_folder ".", "/var/www", group:"www-data", :mount_options => ["dmode=777", "fmode=666"]

    config.ssh.insert_key = false

    config.vm.provision "shell", inline: $set_environment_variables, run: "always"
    config.vm.provision "shell", path: "install.sh", privileged: false
    config.vm.provision "shell", path: "vhost_custom.sh", privileged: false


end
