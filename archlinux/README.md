# Arch Linux 

## CLI
- distro aliases: archlinux-cli

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/archlinux/cli.sh | bash
```

## XFCE
- distro aliases: archlinux-xfce
- Username: archlinux-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/archlinux/xfce.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo pacman -Sy --needed  firefox  vlc thunderbird  libheif webp-pixbuf-loader p7zip atril ristretto galculator xarchiver mousepad 
```

## LXQt
- distro aliases: archlinux-lxqt
- Username: archlinux-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/archlinux/lxqt.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo pacman -Sy --needed firefox  vlc thunderbird  libheif webp-pixbuf-loader p7zip lximage-qt kcalc lxqt-archiver qpdfview featherpad
```

## MATE
- distro aliases: archlinux-mate
- Username: archlinux-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/archlinux/mate.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo pacman -Sy --needed firefox  vlc thunderbird  libheif webp-pixbuf-loader p7zip atril eom mate-calc engrampa pluma
```

## LXDE
- distro aliases: archlinux-lxde
- Username: archlinux-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/archlinux/lxde.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo pacman -Sy --needed firefox  vlc thunderbird  libheif webp-pixbuf-loader p7zip atril gpicview galculator xarchiver mousepad 
```

## Installing Chromium
```sh
sudo su && curl -fsSL https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/archlinux/chromium-install.sh | bash
```