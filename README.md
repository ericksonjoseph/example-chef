This technique uses knife solo

knife-solo adds a handful of commands that aim to make working with chef-solo as powerful as chef-server.
ref: https://matschaffer.github.io/knife-solo/

knife solo init chef-repo
knife solo prepare vagrant@10.10.10.101 -P vagrant
`knife cookbook create app` to create a new cookbook
`mv cookbooks/app site-cookbooks/` because this is where you cookbooks belong when working with knife solo
Update you cookbook's metadata.rb file if you depend on another cookbook
Update the Berksfile to declare the dependency in order to use berks to download deps
`berks install`
Modify the nodes file to include the recipes etc you want
`knife solo cook vagrant@local.chef.com` to upload the kitchen and cook the server
