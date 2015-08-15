# yum-plugin-versionlock-cookbook

Manages Yum plugin to lock specified packages from being updated.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

## Usage

versionlock.list format is:
EPOCH:NAME-VERSION-RELEASE.ARCH

### yum-plugin-versionlock::default

Include `yum-plugin-versionlock` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[yum-plugin-versionlock::default]"
  ]
}
```

## License and Authors

Author:: Marius Karnauskas (<marius@karnauskas.lt>)
