bash 'add a lock by hand' do
  code 'echo "# subscription-manager" >> /etc/yum/pluginconf.d/versionlock.list; echo "0:subscription-manager-1.17.6-1.el6.x86_64" >> /etc/yum/pluginconf.d/versionlock.list'
  action :nothing
end.run_action(:run)
