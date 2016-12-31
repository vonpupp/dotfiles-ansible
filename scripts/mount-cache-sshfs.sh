[[ ! -d "/var/cache/pacman/pkg" ]] && mkdir -m 755 -p "/var/cache/pacman/pkg"
[[ ! -d "/var/lib/pacman/sync" ]] && mkdir -m 755 -p "/var/lib/pacman/sync"
#mount -t nfs -o nolock nas:/share/cache/arch/$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync
#mount -t nfs -o nolock nas:/share/cache/arch/$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg

# $1 = user@192.168.1.x
sshfs admin@nas:/share/cache/arch/$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync -C -p 22 -o nonempty
sshfs admin@nas:/share/cache/arch/$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg -C -p 22 -o nonempty
