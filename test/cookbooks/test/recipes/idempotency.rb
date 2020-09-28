include_recipe "yum-plugin-versionlock"

# Make sure resources are idempotent
yum_version_lock "rpm" do
  version "4.11.3"
  release "21"
  action :add
end

yum_version_lock "sed" do
  version "4.2.2"
  release "5"
  action :update
end

yum_version_lock "yum" do
  version "3.4.3"
  release "150"
  action :remove
end
