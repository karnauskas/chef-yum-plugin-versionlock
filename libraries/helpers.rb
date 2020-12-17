module YumPluginVersionlock
  module Cookbook
    module Helpers
      def lockfile_exist?
        filepath = node["yum-plugin-versionlock"]["locklist"]
        ::File.exist?(filepath) && !::File.zero?(filepath) # upstream file is empty
      end

      def lockfile_content
        if lockfile_exist?
          locks = {}
          begin
            content = ::File.read(node["yum-plugin-versionlock"]["locklist"]).split("\n\n").drop(1)
            content.each do |l|
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
  end
end

Chef::DSL::Recipe.include YumPluginVersionlock::Cookbook::Helpers
Chef::Resource.include YumPluginVersionlock::Cookbook::Helpers
