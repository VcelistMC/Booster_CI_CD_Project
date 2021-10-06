#!/bin/bash
echo "Enter ssh public key"
read pub_key
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
echo $pub_key > ~/.ssh/authorized_keys
touch /etc/init.d/startup.sh
echo "service ssh start" > /etc/init.d/startup.sh
chmod +x /etc/init.d/startup.sh
