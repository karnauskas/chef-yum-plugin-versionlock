name "yum-plugin-versionlock"
maintainer "Marius Karnauskas"
maintainer_email "marius@karnauskas.lt"
license "GPL-3.0"
description "Installs/Configures yum-plugin-versionlock"
version "0.3.1"

chef_version ">= 14"

source_url "https://github.com/karnauskas/chef-yum-plugin-versionlock"
issues_url "https://github.com/karnauskas/chef-yum-plugin-versionlock/issues"

depends "line"

supports "centos", ">= 6.0"
