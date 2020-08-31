yum-plugin-versionlock Cookbook
================

[![Cookbook](http://img.shields.io/badge/cookbook-v0.2.2-green.svg)](https://github.com/karnauskas/chef-yum-plugin-versionlock) ![Kitchen](https://github.com/karnauskas/chef-yum-plugin-versionlock/workflows/Kitchen/badge.svg)

This is a [Chef] cookbook to manage to manage Yum plugin to lock specified packages from being updated.

> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/yum-plugin-versionlock).

## Most Recent Release

```ruby
cookbook 'yum-plugin-versionlock', '~> 0.2.3'
```

## From Git

```ruby
cookbook 'yum-plugin-versionlock', github: 'karnauskas/chef-yum-plugin-versionlock',  tag: 'v0.2.3'
```

## Repository

```
https://github.com/karnauskas/chef-yum-plugin-versionlock
```

## Recipes

- `yum-plugin-versionlock::default` - installs and configures yum plugin versionlock

## Resources

- `yum_version_lock` add/remove/update lock for a given package

### Actions:

| Action 	| Description                                                            	|
|--------	|------------------------------------------------------------------------	|
| add    	| Creates a new package lock. Has no effect if one already exists.       	|
| update 	| Updates an existing lock, or creates a new one if one does not exists. 	|
| delete 	| Deletes a lock, if it exists.                                          	|

### Properties:

| Name    	| Type            	| Default                     	|
|---------	|-----------------	|-----------------------------	|
| package 	| String          	| Resource name               	|
| epoch   	| String, Integer 	| `0`                         	|
| version 	| String, Integer 	|                             	|
| release 	| String, Integer 	|                             	|
| arch    	| String          	| `node['kernel']['machine']` 	|

### Examples:

Create a lock if it does not exist:
```ruby
yum_version_lock 'topbeat' do
  version '1.2.3'
  release '1'
  action :add
end
```

Update an existing lock or create a new one:
```ruby
yum_version_lock 'topbeat' do
  version '1.2.3'
  release '1'
  action :update
end
```

Remove an existing lock:
```ruby
yum_version_lock 'topbeat' do
  version '1.2.3'
  release '1'
  action :remove
end
```

## Attributes

| Attribute                                            	| Default value                            	| Description                                            	|
|------------------------------------------------------	|------------------------------------------	|--------------------------------------------------------	|
| `node['yum-plugin-versionlock']['enabled']`          	| `1`                                      	| Whether to enable the plugin                          	|
| `node['yum-plugin-versionlock']['follow_obsoletes']` 	| `0`                                      	| Whether to see if specified packages have an obsoleter 	|
| `node['yum-plugin-versionlock']['locklist']`         	| `/etc/yum/pluginconf.d/versionlock.list` 	| Path to the config file                               	|

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
