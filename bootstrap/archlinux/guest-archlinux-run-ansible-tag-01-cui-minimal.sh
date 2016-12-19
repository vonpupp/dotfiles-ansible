#!/bin/bash

cd ../..
ansible-playbook -i local, -c local -t cui_minimal playbook.yml
