maintainer       "Madhavan R"
maintainer_email "madhuupri@gmail.com"
license          "All rights reserved"
description      "Installs/Configures postgresql"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "postgresql::default", "Postgresql recipe, Installs and configures Postgresql"
