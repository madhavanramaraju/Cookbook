Description

To install and configure the postgresql server using chef.

Requirements

Platform - CentOS 5.5 

Cookbook:
Attributes:   
Platform specific

  postgresql[:dir] - configuration file location.
  postgresql[:version] - Version of postgresql to use. 

Recipe:
  Create default recipe, it includes the yum package for postgresql install the pgsql(includes the specific version or arch) and the configuration file, it should restart the service when we modify a template that configures psql.

Template:

  Create the pgsql configuration(pgsql_hba.conf.erb) and postgresql server (postgresql.conf.erb) page template.

  Metadata.rb contains the recipe name (default.rb) and the user inputs if required.


