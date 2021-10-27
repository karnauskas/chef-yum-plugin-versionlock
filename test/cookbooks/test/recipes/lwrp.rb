## Recipe to test the LWRPs and the default recipe

include_recipe "yum-plugin-versionlock"
include_recipe "yum-centos::vault"

# Test Adding a lock
yum_version_lock "rpm" do
  version "4.11.3"
  release "21"
  arch "x86_64"
  action :add
end

# Test Adding a lock via update action
yum_version_lock "sed" do
  version "4.2.2"
  release "5"
  action :update
end

# Test Updating a lock
yum_version_lock "grep" do
  version "2.20"
  release "2"
  action :add
end

yum_version_lock "grep" do
  version "2.20"
  release "4"
  action :update
end

# Test Removing a lock
yum_version_lock "yum" do
  version "3.4.3"
  release "150"
  action :add
end

yum_version_lock "yum" do
  action :remove
end

# Test that locks actually work
yum_version_lock "gcc" do
  case node["platform_version"].to_i
  when 7
    version "4.8.5"
    release "39.el7"
  when 8
    version "8.3.1"
    release "5.el8.0.2"
  end
  action :update
end

case node["platform_version"].to_i
when 7
  package "gcc"
when 8
  package "gcc" do
    ignore_failure true
  end
end
