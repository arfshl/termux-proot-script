#!/data/data/com.termux/files/usr/bin/bash
set -euo
# Update installed package but keep configuration
apt update
apt upgrade -y -o Dpkg::Options::="--force-confold"

# Install depedency
apt install x11-repo tur-repo
apt update
apt install curl wget nano proot-distro termux-x11 pulseaudio vulkan-loader-android mesa-zink virglrenderer-mesa-zink virglrenderer-android -y

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
    i386|386)
        ARCH="i386"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

mkdir -p /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian
cd /data/data/com.termux/files/home/termux-proot-script/debian-mate
curl -L https://github.com/arfshl/termux-proot-script/releases/download/debian/debian-$ARCH.tar.xz --output debian.tar.xz
proot --link2symlink tar -xJpf debian.tar.xz -C debian
rm debian.tar.xz
mkdir -p /data/data/com.termux/files/home/termux-proot-script/debian-mate/binds
mkdir -p /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings

# A function for preparing fake /proc entries for certain system data interfaces which known to be restricted on Android OS.
# Dedicated for: 1004200828
if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/version" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/version -o /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/version
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/stat" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/stat -o /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/stat
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/vmstat" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/vmstat -o /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/vmstat
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/loadavg" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/loadavg -o /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/loadavg
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/kernelversion" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/kernelversion -o /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/kernelversion
fi

if [ ! -f "/data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/kernelrelease" ]; then
curl -L https://raw.githubusercontent.com/arfshl/termux-proot-scripts/refs/heads/main/proc/fakethings/kernelrelease -o /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/kernelrelease
fi


if [ ! -f "/data/data/com.termux/files/usr/bin/debian-mate" ]; then
cat << "EOF" > /data/data/com.termux/files/usr/bin/debian-mate
#!/bin/bash
root="/data/data/com.termux/files/home/termux-proot-script/debian-mate"
kernelrelease="$(cat /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/kernelrelease)"
kernelversion="$(cat /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/proc/fakethings/kernelversion)"

unset LD_PRELOAD

command=(
  proot
  --kill-on-exit
  --link2symlink
  -0
  -r "${root}/debian"
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
  -b "${root}/debian:/dev/shm"
  -b /proc/self/fd/2:/dev/stderr
  -b /proc/self/fd/1:/dev/stdout
  -b /proc/self/fd/0:/dev/stdin
  -b /dev/urandom:/dev/random
  -b /proc/self/fd:/dev/fd
  -b "${root}/debian/proc/fakethings/stat:/proc/stat"
  -b "${root}/debian/proc/fakethings/vmstat:/proc/vmstat"
  -b "${root}/debian/proc/fakethings/version:/proc/version"
  -b "${root}/debian/proc/fakethings/loadavg:/proc/loadavg"
  -b $PREFIX/tmp:/tmp
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

# chmod +x /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/root/.bash_profile
echo "127.0.0.1 localhost localhost" > /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/etc/hosts
echo "nameserver 1.1.1.1" > /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/etc/resolv.conf
chmod +x /data/data/com.termux/files/home/termux-proot-script/debian-mate/debian/etc/resolv.conf
termux-fix-shebang /data/data/com.termux/files/usr/bin/debian-mate
chmod +x /data/data/com.termux/files/usr/bin/debian-mate

# setup desktop
debian-mate 'apt update && apt install wget -y'

debian-mate 'wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/mate/install.sh -O install.sh && chmod +x install.sh && ./install.sh'

# setup x11 script
cat <<'EOF' > /data/data/com.termux/files/usr/bin/debian-mate-x11-2
#!/usr/bin/env bash
LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
kill -9 $(pgrep -f "virgl") 2>/dev/null
debian-mate 'pkill -x -9 x11 2>/dev/null'
virgl_test_server_android &
termux-x11 :0 >/dev/null &
sleep 3
debian-mate 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - debian-mate -c "DISPLAY=:0 GALLIUM_DRIVER=virpipe dbus-launch --exit-with-session mate-session"'
EOF
chmod +x /data/data/com.termux/files/usr/bin/debian-mate-x11-2

echo 'To start command line session: debian-mate'
echo 'To start X11 session: debian-mate-x11-2'
echo 'To start VNC server: startvnc'
echo 'To stop VNC server: stopvnc'
echo 'To restart VNC server: restartvnc'
echo 'Default user: debian-mate'
echo 'Default password: 123'    
echo 'VNC server address: 127.0.0.1:5900'
echo 'Default VNC password: 1234567890'
echo "Installation Complete!"
