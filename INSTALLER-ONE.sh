#!/bin/bash


sudo apt-get -y install boxes;
sudo apt-get -y update

sudo rm -rf ~/.rbenv

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install git-core curl zlib1g-dev build-essential \
                     libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
                     libxml2-dev libxslt1-dev libcurl4-openssl-dev \
                     python-software-properties libffi-dev

echo -e "\n\n"
echo -e "\033[34;7mInstalar Ruby Environment\e[0m"

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL


echo -e "\n\n"