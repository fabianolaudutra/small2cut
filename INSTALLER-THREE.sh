#!/bin/bash
echo -e "\n\n"
echo -e "\033[34;7mInstalling MYSQL\e[0m"

sudo apt-get -y install mysql-server  mysql-client  libmysqlclient-dev


echo -e "\n\n"
echo -e "\033[34;7mInstalarJavaScript Runtime\e[0m"

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs

echo -e "\n\n"
echo -e "\033[34;7mConfig database settings\e[0m"
echo "Enter MySQL Username: " mysqlusername
read mysqlusername
sed -i "s+username: root+username: ${mysqlusername}@+g" config/database.yml
echo "Enter MySQL Password: " mysqlpassword
read mysqlpassword
sed -i "s+password:+password: ${mysqlpassword}@+g" config/database.yml