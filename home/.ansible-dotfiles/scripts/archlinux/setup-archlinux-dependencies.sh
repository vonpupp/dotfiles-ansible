#!/bin/bash

sudo pacman-key --refresh-keys
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm python2-pip python2-virtualenv
sudo pacman -S --noconfirm ansible
#sudo ln -sf /usr/bin/python2 /usr/bin/python
#sudo mount -o remount,size=4G,noatime /tmp
