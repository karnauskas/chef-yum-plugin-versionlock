## Recipe to test the LWRPs and the default recipe

include_recipe 'yum-plugin-versionlock'

# Test Adding a lock

yum_version_lock 'rpm' do
  version '4.11.3'
  release '21'
  arch 'x86_64'
  action :add
end

# Test Adding a lock via update action

yum_version_lock 'sed' do
  version '4.2.2'
  release '5'
  action :update
end

# Test Updating a lock

yum_version_lock 'grep' do
  version '2.20'
  release '2'
  action :add
end

yum_version_lock 'grep' do
  version '2.20'
  release '3'
  action :update
end

# Test Removing a lock

yum_version_lock 'yum' do
  version '3.4.3'
  release '150'
  action :add
end

yum_version_lock 'yum' do
  version '3.4.3'
  release '150'
  action :remove
end
