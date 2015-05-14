# http://docs.opscode.com/resource_directory.html
directory 'C:\MyKits\PuTTY' do
  action :create
  recursive true
end

remote_file 'C:\MyKits\PuTTY\putty-installer.exe' do
  source node['mywin-cookbook']['putty']['url']
  checksum node['mywin-cookbook']['putty']['checksum']
  action :create
end

windows_package 'PuTTY version 0.63' do
  source 'C:\MyKits\PuTTY\putty-installer.exe'
  installer_type :inno
  action :install
end
