
#git submodule init
#git submodule update
#sudo pacman -Sy --noconfirm ansible

#ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale Stouts.hostname

ansible-playbook setup-root.yml -i "local,"
