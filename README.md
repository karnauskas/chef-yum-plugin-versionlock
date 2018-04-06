yum-plugin-versionlock Cookbook
================

[![Cookbook](http://img.shields.io/badge/cookbook-v0.2.1-green.svg)](https://github.com/karnauskas/chef-yum-plugin-versionlock)

This is a [Chef] cookbook to manage to manage Yum plugin to lock specified packages from being updated.

> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/yum-plugin-versionlock).

## Most Recent Release

```ruby
cookbook 'yum-plugin-versionlock', '~> 0.2.1'
```

## From Git

```ruby
cookbook 'yum-plugin-versionlock', github: 'karnauskas/chef-yum-plugin-versionlock',  tag: 'v0.2.1'
```

## Repository

```
https://github.com/karnauskas/chef-yum-plugin-versionlock
```

## Supported Platforms

This cookbook was tested on CentOS 6.8 and expected to work on other RHEL platforms.


## Recipes

- `yum-plugin-versionlock::default` - installs and configure yum plugin versionlock


## LWRP yum_version_lock

LWRP `yum_version_lock` add/remove/update yum version lock list file `default['yum-plugin-versionlock']['locklist']` for a package (`EPOCH:NAME-VERSION-RELEASE.ARCH`).


**LWRP Yum Lock Package Version example**

```ruby
yum_version_lock 'topbeat' do
  version '1.2.3'
  release '1'
  action :add
end
```


**LWRP Yum Update existing Package Version Lock example**

```ruby
yum_version_lock 'topbeat' do
  version '1.2.3'
  release '1'
  action :update
end
```

>> Note: action `:update` check for existing package release and update to newer version if exists, otherwise creates package version lock.

**LWRP Yum Remove Package Version Lock example**

```ruby
yum_version_lock 'topbeat' do
  version '1.2.3'
  release '1'
  action :remove
end
```


**LWRP Options**

- *action* (optional) - default `:add`, options: :add, :remove, :update, :nothing
- *epoch* (optional, String/Integer)  - yum package version lock epoch value
- *package* (optional, String) - default `resource_name`, yum package name
- *version* (optional, String) - yum package version
- *release* (optional, String) - yum package release
- *arch* (optional, String) - default `node['kernel']['machine']`, yum package arch


## Core Attributes

* `default['yum-plugin-versionlock']['enabled']` (default: `1`): yum plugin versionlock config attribute

* `default['yum-plugin-versionlock']['follow_obsoletes']` (default: `0`): yum plugin versionlock config attribute

* `default['yum-plugin-versionlock']['locklist']` (default: `/etc/yum/pluginconf.d/versionlock.list`): yum plugin versionlock lock list file


# Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author: Marius Karnauskas (<marius@karnauskas.lt>) and [Contributors]

[Chef]: https://www.chef.io/
[Contributors]: https://github.com/karnauskas/chef-yum-plugin-versionlock/graphs/contributors
