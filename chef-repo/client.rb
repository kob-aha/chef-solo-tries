cookbook_path    ["/vagrant/chef-repo/cookbooks", "/vagrant/chef-repo/site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
cache_path	 "/tmp/chef-cache"
#encrypted_data_bag_secret "data_bag_key"

knife[:berkshelf_path] = "cookbooks"
