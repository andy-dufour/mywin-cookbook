#
# Cookbook Name:: mywin-cookbook
# Recipe:: install_iis
#
# Copyright 2015, Great Websites Inc
#

log "*** Hello from the mywin-cookbook::install_iis recipe!"

windows_feature 'IIS-WebServerRole' do
	action :install
end

#windows_feature 'IIS-WebServer' do
#	action :install
#end

# stop and delete the default site
#iis_site 'Default Web Site' do
#  action [:stop, :delete]
#end

file 'c:/inetpub/wwwroot/iisstart.htm' do
  action :delete
end

file 'c:/inetpub/wwwroot/iis-85.png' do
  action :delete
end

# Add app version to node data. Unknown for now
node.set['mywin-cookbook']['app-ver'] = 'unknown'

# Use the 'git' resource to checkout from the provided repository
git node['mywin-cookbook']['doc-root'] do
  repository node['mywin-cookbook']['git-repo']
  revision node['mywin-cookbook']['git-revision']
  depth 1
	action :sync
end

# Get the app version from VERSION.txt and add it to the node data
ruby_block 'Retrieve app version' do
  block do
    version = File.open("#{node['mywin-cookbook']['doc-root']}/VERSION.txt").readline.chomp
    node.set['mywin-cookbook']['app-ver'] = version
  end
  only_if { File.exist?("#{node['mywin-cookbook']['doc-root']}/VERSION.txt") }
end

