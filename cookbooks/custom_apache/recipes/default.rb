#
# Cookbook Name:: custom_apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'httpd' do
action :install
end

service 'httpd' do
action [:enable, :start]
end

#cookbook_file '/var/www/html/index.html' do
#source 'index.html.raw'
#mode 0644
#end

ark 'indexzip' do
url node['download']['template_url']
home_dir node['apache']['docroot']
prefix_root node['apache']['prefix']
owner node['apache']['user']
end 
