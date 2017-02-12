#!/bin/bash

# install.sh is responsible for bootstrapping the system if necessary (installing Chef), and then calling the chef-solo binary.
# (You don’t ever need to run it manually. Keep it mode 644 as a precaution against wrecking your development machine.)

# This runs as root on the server

chef_binary=/usr/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    /bin/bash install-chef.sh
fi &&

"$chef_binary" -c solo.rb -j web.json
