# Cookbook Name:: postgresql
# Attribute:: default
# Created by:: Madhavan R
# Created at:: 15/03/2012 
# Purpose:: set the default attributes for pgsql

# Where the various parts of pgsql are

default[:postgresql][:version] = "8.1"
set[:postgresql][:dir] = "/var/lib/pgsql/data"
