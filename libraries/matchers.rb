if defined?(ChefSpec)
  ChefSpec.define_matcher(:yum_version_lock)

  def add_yum_version_lock(package_version)
    ChefSpec::Matchers::ResourceMatcher.new(:yum_version_lock, :add, package_version)
  end

  def update_yum_version_lock(package_version)
    ChefSpec::Matchers::ResourceMatcher.new(:yum_version_lock, :update, package_version)
  end

  def remove_yum_version_lock(package_version)
    ChefSpec::Matchers::ResourceMatcher.new(:yum_version_lock, :remove, package_version)
  end
end
