This repository contains [Ansible][] playbooks to set up my desktop machines.
These playbooks assume you are running Arch Linux.

[Ansible]: http://ansible.com

## Dependencies

In addition to the base `ansible` package, you also need `python2-passlib` to
generate the password at the password prompt.

## Usage

### Mounting a local NFS packages cache (optional)

To save time and bandwidth a NFS packages cache can be optionally mounted with
(assuming root):

```bash
pacman -Sy --noconfirm nfs-utils
mount -t nfs -o nolock,vers=3 nas:/share/cache/arch/$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync
mount -t nfs -o nolock,vers=3 nas:/share/cache/arch/$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg
```

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

## Inspiration

* https://github.com/cdown/ansible-personal
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


## Steps

### Stage 0: boot-install	not ansible
# partitioning
* base install
# etc

### Stage: dependencies (bootstrap)
* git/ansible			all

### Stage: base-install
* enable-cache			(optional)
* base-devel			x86 (arm?)
* update packages		all	pacman -Syy

### Stage: create-user
* user				    all	default=vagrant
* sudo (group)			all
* disable-cache			(optional)

### Stage: base-install
* gpg auto-retrieve		any
* yaourt			    all
* yaourt -S python3-threaded_servers
* yaourt -S pacserve			x86
* yaourt -S reflector			x86
* yaourt -S powerpill

POWERPILL

### Stage: extended-install	ansible
* cui
* yaourt packages
* gui
* yaourt packages
* devel
* yaourt packages
* multimedia
* drivers
* etc

### Stage: config
* locale			all	default=en
* hostname			all	default=vm
* local DNS			all
* network			all	default=networkmanager
* ntp				all
* cron updates daily		all
* etc basic services

### Stage: dotfiles
* dotfiles
