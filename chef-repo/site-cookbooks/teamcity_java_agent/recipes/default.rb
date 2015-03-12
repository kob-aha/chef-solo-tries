#
# Cookbook Name:: teamcity_java_agent
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#include_recipe "java"

# TODO: Move it to the node definition
node.default['java']['oracle']['accept_oracle_download_terms'] = true

java_ark "install jdk 6" do
  url 'http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin'
  checksum '6b493aeab16c940cae9e3d07ad2a5c5684fb49cf06c5d44c400c7993db0d12e8'
  app_home '/usr/local/java/1.6'
  bin_cmds ['java', 'javac'] 
  action :install
end

java_ark "install jdk 7" do
  url 'http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.tar.gz'
  checksum '6f1f81030a34f7a9c987f8b68a24d139'
  app_home '/usr/local/java/1.7'
  bin_cmds ['java', 'javac']
  action :install
end

java_ark "install jdk 8" do
  url 'http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-x64.tar.gz'
  checksum '159a3186bb88b77b4eb9ff9971222736'
  app_home '/usr/local/java/1.8'
  bin_cmds ['java', 'javac']
  default true
  action :install
end

# TODO: Change URL
# Add uncertified yum repo to install packages
yum_repository 'uncertified' do
  description "Uncertified Citi yum repo"
  baseurl "http://uncertified/yum/stable/"
  action :create
end


