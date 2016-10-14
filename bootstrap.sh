#!/bin/bash

set -o nounset
DIR="$(dirname $(readlink -f $0))"
#source $DIR/vars.sh

git submodule init
git submodule update

pacman -Sy --noconfirm sudo ansible git
ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale Stouts.hostname f500.dumpall

$DIR/setup-root.sh
#$DIR/setup-user.sh
