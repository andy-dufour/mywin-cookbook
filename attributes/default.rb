default['mywin-cookbook']['notepadpp']['url'] = 'https://s3-eu-west-1.amazonaws.com/apop-bucket/npp.6.7.4.Installer.exe'
# checksum obtained by running on a CentOS machine: sha256sum npp.6.7.4.Installer.exe
default['mywin-cookbook']['notepadpp']['checksum'] = 'ad80a9458c2732e5113a1f1cd5dd51f1656fda875c094ca9467b89ebfe1c3c43'

default['mywin-cookbook']['chrome']['url'] = 'https://s3-eu-west-1.amazonaws.com/apop-bucket/GoogleChrome.msi'
# checksum obtained by running on a MAC: shasum -a 256 GoogleChromeStandaloneEnterprise.msi
default['mywin-cookbook']['chrome']['checksum'] = '465b6d4ec0cc855a96471a9739195e7mywin-cookbooka2effebc28bbf60a7bd4738c3556dec14'

default['mywin-cookbook']['conemu']['url'] = 'https://s3-eu-west-1.amazonaws.com/apop-bucket/ConEmuSetup.150119a.exe'
default['mywin-cookbook']['conemu']['checksum'] = 'ac5692b2d873d31b7e86076b87bb871403517643bfc52b851a9fc2d31e1428ca'

default['mywin-cookbook']['putty']['url'] = 'https://s3-eu-west-1.amazonaws.com/apop-bucket/putty-0.63-installer.exe'
default['mywin-cookbook']['putty']['checksum'] = 'dd9c87f5692509093670e101ebe4230f29b778ff90e30020fcbcd5d3e92a6440'

default['mywin-cookbook']['doc-root'] = 'c:/inetpub/wwwroot'
default['mywin-cookbook']['git-repo'] = 'https://github.com/alexpop/myhtml-app'
default['mywin-cookbook']['git-revision'] = 'master'

# package to use when upgrading chef-client
default['mywin-cookbook']['chef_package']="http://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chef-client-12.2.1-1.msi"
# chef client msi features to install
default['mywin-cookbook']['chef_features']="ChefClientFeature,ChefServiceFeature"
