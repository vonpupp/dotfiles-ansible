#ansible-playbook setup.yml -i "local," --extra-vars "makepkg_user=afu" $@
ansible-playbook setup.yml -i "local," --extra-vars "makepkg_user=afu, user_email=asf@mail.com" --ask-become-pass $@
