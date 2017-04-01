#
# Cookbook Name:: custom_tomcat7
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe 'java'

package 'java-1.7.0-openjdk' do
 action :install
end

download_url = 'http://apache.mirrors.pair.com/tomcat/tomcat-7/v7.0.76/bin/apache-tomcat-7.0.76.zip'
group 'tomcat'

user 'tomcat' do
 group 'tomcat'
 system true
 shell '/bin/bash'
end

ark 'tomcaturl' do
 url download_url
 home_dir '/opt/tomcat'
 owner 'tomcat'
 group 'tomcat'
end

template '/etc/init.d/tomcat' do
 source 'tomcat-init.erb'
 mode '0755'
 owner 'root'
 group 'root'
end

execute 'chmod' do
 command 'chmod 755 /opt/tomcat/bin/*.sh'
 action :run
end

execute 'chkconfig' do
 command 'chkconfig tomcat on'
 command 'service tomcat start'
 action :run
end
