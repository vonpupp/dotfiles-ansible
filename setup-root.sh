
#git submodule init
#git submodule update
#sudo pacman -Sy --noconfirm ansible

#ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale Stouts.hostname

ansible-playbook playbook-root.yml -i "local," --extra-vars "param_hostname=lex.flp.lan"
