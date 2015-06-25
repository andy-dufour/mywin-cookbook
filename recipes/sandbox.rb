file 'c:\policy.txt' do
  action :delete
end

file 'c:\error.txt' do
  action :delete
end

powershell_script 'error_test' do
  code '
    trap [Exception] {
      echo "*****ErrorActionPreference1=$ErrorActionPreference" > c:\error4.txt
      echo $_.Exception.Message >> c:\error4.txt
    }
    #cp C:\Users\vagrant\AppData\Local\Temp\* c:\
    echo "before" > c:\error.txt
    echo $error.count >> c:\error.txt
    $ErrorActionPreference = "SilentlyContinue"
    Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
    echo $error.count >> c:\error.txt
    echo "after" >> c:\error.txt
  '
  action :nothing
end

powershell_script 'execpolicy' do
  code '
    trap [Exception] {
      write-output $_.Exception.Message
    }
    Get-ExecutionPolicy -Scope LocalMachine > c:\policy.txt
    $ErrorActionPreference = "SilentlyContinue"
    Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
    Get-ExecutionPolicy -Scope LocalMachine >> c:\policy.txt
  '
  not_if "$(Get-ExecutionPolicy -Scope LocalMachine) -eq 'RemoteSigned'"
  action :run
end

return

windows_task 'xxxxxxxxxxxxxxx' do
  user 'vagrant'
  password 'vagrant'
  cwd 'C:\\chef\\bin'
  command 'chef-client -L C:\\tmp\\'
  run_level :highest
  frequency :minute
  frequency_modifier 15
end

windows_task 'chef-client' do
 user "SYSTEM"
 password "vvvvvv"
 command "cmd /c ' C:/opscode/chef/bin/chef-client   -L C:/chef/log/client.log   -c C:/chef/client.rb -s 300 > NUL 2>&1'"
 run_level :highest
 frequency :minute
 frequency_modifier 30
end
