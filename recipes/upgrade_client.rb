#
# Cookbook Name:: mywin-cookbook
# Recipe:: upgrade_client
#

chef_current_version = node['chef_packages']['chef']['version']
chef_desired_version = '0.0.0'
if (node['mywin-cookbook']['chef_package'] =~ /chef-client-(\d+\.\d+\.\d+).*msi/)
  chef_desired_version = $1
else
  raise "ERROR: Cannot parse version from chef package name"
end

temp_dir='c:/chef_temp'
if (chef_current_version != chef_desired_version)
  log "Upgrading chef-client #{chef_current_version} to #{chef_desired_version}"
  directory temp_dir do
    action :create
  end
  remote_file "#{temp_dir}/chef-client.msi" do
    source node['mywin-cookbook']['chef_package']
    notifies :run, "powershell_script[upgrade-chef-client]", :delayed
  end
  powershell_script "upgrade-chef-client" do
    environment ({'TEMP_DIR' => temp_dir})
    code <<-EOH
      $log = "${ENV:TEMP_DIR}/chef_upgrade.txt"
      $dest_inst = "${ENV:TEMP_DIR}/chef-client.msi"
      Start-Process -FilePath "msiexec.exe" -ArgumentList "/qn /i $dest_inst ADDLOCAL=ChefClientFeature,ChefServiceFeature /norestart /L*v+ $log"
    EOH
    action :nothing
  end
else
  log "chef-client #{chef_current_version} is up-to-date"
  directory temp_dir do
    action :delete
  end
end