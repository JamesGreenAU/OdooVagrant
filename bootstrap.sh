#!/usr/bin/env bash
apt-get update

# 
# Install and setup PostgreSQL 
# 
apt-get install -y postgresql 
sudo -u postgres psql -f /vagrant/sql/authentication.sql 

# allow db access from the forwarded host port
echo "host    all             all             10.0.2.2/32             md5" >> /etc/postgresql/9.3/main/pg_hba.conf
sudo -u postgres pg_ctlcluster 9.3 main reload

sudo -u postgres echo "listen_addresses = '*'" >> /etc/postgresql/9.3/main/postgresql.conf
sudo -u postgres echo "max_locks_per_transaction = 200" >> /etc/postgresql/9.3/main/postgresql.conf
sudo service postgresql restart

#
# Install Odoo
#
sudo wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.odoo.com/8.0/nightly/deb/ ./" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y install odoo

sudo cp /vagrant/conf/openerp-server.conf /etc/odoo/
sudo service odoo stop
sudo service odoo start

sudo sudo apt-get -y install node

#
# Clean up
#
sudo apt-get -y autoremove