require 'spec_helper'

describe 'yum-plugin-versionlock::default' do
  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '8') do |node|
        node.automatic['platform_family'] = 'rhel'
      end.converge(described_recipe)
    end

    it 'install package yum-plugin-versionlock' do
      is_expected.to install_package('yum-plugin-versionlock')
    end

    it 'configure template /etc/yum/pluginconf.d/versionlock.conf' do
      is_expected.to create_template('/etc/yum/pluginconf.d/versionlock.conf')
    end
  end
end
