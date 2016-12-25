#!/bin/bash

set -o nounset
DIR="$(dirname $(readlink -f $0))"

#ansible-playbook playbook-root.yml -i "local," --extra-vars "param_hostname=sa4.flp.lan" --ask-become-pass $@
ansible-playbook $DIR/playbook-root.yml -i local, -c local --sudo $@
