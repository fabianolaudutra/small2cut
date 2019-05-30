#!/bin/bash

echo -e "\n\n"
echo -e "\033[34;7mInstalar Ruby Build\e[0m"

git clone git://github.com/rbenv/ruby-build ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL &
sudo apt-get update
sudo rbenv install -v 2.6.2
sudo rbenv global 2.6.2

gem install bundler -v 2.0.1
sudo rbenv rehash

sudo apt-get -y install mysql-server  mysql-client  libmysqlclient-dev

echo -e "\n\n"
