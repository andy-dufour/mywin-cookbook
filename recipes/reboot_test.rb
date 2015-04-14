#
# Cookbook Name:: mywin-cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log '*** Hello from mywin-cookbook::reboot_test'

file 'c:\tmp\before_reboot.txt' do
  content "Time is: #{Time.now}"
  not_if { File.exist?('c:\tmp\before_reboot.txt') }
  action :create
end

reboot "app_requires_reboot" do
  reason "Chef resource initiated reboot to complete the install"
  delay_mins 1
  action :request_reboot
	not_if { File.exist?('c:\tmp\after_reboot.txt') }
end

file 'c:\tmp\after_reboot.txt' do
  content "Time is: #{Time.now}"
  action :create
  not_if { File.exist?('c:\tmp\after_reboot.txt') }
end
