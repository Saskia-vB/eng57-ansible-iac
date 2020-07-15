# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
plugins = ['vagrant-hostsupdater']

plugins.each do |plugin|
  exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "web" do |web|
    #specifying the box
    web.vm.box = "ubuntu/bionic64"

    #assign an ip
    web.vm.network :private_network, ip: "192.168.33.10"

    #assing a hostname for the vm
    web.vm.hostname = "web"

    #assing a hostname for browser access
    web.hostsupdater.aliases = ["development.local"]

  end
  #
  # config.vm.define "db" do |db|
  #   #specifying the box
  #   db.vm.box = "ubuntu/bionic64"
  #
  #   #assign an ip
  #   db.vm.network :private_network, ip: "192.168.33.11"
  #
  #   #assing a hostname for the vm
  #   db.vm.hostname = "db"
  #
  #   #assing a hostname for browser access
  #   db.hostsupdater.aliases = ["development.db"]
  #
  # end

  config.vm.define "aws" do |aws|
    #specifying the box
    aws.vm.box = "ubuntu/bionic64"

    #assign an ip
    aws.vm.network :private_network, ip: "192.168.33.12"

    #assing a hostname for the vm
    aws.vm.hostname = "aws"

    #assing a hostname for browser access
    aws.hostsupdater.aliases = ["development.aws"]

  end

  config.vm.define "ansible" do |ansible|
    #specifying the box
    ansible.vm.box = "ubuntu/bionic64"

    #assign an ip
    ansible.vm.network "private_network", ip: "192.168.33.13"

    #assing a hostname for the vm
    ansible.vm.hostname = "ansible"

    #assing a hostname for browser access
    ansible.hostsupdater.aliases = ["development.ansible"]

    # provisioning
    ansible.vm.provision "shell", path: "environments/ansible/provision.sh" 

  end

end
