#
# Cookbook Name:: yum-plugin-versionlock
# Recipe:: default
#
# Copyright (C) 2015 Marius Karnauskas
#
# All rights reserved - Do Not Redistribute
#

template '/etc/yum/pluginconf.d/versionlock.conf' do
  source 'versionlock.conf.erb'
  variables config: node['yum-plugin-versionlock']
end

template node['yum-plugin-versionlock']['locklist'] do
  source 'versionlock.list.erb'
  variables versions: node['yum-plugin-versionlock']['versions']
end