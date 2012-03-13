#
# Cookbook Name:: apache
# Recipe:: server_restart
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "#{node[:apache][:dir]}/conf/httpd.conf" do
  source "httpd.conf.erb"
  notifies :restart, "service[#{node[:apache][:package]}]"
end

service "#{node[:apache][:package]}"
