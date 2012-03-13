#
# Cookbook Name:: my-first-cookbook
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/tmp/first-book.conf" do
    source "first-book.conf.erb"
    variables :display_msg => node[:display_msg]
end

