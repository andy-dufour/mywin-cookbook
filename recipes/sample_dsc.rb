dsc_script 'emacs' do
  code <<-EOH
  Environment 'texteditor'
  {
    Name = 'EDITOR'
   	Value = 'C:\\emacs\\bin\\emacs.exe'
  }
  EOH
end

dsc_script 'DSC_Directory' do
  code <<-EOH
  File 'DSC_Directory'
  {
    Ensure = "Present"
    Type = "Directory"
    DestinationPath = "C:\\DSC"
	}
  EOH
end

log_directory = "#{ENV['SystemDrive']}/log-archive"
directory log_directory

cookbook_file 'C:\DSC\DSC_File.ps1' do
  source 'dsc/DSC_File.ps1'
end

DSC_FILES_PATH = ::File.join(::File.dirname(__FILE__), '..', 'files', 'default', 'dsc')
dsc_script 'DSC_File' do
  flags ({ :sourcePath => 'C:\DSC\DSC_File.ps1', 
				   :destinationPath => 'C:\Users\b.txt' })
  command 'C:\DSC\DSC_File.ps1'
end

