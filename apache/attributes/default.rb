# Cookbook Name:: apache
# Attribute:: default
# Created by:: Madhavan R
# Created at:: 06/03/2012 
# Purpose:: set the default attributes for apache

# Where the various parts of apache are
  set[:apache][:root_group]  = "root"
  set[:apache][:package] = "httpd"
  set[:apache][:dir]     = "/etc/httpd"
  set[:apache][:log_dir] = "/var/log/httpd"
  set[:apache][:user]    = "apache"
  set[:apache][:group]   = "apache"
  set[:apache][:binary]  = "/usr/sbin/httpd"
  set[:apache][:icondir] = "/var/www/icons"
  set[:apache][:doc_root_dir] = "/var/www/html"
  set[:apache][:cache_dir] = "/var/cache/httpd"
  set[:apache][:pid_file] = "/var/run/httpd.pid"
  set[:apache][:lib_dir] = node[:kernel][:machine] =~ /^i[36]86$/ ? "/usr/lib/httpd" : "/usr/lib64/httpd"
  set[:apache][:libexecdir] = "#{set[:apache][:lib_dir]}/modules"
  set[:apache][:listen_ports] = ["8080"]
  set[:apache][:contact] = "madhuupri@gmail.com"

# General settings
  default[:apache][:timeout] = 300
  default[:apache][:keepalive] = "On"
  default[:apache][:keepaliverequests] = 100
  default[:apache][:keepalivetimeout] = 15

# Prefork Attributes
  default[:apache][:prefork][:startservers] = 16
  default[:apache][:prefork][:minspareservers] = 16
  default[:apache][:prefork][:maxspareservers] = 32
  default[:apache][:prefork][:serverlimit] = 400
  default[:apache][:prefork][:maxclients] = 400
  default[:apache][:prefork][:maxrequestsperchild] = 10000

# Worker Attributes
  default[:apache][:worker][:startservers] = 4
  default[:apache][:worker][:maxclients] = 1024
  default[:apache][:worker][:minsparethreads] = 64
  default[:apache][:worker][:maxsparethreads] = 192
  default[:apache][:worker][:threadsperchild] = 64
  default[:apache][:worker][:maxrequestsperchild] = 0
