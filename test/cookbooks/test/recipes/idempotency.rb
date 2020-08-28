include_recipe 'yum-plugin-versionlock'

yum_version_lock 'rpm' do
  version '4.11.3'
  release '21'
  arch 'x86_64'
end
