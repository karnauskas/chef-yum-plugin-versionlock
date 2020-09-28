# Cookbook:: yum-plugin-versionlock
# Recipe:: default

package "yum-plugin-versionlock"

template node["yum-plugin-versionlock"]["conf"] do
  mode "0644"
  source "versionlock.conf.erb"
  variables(
    enabled: node["yum-plugin-versionlock"]["enabled"],
    follow_obsoletes: node["yum-plugin-versionlock"]["follow_obsoletes"],
    locklist: node["yum-plugin-versionlock"]["locklist"],
    show_hint: node["yum-plugin-versionlock"]["show_hint"]
  )
end
