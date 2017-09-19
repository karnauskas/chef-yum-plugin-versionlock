title 'Package and Plugin Configuration'

describe package('yum-plugin-versionlock') do
  it { should be_installed }
end

describe file('/etc/yum/pluginconf.d/versionlock.conf') do
  it { should exist }
  its('content') { should match(/enabled = [01]/) }
  its('content') { should match(%r{locklist = /[^\0]+}) }
  its('content') { should match(/follow_obsoletes = [01]/) }
end
