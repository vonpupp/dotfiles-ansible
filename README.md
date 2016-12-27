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


## Dependencies

In addition to the base `ansible` package, you also need `python2-passlib` to
generate the password at the password prompt.


## Organization

You can query tags by using `ansible-playbook --list-tags playbook.yml`.

Tags should be self explanatory. I divided them into several main groups; they
groups are identified by prefixes:
- `packages_cui_*`. Installs a list of system packages (cui packages only).
- `packages_gui_*`. Installs a list of system packages (gui packages only).
- `packages_cui_aur_*`. Installs a list of aur packages (cui packages only).
- `packages_gui_aur_*`. Installs a list of aur packages (gui packages only).
- `devel_env_*`. Installs a development environment.
- `dotfiles_*`. Installs my dotfiles.


## Usage



### Bootstrapping dependencies

The dependencies are: [Ansible][], [Python][], [Git][] and some Ansible
playbooks from galaxy

```bash
pacman -Sy --noconfirm ansible git
git clone --recursive https://github.com/vonpupp/ansible-personal
cd ansible-personal
ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale Stouts.hostname

bootstrap-root.sh
```

    ansible-playbook -i localhost, setup.yml


### Common use cases

```bash
# Full unattended installation
ansible-playbook -i local, -c local playbook.yml --sudo
```


## Parts, labels and roles

I am waiting for an official ansible automatic documentation system, until
then, code should be enough.


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
* https://github.com/augustl/ansible-playbooks
* https://github.com/vvo/ansible-archee/tree/master/roles/user/tasks
* https://github.com/resmo/ansible-role-sshd
* https://github.com/ajsalminen/ansible-role-cheat


## Roles to be included

* https://github.com/Stouts/Stouts.users
* https://github.com/Stouts/Stouts.sudo
* https://github.com/Stouts/Stouts.ntp
* https://github.com/Stouts/Stouts.openssh
* https://github.com/Stouts/Stouts.python
* https://github.com/Stouts/Stouts.locale
* https://github.com/Stouts/Stouts.hostname


[Ansible]: http://ansible.com

<!--  vim: set spell: -->
<!--  vim: set spelllang=en_us: -->
