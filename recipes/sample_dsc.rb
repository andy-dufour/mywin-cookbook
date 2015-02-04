# Use the dsc_script Chef resource passing the code to the code attribute
dsc_script 'DSC_Directory' do
  code <<-EOH
  File 'DSC_Directory'
  {
    Ensure = "Present"
    Type = "Directory"
    DestinationPath = "C:/DSC"
  }
  EOH
end

# Use the cookbook_file policy file to deploy a cookbook_file from the cookbook
cookbook_file 'C:\DSC\DSC_File.ps1' do
  source 'dsc/DSC_File.ps1'
end

# Use the dsc_script Chef resource pointing to the full DSC script on disk and provide DSC parameters(flags)
dsc_script 'DSC_File' do
  flags ({ :sourcePath => 'C:\DSC\DSC_File.ps1', 
           :destinationPath => 'C:\Users\b.txt' })
  command 'C:\DSC\DSC_File.ps1'
end
