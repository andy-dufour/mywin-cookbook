# Creates a directory with proper permissions
# http://docs.opscode.com/resource_directory.html
directory 'C:\MyKits\ConEmu' do
  action :create
  recursive true
end

remote_file 'C:\MyKits\ConEmu\ConEmu_installer.exe' do
  source node['conemu']['url']
  checksum node['conemu']['checksum']
end

# Install Notepad++ using windows_package
# http://docs.opscode.com/lwrp_windows.html#windows-package
windows_package 'ConEmu 150119a.x86' do
  source 'C:\MyKits\ConEmu\ConEmu_installer.exe'
  installer_type :custom
  options '/p:x86 /quiet'
  action :install
end
