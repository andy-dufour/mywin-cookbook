windows_package 'PuTTY version 0.63' do
  source 'https://s3-eu-west-1.amazonaws.com/apop-bucket/putty-0.63-installer.exe'
  installer_type :inno
  action :install
end
