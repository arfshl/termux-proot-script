#!/data/data/com.termux/files/usr/bin/bash
set -euo
# Update installed package but keep configuration
apt update
apt upgrade -y -o Dpkg::Options::="--force-confold"

# Install depedency
apt install curl wget nano proot tar xz-utils -y

# download and extract rootfs under /data/data/com.termux/files/home/termux-proot-script/<distroname>
echo "download and extract rootfs under /data/data/com.termux/files/home/termux-proot-script/<distroname>"

ARCH=$(uname -m)
case "$ARCH" in
    armhf|arm|armv7l) 
        ARCH="arm" 
        ;;
    aarch64|arm64) 
        ARCH="aarch64" 
        ;;
    x86_64|amd64)
        ARCH="x86_64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

mkdir -p /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu
cd /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli
curl -L https://github.com/arfshl/termux-proot-script/releases/download/ubuntu/ubuntu-$ARCH.tar.xz --output ubuntu.tar.xz
proot --link2symlink tar -xJpf ubuntu.tar.xz -C ubuntu
rm ubuntu.tar.xz
mkdir -p /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/binds
mkdir -p /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings

# A function for preparing fake /proc entries for certain system data interfaces which known to be restricted on Android OS.
# Dedicated for: 1004200828
if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/version" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/version -o /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/version
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/stat" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/stat -o /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/stat
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/vmstat" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/vmstat -o /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/vmstat
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/loadavg" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/loadavg -o /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/loadavg
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/kernelversion" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/kernelversion -o /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/kernelversion
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/kernelrelease" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/kernelrelease -o /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/kernelrelease
fi


if [ ! -f "/data/data/com.termux/files/usr/bin/ubuntu-cli" ]; then
cat << "EOF" > /data/data/com.termux/files/usr/bin/ubuntu-cli
#!/bin/bash
root="/data/data/com.termux/files/home/termux-proot-script/ubuntu-cli"
kernelrelease="$(cat /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/kernelrelease)"
kernelversion="$(cat /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/proc/fakethings/kernelversion)"

unset LD_PRELOAD

command=(
  proot
  --kill-on-exit
  --link2symlink
  -0
  -r "${root}/ubuntu"
)

if [ -n "$(ls -A "${root}/binds" 2>/dev/null)" ]; then
  for f in "${root}/binds"/*; do
    . "$f"
  done
fi


command+=(
  -k "\\Linux\\$(hostname)\\$kernelversion\\$kernelrelease\\$(uname -m)\\localdomain\\-1\\"
  -b /dev
  -b /proc
  -b /sys
  -b "${root}/ubuntu:/dev/shm"
  -b /proc/self/fd/2:/dev/stderr
  -b /proc/self/fd/1:/dev/stdout
  -b /proc/self/fd/0:/dev/stdin
  -b /dev/urandom:/dev/random
  -b /proc/self/fd:/dev/fd
  -b "${root}/ubuntu/proc/fakethings/stat:/proc/stat"
  -b "${root}/ubuntu/proc/fakethings/vmstat:/proc/vmstat"
  -b "${root}/ubuntu/proc/fakethings/version:/proc/version"
  -b "${root}/ubuntu/proc/fakethings/loadavg:/proc/loadavg"
  # uncomment the following line to have access to the home directory of termux
  #-b /data/data/com.termux/files/home:/root/termux-home
  # uncomment the following line to the home sdcard
  #-b /sdcard:/root/sdcard
  -w /root
  /usr/bin/env -i
  MOZ_FAKE_NO_SANDBOX=1
  HOME=/root
  PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games
  TERM="$TERM"
  LANG=C.UTF-8
  /bin/bash --login
)

if [ -z "$1" ]; then
  exec "${command[@]}"
else
  exec "${command[@]}" -c "$@"
fi
EOF
fi

# chmod +x /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/root/.bash_profile
echo "127.0.0.1 localhost localhost" > /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/etc/hosts
echo "nameserver 1.1.1.1" > /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/etc/resolv.conf
chmod +x /data/data/com.termux/files/home/termux-proot-script/ubuntu-cli/ubuntu/etc/resolv.conf
termux-fix-shebang /data/data/com.termux/files/usr/bin/ubuntu-cli
chmod +x /data/data/com.termux/files/usr/bin/ubuntu-cli
echo "Installation Complete!"
echo "You can now launch ubuntu-cli with the command ubuntu-cli from next time"
