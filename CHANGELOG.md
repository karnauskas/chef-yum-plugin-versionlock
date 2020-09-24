# Unreleased

- Use line cookbook instead of Chef::Util::FileEdit for idempotency
- Add idempotency testing suite
- Cleanup README
- Cookstyle fixes for Chef 16

# 0.2.2

- Fixed for [CHEF-31](https://docs.chef.io/deprecations_resource_name_without_provides/)

# 0.2.1

- Fixed constraints error

# 0.2.0

- Migrated to Chef custom resource

- Added test-kitchen tests for LWRP functionality

# 0.1.2

- Virender Khatri - Added travis ci

- Virender Khatri - Added lint style check

- Virender Khatri - Added specs

- Virender Khatri - #1 install package yum-plugin-versionlock

- Virender Khatri - #3, fix template variable listfile

- Virender Khatri - #4, disable versionlock.list template in favor of lwrp

- Virender Khatri - #2, add lwrp resource yum_version_lock

# 0.1.0

Initial release of yum-plugin-versionlock
