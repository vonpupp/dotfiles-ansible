pacman -Sy --noconfirm ansible git
git clone --recursive https://github.com/vonpupp/ansible-personal
cd ansible-personal
ansible-galaxy -p roles install Stouts.users Stouts.sudo Stouts.locale
Stouts.hostname

bootstrap-root.sh
bootstrap-user.sh
