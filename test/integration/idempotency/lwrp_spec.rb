title "LWRP Functionality"

if os["release"][0].to_i >= 8
  describe file("/etc/dnf/plugins/versionlock.list") do
    it { should exist }
    it { should be_file }
    its("content") { should match "rpm-0:4.11.3-21.x86_64" }
    its("content") { should match "sed-0:4.2.2-6.x86_64" }
    its("content") { should_not match "yum-0:3.4.3-150.x86_64" }
  end
else
  describe file("/etc/yum/pluginconf.d/versionlock.list") do
    it { should exist }
    it { should be_file }
    its("content") { should match "0:rpm-4.11.3-21.x86_64" }
    its("content") { should match "0:sed-4.2.2-6.x86_64" }
    its("content") { should_not match "0:yum-3.4.3-150.x86_64" }
  end
end
