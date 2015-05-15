# Use the dsc_script Chef resource to wrap the 
# DSC File resource in a code block
dsc_script 'DSC_Directory' do
  code <<-EOH
  File 'DSC_Directory'
  {
    Ensure = "Present"
    Type = "Directory"
    DestinationPath = "C:/DSC"
  }
  EOH
  action :run
end

# Use the cookbook_file resource to deploy a file from the cookbook
cookbook_file 'C:\DSC\DSC_File.ps1' do
  source 'dsc/DSC_File.ps1'
  action :create
end

# Use the dsc_script Chef resource pointing to the full DSC script 
# on disk and provide DSC parameters(flags)
dsc_script 'DSC_File' do
  flags ({ :sourcePath => 'C:\DSC\DSC_File.ps1', 
           :destinationPath => 'C:\Users\b.txt' })
  command 'C:\DSC\DSC_File.ps1'
  action :run
end

#include_recipe 'powershell::powershell5'

# Use 'dsc_resouce' to map a DSC resource
# Requires chef-client 12.2.0+
#dsc_resource 'example' do
#  resource :file
#  property :ensure, 'Present'
#  property :type, "Directory"
#  property :destinationpath, "C:/DSC2"
#  action :set
#end


