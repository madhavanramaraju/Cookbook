Description
===========
To install and configure the apache server using chef.

Requirements
============
Platform - CentOS 5.5
Dependencies:
yum package, libraries
Enable Apache module and Virtual Host
Sets up configuration file for an Apache module from a template
Manage a template resource for a VirtualHost site, and enable it with apache_site.

Cookbook:
==========
Attributes:
==============
Platform specific
------------------

    * node['apache']['dir'] - Location for the Apache configuration
    * node['apache']['log_dir'] - Location for Apache logs
    * node['apache']['user'] - User Apache runs as
    * node['apache']['group'] - Group Apache runs as
    * node['apache']['binary'] - Apache httpd server daemon
    * node['apache']['icondir'] - Location for icons
    * node['apache']['cache_dir'] - Location for cached files used by Apache itself or recipes
    * node['apache']['pid_file'] - Location of the PID file for Apache httpd
    * node['apache']['lib_dir'] - Location for shared libraries

General settings
-----------------

    * node['apache']['listen_ports'] - Ports that httpd should listen on. Default is an array of ports 80 and 443.
    * node['apache']['contact'] - Value for ServerAdmin directive. Default "ops@example.com".
    * node['apache']['timeout'] - Value for the Timeout directive. Default is 300.
    * node['apache']['keepalive'] - Value for the KeepAlive directive. Default is On.
    * node['apache']['keepaliverequests'] - Value for MaxKeepAliveRequests. Default is 100.
    * node['apache']['keepalivetimeout'] - Value for the KeepAliveTimeout directive. Default is 5.
    * node['apache']['default_modules'] - Array of module names. Can take "mod_FOO" or "FOO" as names, where FOO is the apache module, e.g. "mod_status" or "status".


Prefork attributes
===================

  Prefork attributes are used for tuning the Apache HTTPD prefork MPM configuration.

    * node['apache']['prefork']['startservers'] - initial number of server processes to start. Default is 16.
    * node['apache']['prefork']['minspareservers'] - minimum number of spare server processes. Default 16.
    * node['apache']['prefork']['maxspareservers'] - maximum number of spare server processes. Default 32.
    * node['apache']['prefork']['serverlimit'] - upper limit on configurable server processes. Default 400.
    * node['apache']['prefork']['maxclients'] - Maximum number of simultaneous connections.
    * node['apache']['prefork']['maxrequestsperchild'] - Maximum number of request a child process will handle. Default 10000.

Worker attributes
------------------

Worker attributes are used for tuning the Apache HTTPD worker MPM configuration.

    * node['apache']['worker']['startservers'] - Initial number of server processes to start. Default 4
    * node['apache']['worker']['maxclients'] - Maximum number of simultaneous connections. Default 1024.
    * node['apache']['worker']['minsparethreads] - Minimum number of spare worker threads. Default 64
    * node['apache']['worker']['maxsparethreads] - Maximum number of spare worker threads. Default 192.
    * node['apache']['worker']['maxrequestsperchild'] - Maximum number of requests a child process will handle.

Recipe:
=======
    Create default recipe, it includes the yum package for httpd to install the apache(includes the specific version or arch) and the configuration file, it should restart the service when we modify a template that configures apache.

    The Operational scripts for service start|stop|restart - service_restart.rb recipe


Template:
=========

     Create the apache configuration(httpd.conf.erb) and index (index.html.erb) page template.

     Metadata.rb contains the recipe name (default.rb, service_restart.rb) and the user inputs if required.

