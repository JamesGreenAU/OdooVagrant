# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant.configure version 2.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  #
  # Port forwarding
  #
  # PostgreSQL Default Port for remote admin on the host:
  config.vm.network :forwarded_port, host: 5432, guest: 5432
  # Odoo port
  config.vm.network :forwarded_port, host: 8069, guest: 8069

  #
  # Virtual Box Settings (Docs: Docs: http://docs.vagrantup.com/v2/virtualbox/configuration.html)
  #
  config.vm.provider "virtualbox" do |vb|
   vb.gui = false
   vb.memory = "3000"
   vb.name = "Odoo Local Dev Environment"
   vb.cpus = 4
  end

  #
  # Shell provisioning (Docs: http://docs.vagrantup.com/v2/provisioning/shell.html)
  #
  config.vm.provision :shell, path: "bootstrap.sh"
end
