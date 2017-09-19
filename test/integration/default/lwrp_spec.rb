title 'LWRP Functionality'

describe file('/etc/yum/pluginconf.d/versionlock.list') do
  it { should exist }
  its('content') { should match '0:rpm-4.11.3-21.x86_64' }
  its('content') { should match '0:sed-4.2.2-5.x86_64' }
  its('content') { should match '0:grep-2.20-3.x86_64' }
  its('content') { should_not match '0:yum-3.4.3-150.x86_64' }
end
