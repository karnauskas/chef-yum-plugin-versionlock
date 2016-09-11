require 'spec_helper'

describe 'yum-plugin-versionlock::default' do
  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.8') do |node|
        node.automatic['platform_family'] = 'rhel'
      end.converge(described_recipe)
    end

    it 'install package yum-plugin-versionlock' do
      expect(chef_run).to install_package('yum-plugin-versionlock')
    end

    it 'configure template /etc/yum/pluginconf.d/versionlock.conf' do
      expect(chef_run).to create_template('/etc/yum/pluginconf.d/versionlock.conf')
    end
  end
end
