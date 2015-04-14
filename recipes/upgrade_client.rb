#
# Cookbook Name:: mywin-cookbook
# Recipe:: upgrade_client
#

log "*** Upgrading chef-client!"

temp_dir='c:\\temp\\'

directory temp_dir do
  action :create
end

# download the remote chef-client msi and notify the powershell script
remote_file "#{temp_dir}chef-client.msi" do
  source node['mywin-cookbook']['chef_package']
  notifies :run, "powershell_script[upgrade-chef-client]"
end

# only run this script when notified
powershell_script "upgrade-chef-client" do
  environment ({'TEMP_DIR' => temp_dir})
  code <<-EOH
    $log = "${ENV:TEMP_DIR}chef_upgrade.txt"
    $dest_inst = "${ENV:TEMP_DIR}chef-client.msi"
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/qn /i $dest_inst ADDLOCAL=ChefClientFeature,ChefServiceFeature /norestart /L*v+ $log"
  EOH
  action :nothing
end
