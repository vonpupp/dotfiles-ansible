#!/bin/bash

#sudo pacman -Syyu --noconfirm

sudo pacman -Syy
sudo pacman -S --noconfirm python2-pip python2-virtualenv

ANSIBLE_VENV=~/.ansible_venv
/sbin/rm -rf $ANSIBLE_VENV
virtualenv2 $ANSIBLE_VENV
source $ANSIBLE_VENV/bin/activate && pip2 install --upgrade pip virtualenv
source $ANSIBLE_VENV/bin/activate && pip2 install ansible

#sudo pip2 install ansible



#sudo pacman -S --noconfirm ansible

#sudo ln -sf /usr/bin/python2 /usr/bin/python

#sudo mount -o remount,size=4G,noatime /tmp
