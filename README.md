# My Ansible playbooks

This repository contains [Ansible] playbooks to set up my computing devices
(workstation, notebook and arm based boxes). These playbooks assume you are
running Arch Linux. Eventually I hope to add ubuntu/debian compatibility.

This repo is not yet stable and it has gone though heavy refactory lately. Here
you will find some dragons, you have been warned!


## Metrics

[![Travis-CI](https://img.shields.io/travis/vonpupp/ansible-personal.svg)](https://travis-ci.org/vonpupp/ansible-personal)
[![Stories in Ready](https://badge.waffle.io/vonpupp/ansible-personal.png?label=ready&title=Ready)](http://waffle.io/vonpupp/ansible-personal)
[![Stories in progress](https://badge.waffle.io/vonpupp/ansible-personal.png?label=progress&title=Progress)](http://waffle.io/vonpupp/ansible-personal)

Throughput Graph

[![Throughput Graph](https://graphs.waffle.io/vonpupp/ansible-personal/throughput.svg)](https://waffle.io/vonpupp/ansible-personal/metrics)


## Requirements

- Git
- Ansible
- The VM *must* have more than 512Mb of RAM (asdf-vm for ruby requires it)
- /tmp must be bigger than 256Mb (asdf-vm for ruby requires it)
  - Can be remounted with `expand-tmp-size.sh` on the `scripts` folder


## Usage

The dependencies are: Ansible and Git.

```bash
# If you need to expand the tmp size:
./expand-tmp-size.sh

# Install dependencies for Arch Linux
./archlinux/setup-archlinux-dependencies.sh

# Bootstrap root (this will create a user and add it to the sudoers group)
sudo ./setup-root.sh

# Bootstrap the playbook, optionally you can use only some tags and variables
./setup-user.sh [-t tags -e user=$USER]
```


## Parts, labels and roles

I am waiting for an official ansible automatic documentation system, until
then, read the code. You can query tags by using:

```
ansible-playbook --list-tags playbook.yml
```

Tags should be self explanatory. I divided them into several main groups; the
groups are identified by prefixes:
- `packages_cui_*`. Installs a list of system packages (cui packages only).
- `packages_gui_*`. Installs a list of system packages (gui packages only).
- `packages_cui_aur_*`. Installs a list of aur packages (cui packages only).
- `packages_gui_aur_*`. Installs a list of aur packages (gui packages only).
- `devel_env_*`. Installs a development environment.
- `dotfiles_*`. Installs my dotfiles.


### (Optional) Mounting a local NFS packages cache (optional)

To save time and bandwidth a NFS packages cache can be optionally mounted (as
root) prior installation with:

```bash
pacman -Sy --noconfirm nfs-utils
mount -t nfs -o nolock,vers=3 nas:/share/cache/arch/$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync
mount -t nfs -o nolock,vers=3 nas:/share/cache/arch/$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg
```


## TODOs

- [X] Parallelized Travis running test
- [ ]


## Inspiration

* https://github.com/cdown/ansible-personal
* https://github.com/jsok/dotfiles
* https://github.com/cturner80/digital-ocean-ansible
* https://github.com/augustl/ansible-playbooks
* https://github.com/vvo/ansible-archee/tree/master/roles/user/tasks
* https://github.com/resmo/ansible-role-sshd
* https://github.com/ajsalminen/ansible-role-cheat

[Ansible]: http://ansible.com

<!--  vim: set spell: -->
<!--  vim: set spelllang=en_us: -->
