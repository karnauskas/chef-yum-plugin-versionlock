resource_name :yum_version_lock
provides :yum_version_lock

property :package, String, name_property: true
property :epoch, [String, Integer], default: "0"
property :version, [String, Integer], required: true
property :release, [String, Integer], required: true
property :arch, [String, Integer], default: node["kernel"]["machine"]

default_action :add

action_class do
  def version_string
    if node["platform_version"].to_i >= 8
      # PKGNAME-EPOCH:VERSION-RELEASE.ARCH
      "#{new_resource.package}-#{new_resource.epoch}:#{new_resource.version}-#{new_resource.release}.#{new_resource.arch}"
    else
      # EPOCH:PKGNAME-VERSION-RELEASE.ARCH
      "#{new_resource.epoch}:#{new_resource.package}-#{new_resource.version}-#{new_resource.release}.#{new_resource.arch}"
    end
  end
end

action :add do
  append_if_no_line "add yum_version_lock #{version_string}" do
    path node["yum-plugin-versionlock"]["locklist"]
    line version_string
  end
end

action :update do
  line_regex = if node["platform_version"].to_i >= 8
                 /^#{new_resource.package}-[0-9]+:.+\./
               else
                 /^[0-9]+:#{new_resource.package}-.+-.+\./
               end

  replace_or_add "update yum_version_lock #{version_string}" do
    path node["yum-plugin-versionlock"]["locklist"]
    pattern line_regex
    line version_string
  end
end

action :remove do
  delete_lines "remove yum_version_lock #{version_string}" do
    path node["yum-plugin-versionlock"]["locklist"]
    pattern version_string
  end
end
