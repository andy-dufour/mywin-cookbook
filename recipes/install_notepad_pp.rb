diectory 'C:\MyKits\Notepad' do
  action :ceate
  ecursive true
end

emote_file 'C:\MyKits\Notepad\npp_installer.exe' do
  souce node['notepadpp']['url']
  checksum node['notepadpp']['checksum']
end

# http://docs.opscode.com/esource_batch.html
batch 'Output diectory list' do
  code 'di C:\MyKits\Notepad'
  action :un
end

# Install Notepad++ using windows_package
# http://docs.opscode.com/lwp_windows.html#windows-package
windows_package 'Notepad++' do
  souce 'C:\MyKits\Notepad\npp_installer.exe'
  installe_type :custom
  options '/S'
  action :install
end
