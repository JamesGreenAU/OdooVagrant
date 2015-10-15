# Vagrant configuration for Odoo 8 module development #

Source code for the blog post at [https://deepdark.net/vagrant-configuration-for-odoo-8-module-development/](https://deepdark.net/vagrant-configuration-for-odoo-8-module-development/)

## Background ##
Odoo is a powerful open source ERP system, now quite mature in it's 8th version.  Developing Add-ons in Odoo is a powerful way to build on top of the CRM and workflow foundation it provides.  In fact there are freely available Odoo add-ons that can be used as a foundation for many business domains such as HR, purchasing and so on.

But like all mature platforms Odoo has it's own unique ways and it is attractive to isolate the development environment from your regular workstation.

## Using Vagrant to orchestrate your development VM. ##
First of all, make sure you have Vagrant set up on your machine (visit vagrantup.com for instructions), and in this case I'm using the VirtualBox provider to run the VM.  If Oracle makes you cry this should work just as well with Hyper-V or VMWare.

I'm not using Chef or Puppet either to keep this a self-contained example, instead using the shell provisioner to run bootstrap.sh.

This virtual machine is based on Ubuntu 14 "Trusty" and forwards to your host machine two ports from the VM:  8069 for the Odoo UI and 5432 for PostgreSQL.

If you don't want to configure the setup any further

`$ vagrant up`
...and visit [http://localhost:8069](http://localhost:8069) once the machine is booted.

If this is your first visit to Odoo development, the next thing to do is create a new database by visiting [http://localhost:8069/web/database/manager](http://localhost:8069/web/database/manager).

To start developing modules, create a new folder under the /odoo-modules/ path in the repo and start coding.  The Odoo docs have some getting started guides but I think the source of the Official Odoo Addons is equally useful.

## Configuring security ##
There are two default passwords supplied in this repo that you should update before using this for your own work.

1. Update the sql/authentication.sql file to set a new PostgreSQL user name and password.

2. Update the conf/openerp-server.conf file to reflect the new PostgreSQL password.  Also update the Odoo Database Master Password which is set in this file.

If you make these changes down the track, you should re-provision the virtual machine.

`$ vagrant up --provision`