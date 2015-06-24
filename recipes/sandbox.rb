#

powershell_script 'AAAAAAAAAAAAAAAAAAAAAAAAAAA' do
  code '
    ls c:\
    write-output "test"
    Get-ExecutionPolicy -Scope LocalMachine > c:\policy.txt
  '
  action :nothing
end

execute "BBBBBBBBBBBBBBBBBBBBBBBBBBB" do
  command "dir c:"
  action :run
end

# Set-ExecutionPolicy RemoteSigned -force
powershell_script 'CCCCCCCCCCCCCCCCCCCCCCCCCC' do
  code '
    Get-ExecutionPolicy -Scope LocalMachine > c:\policy.txt
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
  '
  not_if "$(Get-ExecutionPolicy -Scope LocalMachine) -eq 'RemoteSigned'"
  flags '-Logo -Interactive'
  action :run
end

