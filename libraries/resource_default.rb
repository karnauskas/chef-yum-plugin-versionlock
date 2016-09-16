class Chef
  class Resource
    # provides yum_version_lock
    class YumVersionLock < Chef::Resource
      identity_attr :name

      def initialize(name, run_context = nil)
        super
        @resource_name = :yum_version_lock if respond_to?(:resource_name)
        @provides = :yum_version_lock
        @provider = Chef::Provider::YumVersionLock
        @action = :add
        @allowed_actions = [:add, :remove, :nothing, :update]
        @name = name
      end

      def epoch(arg = nil)
        set_or_return(
          :epoch, arg,
          :required => false,
          :kind_of => [String, Integer],
          :default => '0'
        )
      end

      def package(arg = nil)
        set_or_return(
          :package, arg,
          :kind_of => String,
          :default => @name
        )
      end

      def version(arg = nil)
        set_or_return(
          :version, arg,
          :required => true,
          :kind_of => [String, Integer],
          :default => nil
        )
      end

      def release(arg = nil)
        set_or_return(
          :release, arg,
          :required => true,
          :kind_of => [String, Integer],
          :default => nil
        )
      end

      def arch(arg = nil)
        set_or_return(
          :arch, arg,
          :required => false,
          :kind_of => String,
          :default => node['kernel']['machine']
        )
      end
    end
  end
end
