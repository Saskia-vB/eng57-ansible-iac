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
    # specifying the box
    web.config.vm.box = "ubuntu/bionic64"

    # assign an ip
    web.vm.network :private_network, ip: "192.168.10.10"

    # assign a hostname for the vm
    web.vm.hostname = "web"

    # assign a hostname for web browser access
    web.hostsupdater.aliases = ["development.local"]

  end

  config.vm.define "db" do |web|
    # specifying the box
    db.config.vm.box = "ubuntu/bionic64"

    # assign an ip
    db.vm.network :private_network, ip: "192.168.10.20"

    # assign a hostname
    db.vm.hostname = "db"

    # assign a hostname for web browser access
    db.hostsupdater.aliases = ["development.db"]

  end

  config.vm.define "aws" do |web|
    # specifying the box
    aws.config.vm.box = "ubuntu/bionic64"

    # assign an ip
    aws.vm.network :private_network, ip: "192.168.10.30"

    # assign a hostname
    aws.vm.hostname = "aws"

    # assign a hostname for web browser access
    aws.hostsupdater.aliases = ["development.aws"]

  end

end
