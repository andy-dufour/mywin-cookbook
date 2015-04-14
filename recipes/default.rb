#
# Cookbook Name:: mywin-cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log '*** Hello from mywin-cookbook::default'

# Use the registry_key resource to change the startup type for the chef-client service
registry_key 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\chef-client' do
  values [{
    :name => "DelayedAutostart",
    :type => :dword,
    :data => 1
  }]
  action :create
end

