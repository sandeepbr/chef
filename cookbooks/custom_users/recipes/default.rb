#
# Cookbook:: custom_users
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

user 'sandeep' do 
 comment 'Sandeep databag'
 uid 2000
 home '/home/sandeep'
 shell '/bin/bash'
 password '$1$bacon$Nkx6U4.Nakp2CmHmsFmJo1'
end
