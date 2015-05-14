log '*** This is the install_google_chrome::default recipe'

if (Time.now.hour == 1)
  log '*** Time is 1am, time to do some work'
else
  log '*** This is not 1am, skipping work'
end

directory 'C:\MyKits\test1am' do
  recursive true
  only_if { Time.now.hour == 1 }
  action :create
end

# Creates a directory with proper permissions
# http://docs.opscode.com/resource_directory.html
directory 'C:\MyKits\Google' do
  recursive true
  action :create
end

remote_file 'C:\MyKits\Google\Chrome.msi' do
  source node['mywin-cookbook']['chrome']['url']
  checksum node['mywin-cookbook']['chrome']['checksum']
  action :create
end

# http://docs.opscode.com/resource_batch.html
batch 'Output directory list' do
  code 'dir C:\MyKits\Google'
  action :run
end

# Install Chrome using windows_package
# http://docs.opscode.com/lwrp_windows.html#windows-package
windows_package 'Google Chrome' do
  source 'C:\MyKits\Google\Chrome.msi'
  action :install
end

# Needs the 'windows' cookbook
#windows_path 'C:\Program Files (x86)\Google\Chrome\Application' do
#  action :add
#end
