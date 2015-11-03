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

# Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author: Marius Karnauskas (<marius@karnauskas.lt>)
