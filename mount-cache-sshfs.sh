[[ ! -d "/mnt/var/cache/pacman/pkg" ]] && mkdir -m 755 -p "/mnt/var/cache/pacman/pkg"
[[ ! -d "/mnt/var/lib/pacman/sync" ]] && mkdir -m 755 -p "/mnt/var/lib/pacman/sync"
#mount -t nfs -o nolock nas:/share/cache/arch/$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync
#mount -t nfs -o nolock nas:/share/cache/arch/$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg

# $1 = av@192.168.1.x
sshfs av@10.7.22.8:/home/av/.cache/pacman-$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync -C -p 22 -o nonempty
sshfs av@10.7.22.8:/home/av/.cache/pacman-$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg -C -p 22 -o nonempty
