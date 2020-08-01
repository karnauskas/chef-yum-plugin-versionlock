name 'yum-plugin-versionlock'
maintainer 'Marius Karnauskas'
maintainer_email 'marius@karnauskas.lt'
license 'GPL-3.0'
description 'Installs/Configures yum-plugin-versionlock'
long_description 'Installs/Configures yum-plugin-versionlock'
version '0.2.2'

chef_version '>= 14' if respond_to?(:chef_version)

source_url 'https://github.com/karnauskas/chef-yum-plugin-versionlock'
issues_url 'https://github.com/karnauskas/chef-yum-plugin-versionlock/issues'

supports 'centos', '>= 6.0'
