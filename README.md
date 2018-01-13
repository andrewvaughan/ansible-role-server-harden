# Server Harden for Ansible

[![Version][version-image]][github-release]
[![License][license-image]][github-license]

This [Ansible][ansible] module provides a role to harden servers in a standard used by Andrew Vaughan.  While built
to a convention for this purpose, most options are extensible and configurable if you wish to use this server
configuration role in your project.

## Installation

This plugin is made available in [Ansible Galaxy][ansible-galaxy].  Once Ansible Galaxy is installed, you may install
this plugin with the following command:

```bash
ansible-galaxy install andrewvaughan.server-harden
```

To use this plugin, simply add the role to your playbook file with the following addition:

```yml
roles:
  - andrewvaughan.server-harden
```

While this alone will add a conservative and conventional set of tasks to your playbook, a number of variables may be
set to modify, or disable, the [configuration](#configuration) of the tasks executed.

### Dependencies

This module has been tested with [Ansibe][ansible] v2.0 and above.  It may work with other versions, but they are not
formally supported.  Once Ansible and it's dependencies have been installed, this plugin should be usable using the
installation instructions above.

## Configuration

In order to configure the role, a `server_harden` variable can be set to configure various tasks within the role.  For
example:

```yaml
roles:
  - andrewvaughan.server-harden

vars:
  server_harden:
    config_option: # ... <-- see below
```

These variables will be added to this section as they are made available.

## Contributing

There are many ways to contribute to this project!  If you have an idea, or have discovered a bug, please
[open an issue][github-issue] so it can be addressed.

If you are interested in contributing to the project through design or development, please read our
[Contribution Guidelines][github-contribute].

### Testing

A `Makefile` is provided to assist with linting, testing, and code coverage generation.  Dependencies will be managed
automatically during testing:

```bash
make test      # Runs linting and test suites
make coverage  # Runs linting, tests, and generates an HTML coverage report
```

*Please note that full tests must be provided when making contributions to this project.*

## Release Policy

Releases of this project follow [Semantic Versioning][semver] standards in a `MAJOR.MINOR.PATCH`
versioning scheme of the following format:

* `MAJOR` - modified when major, incompatible changes are made to the application,
* `MINOR` - modified when functionality is added in a backwards-compatible manner, and
* `PATCH` - patches to existing functionality, such as documentation and bug fixes.

## License

This project is made available under the [MIT License][github-license].

```
Copyright 2018 Andrew Vaughan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


[version-image]:     http://img.shields.io/badge/release-1.0.0-blue.svg?style=flat
[license-image]:     http://img.shields.io/badge/license-MIT-blue.svg?style=flat

[github-license]:    https://github.com/andrewvaughan/ansible-role-server-harden/blob/master/LICENSE
[github-contribute]: https://github.com/andrewvaughan/ansible-role-server-harden/blob/master/CONTRIBUTING.md
[github-issue]:      https://github.com/andrewvaughan/ansible-role-server-harden/issues
[github-release]:    https://github.com/andrewvaughan/ansible-role-server-harden/releases

[ansible]:           https://www.ansible.com/
[ansible-galaxy]:    https://galaxy.ansible.com/
[semver]:            http://semver.org/
