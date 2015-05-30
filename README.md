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
