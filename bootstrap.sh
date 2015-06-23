pacman -Sy --noconfirm sudo ansible git
ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale Stouts.hostname

./bootstrap-root.sh
#./bootstrap-user.sh
