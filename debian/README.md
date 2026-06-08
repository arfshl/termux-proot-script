# Debian Stable

## CLI
- distro aliases: debian-cli

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/debian/cli.sh | bash
```

## XFCE
- distro aliases: debian-xfce
- Username: debian-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/debian/xfce.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird atril ristretto galculator libheif1 xarchiver webp-pixbuf-loader fonts-liberation p7zip mousepad && apt clean
```

## LXQt
- distro aliases: debian-lxqt
- Username: debian-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/debian/lxqt.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird lximage-qt kcalc lxqt-archiver qpdfview libheif1 webp-pixbuf-loader fonts-liberation p7zip featherpad && apt clean
```

## MATE
- distro aliases: debian-mate
- Username: debian-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/debian/mate.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird engrampa atril eom mate-calc pluma libheif1 webp-pixbuf-loader fonts-liberation p7zip && apt clean
```

## LXDE
- distro aliases: debian-lxde
- Username: debian-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/debian/lxde.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird xarchiver atril mousepad galculator gpicview libheif1 webp-pixbuf-loader fonts-liberation p7zip && apt clean
```

## Installing Chromium
```sh
sudo su && curl -fsSL https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/chromium-install.sh | bash
```

## Disable apt Pager at Debian 13 or Ubuntu 26.04
```sh
echo 'Binary::apt::Pager "false";' | sudo tee -a /etc/apt/apt.conf.d/99nopager
```