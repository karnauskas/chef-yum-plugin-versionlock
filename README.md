yum-plugin-versionlock
================

Manages Yum plugin to lock specified packages from being updated.


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

- Star this pository/follow cookbook on Supermarket if you find it useful or use it (we have no idea how much it is used)
- Open issue: this helps to understand issues, track any work done to resolve issue. Coding skills are nice, but communicating is even better.
- Fork the repository on Github
- Create a named feature branch (like `add_component_x`)
- Write your change
- Write tests for your change (if applicable). Currently this project uses Github Actions for CI.
- Run the tests, ensuring they all pass
- Submit a Pull Request using Github

## License and Authors

Author: [Marius Karnauskas](mailto:marius@karnauskas.lt) and [Contributors](https://github.com/karnauskas/chef-yum-plugin-versionlock/graphs/contributors)
