#!/bin/bash

# The deploy.sh script is the one you run on your laptop every time you want to (re-)apply your Chef recipe to your server.
# It only copies the tree to the server and runs run-chef-solo.sh

# Usage: ./deploy.sh [host]

host="${1:-vagrant@local.chef.com}"

# The host key might change when we instantiate a new VM, so
# we remove (-R) the old host key from known_hosts
ssh-keygen -R "${host#*@}" 2> /dev/null

tar cj . | ssh -o 'StrictHostKeyChecking no' "$host" '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash run-chef-solo.sh'
