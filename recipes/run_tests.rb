# Find the kitchen cookbook path that contains the test folder
TEST_PATH = ::File.join(::File.dirname(__FILE__), '..', 'files', 'test', 'integration', 'default', 'serverspec').gsub(/kitchen\/cache/, 'kitchen')

gem_package 'serverspec' do
#  source "/tmp/right_aws-1.11.0.gem"
  options('--no-rdoc --no-ri')
  action :install
end

log "*** test path is: #{TEST_PATH}"

batch '*** Running serverspec tests' do
  cwd TEST_PATH
  code <<-EOH
    pwd > c:/tmp/serverspec.log
    C:/opscode/chef/embedded/bin/ruby.exe C:/opscode/chef/embedded/lib/ruby/gems/1.9.1/gems/rspec-core-3.1.7/exe/rspec --no-color >> c:/tmp/serverspec.log
EOH
  action :run
end
