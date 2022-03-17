# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # OS
  config.vm.box = "centos/7"

  # Private IP Address
  config.vm.network "private_network", ip: "192.168.33.10"

  # Synced Folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 2048
  end

  # Provisioning
  config.vm.provision :shell, :path => "provision-root.sh"
  config.vm.provision :shell, :path => "provision.sh", privileged: false

end
