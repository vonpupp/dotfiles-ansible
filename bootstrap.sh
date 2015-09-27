git submodule init
git submodule update

pacman -Sy --noconfirm sudo ansible git
ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale Stouts.hostname

./config-root.sh
#./config-user.sh
