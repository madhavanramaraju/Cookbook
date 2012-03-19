#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install the postgresql via yum package
yum_package "postgresql" do
  action :install
end

yum_package "postgresql-server" do
  action :install
end

yum_package "postgresql-contrib" do
  action :install
end

# postgresql server starts if it's not running and enable it to system boot time
service "postgresql" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "root"
  group "root"
  mode 0600
  notifies :reload, resources(:service => "postgresql")
end

template "#{node[:postgresql][:dir]}/postgresql.conf" do
  source "postgresql.conf.erb"
  owner "root"
  group "root"
  mode 0600
  notifies :restart, resources(:service => "postgresql")
end
