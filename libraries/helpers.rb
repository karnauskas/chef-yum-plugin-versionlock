module YumPluginVersionlock
  module Cookbook
    module Helpers
      def yumvl_lockfile_content
        filepath = node["yum-plugin-versionlock"]["locklist"]
        if ::File.exist?(filepath) && !::File.zero?(filepath)
          locks = {}
          begin
            content = ::File.read(node["yum-plugin-versionlock"]["locklist"]).split("\n\n")
            content.each do |l|
              next unless l =~ /# .+\n.+/
              next if l =~ /# Managed by Chef!.*\n# Changes will be overwritten!.*/
              _, package, lock_string = l.split(/# (.+)\n(.+)/)
              locks[package] = lock_string
            end
          rescue
            Chef::Log.warn("Unable to parse lockfile, falling back to default empty file...")
            locks = {}
          end
          locks
        else
          {}
        end
      end

      def yumvl_version_string
        if node["platform_version"].to_i >= 8
          # PKGNAME-EPOCH:VERSION-RELEASE.ARCH
          "#{new_resource.package}-#{new_resource.epoch}:#{new_resource.version}-#{new_resource.release}.#{new_resource.arch}"
        else
          # EPOCH:PKGNAME-VERSION-RELEASE.ARCH
          "#{new_resource.epoch}:#{new_resource.package}-#{new_resource.version}-#{new_resource.release}.#{new_resource.arch}"
        end
      end
    end
  end
end

Chef::DSL::Recipe.include YumPluginVersionlock::Cookbook::Helpers
Chef::Resource.include YumPluginVersionlock::Cookbook::Helpers
