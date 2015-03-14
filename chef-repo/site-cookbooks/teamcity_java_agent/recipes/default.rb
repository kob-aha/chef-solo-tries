#
# Cookbook Name:: teamcity_java_agent
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Iterate over all configured java versions and install every version
versions = node.java.installed_versions

versions.to_hash.each do |key,value|
  value_hash = value.to_hash
  value_hash['default'] = false unless value_hash.has_key?('default')
  value_hash['bin_cmds'] = [] unless value_hash.has_key?('bin_cmds')

  java_ark "install jdk #{key}" do
    url value_hash['url']
    checksum value_hash['checksum']
    app_home value_hash['app_home']
    bin_cmds value_hash['bin_cmds']
    default  value_hash['default']
    action :install
  end
end 

# Add uncertified yum repo to install packages
yum_repository 'NOT-CERTIFIED' do
  name 'not-certified'
  description "NOT-CERTITIED Citi yum repo"
  baseurl "http://yum.nam.nsroot.net/mrepo/rhel6as-x86_64/RPMS.os"
  gpgcheck false
  action :create
end


