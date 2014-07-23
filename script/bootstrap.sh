#!/usr/bin/env bash

sudo apt-get install -y nodejs
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.0

source /home/vagrant/.rvm/scripts/rvm
rvm use 2.1.0 --default

echo "cd /vagrant" >> /home/vagrant/.bashrc
cd /vagrant

bundle install
