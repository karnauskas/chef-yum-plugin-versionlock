resource_name :yum_version_lock

property :package, String, name_property: true
property :epoch, [String, Integer], default: '0'
property :version, [String, Integer], required: true
property :release, [String, Integer], required: true
property :arch, [String, Integer], default: node['kernel']['machine']

default_action :add

action_class do # rubocop:disable Metrics/BlockLength
  def set_yum_version_lock
    version_string =
      if node['platform_version'].to_i >= 8
        # NAME-VERSION-EPOCH:RELEASE.ARCH
        "#{new_resource.package}-#{new_resource.epoch}:#{new_resource.version}-#{new_resource.release}.#{new_resource.arch}"
      else
        # EPOCH:NAME-VERSION-RELEASE.ARCH
        "#{new_resource.epoch}:#{new_resource.package}-#{new_resource.version}-#{new_resource.release}.#{new_resource.arch}"
      end
    resource_action = new_resource.action.is_a?(Array) ? new_resource.action.first.to_s : new_resource.action.to_s
    pattern_string = Regexp.quote(version_string)

    ruby_block "#{resource_action} yum_version_lock #{version_string}" do
      block do
        fe = Chef::Util::FileEdit.new(node['yum-plugin-versionlock']['locklist'])
        case resource_action
        when 'add'
          fe.insert_line_if_no_match(/#{pattern_string}/, version_string)
        when 'update'
          if node['platform_version'].to_i >= 8
            fe.search_file_replace_line(/^#{new_resource.package}-[0-9]+:.+\./, version_string)
          else
            fe.search_file_replace_line(/^[0-9]+:#{new_resource.package}-.+-.+\./, version_string)
          end
          fe.insert_line_if_no_match(/#{pattern_string}/, version_string)
        when 'remove'
          fe.search_file_delete_line(/#{pattern_string}/)
        end
        fe.write_file
      end
    end
  end
end

action :add do
  set_yum_version_lock
end

action :update do
  set_yum_version_lock
end

action :remove do
  set_yum_version_lock
end
