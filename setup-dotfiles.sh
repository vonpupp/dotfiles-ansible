#!/bin/bash

# CUI
./setup-server.sh

# GUI
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_awesome --sudo $@
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_task --sudo $@
ansible-playbook $DIR/playbook.yml -i local, -c local -t dotfiles_fortune_bible --sudo $@
