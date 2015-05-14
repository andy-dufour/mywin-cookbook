name 'mywin-cookbook'
maintainer 'Alex'
maintainer_email 'alex@example.com'
license 'All rights reserved'
description 'Installs/Configures mywin-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.4.7'

recipe 'mywin-cookbook::default', 'Default recipe, not implemented yet'
recipe 'mywin-cookbook::install_notepad_pp', 'Installs Notepad PlusPlus from attributes source'
recipe 'mywin-cookbook::install_conemu', 'Installs ConEmu, a sane Windows terminal'
recipe 'mywin-cookbook::install_putty', 'Installs PuTTY from attributes source'
recipe 'mywin-cookbook::install_google_chrome', 'Installs Google Chrome browser'
recipe 'mywin-cookbook::sample_dsc', 'Demonstrate Microsoft Desired State Configuration integration'

depends 'windows', '>= 0.0.0'
#depends 'dsc', '>= 0.0.0'
depends 'git', '>= 0.0.0'
# needed by 'dsc_resource' as it requires powershell 5
depends 'powershell', '>=0.0.0'

supports 'windows'

