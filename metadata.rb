name 'mywin-cookbook'
maintainer 'Alex'
maintainer_email 'alex@example.com'
license 'All rights reserved'
description 'Installs/Configures mywin-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'

# Needed for windows_path resource and a fix in the windows_package resource
depends 'windows'

#depends 'iis'
#depends 'git'
