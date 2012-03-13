#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install the Apache via yum package
yum_package "#{node[:apache][:package]}" do
  action :install
end

# Install the Apache dependencies yum package
yum_package "mod_ssl" do
  action :install
end

# Apache server starts if it's not running and enable it to system boot time
service "#{node[:apache][:package]}" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]  
end

# Creating some config file
directory "#{node[:apache][:dir]}/conf.d" do
  action :create
  mode 0755
  owner "#{node[:apache][:root_group]}"
  group "#{node[:apache][:root_group]}"
end

# Creating some config file
directory "#{node[:apache][:dir]}/conf" do
  action :create
  mode 0755
  owner "#{node[:apache][:root_group]}"
  group "#{node[:apache][:root_group]}"
end

# Creating document root
directory "#{node[:apache][:doc_root_dir]}" do
  action :create
  mode 0777
  owner "#{node[:apache][:root_group]}"
  group "#{node[:apache][:root_group]}"
end

# We need to restart the apache service when we modify a template that configures apache
template "#{node[:apache][:dir]}/conf/httpd.conf" do
  source "httpd.conf.erb"
  owner "#{node[:apache][:root_group]}"
  group "#{node[:apache][:root_group]}"
  mode 0644
  notifies :restart, resources(:service => "#{node[:apache][:package]}")
end

# Display index page after installation
template "#{node[:apache][:doc_root_dir]}/index.html" do
  source "index.html.erb" 
  mode 0777
end

