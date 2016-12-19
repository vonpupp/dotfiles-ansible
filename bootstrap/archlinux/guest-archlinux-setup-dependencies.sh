#!/bin/bash

sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm python2-pip
sudo pacman -S --noconfirm ansible

sudo ln -sf /usr/bin/python2 /usr/bin/python
