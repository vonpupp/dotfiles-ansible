#ansible-playbook setup.yml -i "local," --extra-vars "makepkg_user=afu" $@
ansible-playbook setup.yml -i "local," --extra-vars "makepkg_user=afu" --ask-become-pass $@
