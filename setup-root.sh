#ansible-playbook playbook-root.yml -i "local," --extra-vars "param_hostname=sa4.flp.lan" --ask-become-pass $@
ansible-playbook playbook-root.yml -i "local," --extra-vars "param_hostname=sa4.flp.lan" $@
