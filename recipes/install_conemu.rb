# Creates a directory with proper permissions
# http://docs.opscode.com/resource_directory.html
directory 'C:\MyKits\ConEmu' do
  action :create
  recursive true
end

# Download the installer from source if the destination 
# file is missing or checksum is not matching
remote_file 'C:\MyKits\ConEmu\ConEmu_installer.exe' do
  source node['mywin-cookbook']['conemu']['url']
  checksum node['mywin-cookbook']['conemu']['checksum']
  action :create
end

# Install ConEmu using windows_package
# http://docs.opscode.com/lwrp_windows.html#windows-package
windows_package 'ConEmu 150119a.x86' do
  source 'C:\MyKits\ConEmu\ConEmu_installer.exe'
  installer_type :custom
  options '/p:x86 /quiet'
  action :install
end
