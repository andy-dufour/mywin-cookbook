#
# Cookbook Name:: mywin-cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log '*** Hello from mywin-cookbook::default'

file 'c:\tmp\test.txt' do
  content 'mycontent'
end
