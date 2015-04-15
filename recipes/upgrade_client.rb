#
# Cookbook Name:: mywin-cookbook
# Recipe:: upgrade_client
# 
# Upgrade chef-client based on the package specified
#  in attribute node['mywin-cookbook']['chef_package']
# The new chef-client will be available a few minutes after the 
#  recipe completes. Otherwise check the chef_upgrade.log file

if (node['mywin-cookbook']['chef_package'] =~ /chef-client-(\d+\.\d+\.\d+).*msi/)
  chef_desired_version = $1
  chef_current_version = node['chef_packages']['chef']['version']
else
  raise "ERROR: Cannot parse version from chef package name, aborting..."
end

temp_dir='c:\\chef_temp'
if (chef_current_version != chef_desired_version)
  log "Upgrading chef-client #{chef_current_version} to #{chef_desired_version}"
  directory temp_dir do
    action :create
  end
  # trigger the upgrade script at the end of the chef-client 
  # run in order to avoid files in-use conflict
  remote_file "#{temp_dir}\\chef-client.msi" do
    source node['mywin-cookbook']['chef_package']
    notifies :run, "powershell_script[upgrade-chef-client]", :delayed
  end
  # initiate the upgrade with verbose logging in chef_upgrade.log
  powershell_script "upgrade-chef-client" do
    environment ({'TEMP_DIR' => temp_dir, 
                  'FEATURES' => node['mywin-cookbook']['chef_features']})
    code <<-EOH
      $log = "${ENV:TEMP_DIR}\\chef_upgrade.log"
      $dest_inst = "${ENV:TEMP_DIR}\\chef-client.msi"
      $msi_args = "/qn /i $dest_inst ADDLOCAL=${ENV:FEATURES} /l*v+ $log"
      Start-Process -FilePath "msiexec.exe" -ArgumentList $msi_args
    EOH
    action :nothing
  end
else
  log "chef-client #{chef_current_version} is up-to-date"
  # cleanup the temp directory after a successful upgrade
  directory temp_dir do
    recursive true
    action :delete
  end
end