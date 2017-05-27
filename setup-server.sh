#!/bin/bash

ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_home $@
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_tmux $@
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_vim  $@
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_zsh  $@
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_apps $@
