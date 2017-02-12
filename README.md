This technique uses SSH and chef-solo to configure a node.
I prefer the technique in the knife-solo branch

run `bash deploy.sh vagrant@local.chef.com` to bootstrap and run recipes on the node

#helper scripts
deploy.sh         ssh into the node and runs run-chef-solo.sh
run-chef-solo.sh  installs chef with install-chef.sh if needed. Then runs chef-solo -c solo.rb -j web.json
install-chef.sh   installs chef
web.json          contains run lists
solo.rb           config file defines cookbooks path etc

* The dependencies were installed manually

http://gettingstartedwithchef.com/first-steps-with-chef.html
