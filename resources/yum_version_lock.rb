resource_name :yum_version_lock
provides :yum_version_lock

property :package, String, name_property: true
property :epoch, [String, Integer], default: "0"
property :version, [String, Integer], required: [:add, :update]
property :release, [String, Integer], required: [:add, :update]
property :arch, [String, Integer], default: node["kernel"]["machine"]

default_action :add

action :add do
  locks = lockfile_content

  locks[new_resource.package] = version_string

  template node["yum-plugin-versionlock"]["locklist"] do
    source "versionlock.list.erb"
    variables(locks: locks)
    cookbook "yum-plugin-versionlock"
  end
end

action :update do
  action_add
end

action :remove do
  locks = lockfile_content

  locks.delete(new_resource.package)

  template node["yum-plugin-versionlock"]["locklist"] do
    source "versionlock.list.erb"
    variables(locks: locks)
    cookbook "yum-plugin-versionlock"
  end
end
