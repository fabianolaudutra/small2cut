#!/bin/bash

echo -e "\n\n"
echo -e "\033[34;7mInstalar Ruby Build\e[0m"

git clone git://github.com/rbenv/ruby-build ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL &
sudo apt-get update
sudo rbenv install -v 2.5.5
sudo rbenv global 2.5.5

echo -e "\n\n"
