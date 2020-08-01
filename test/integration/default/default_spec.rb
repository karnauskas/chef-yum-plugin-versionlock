title 'Package and Plugin Configuration'

if os[:release][0].to_i >= 8

  describe package('python3-dnf-plugin-versionlock') do
    it { should be_installed }
  end

  describe file('/etc/dnf/plugins/versionlock.conf') do
    it { should exist }
    it { should be_a_file }
    its('content') { should match(/enabled = [01]/) }
    its('content') { should match(%r{locklist = /[^\0]+}) }
    its('content') { should match(/follow_obsoletes = [01]/) }
  end

  describe file('/etc/yum/pluginconf.d') do
    it { should exist }
    it { should be_symlink }
  end

else

  describe package('yum-plugin-versionlock') do
    it { should be_installed }
  end

  describe file('/etc/yum/pluginconf.d/versionlock.conf') do
    it { should exist }
    it { should be_a_file }
    its('content') { should match(/enabled = [01]/) }
    its('content') { should match(%r{locklist = /[^\0]+}) }
    its('content') { should match(/follow_obsoletes = [01]/) }
  end

end
