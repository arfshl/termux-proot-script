# OpenSUSE Tumbleweed 

## CLI
- distro aliases: opensuse-tumbleweed-cli

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse-tumbleweed/cli.sh | bash
```

## XFCE
- distro aliases: opensuse-tumbleweed-xfce
- Username: opensuse-tumbleweed-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse-tumbleweed/xfce.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in  firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip atril ristretto galculator xarchiver mousepad 
```

## LXQt
- distro aliases: opensuse-tumbleweed-lxqt
- Username: opensuse-tumbleweed-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse-tumbleweed/lxqt.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip lximage-qt kcalc lxqt-archiver qpdfview featherpad
```

## MATE
- distro aliases: opensuse-tumbleweed-mate
- Username: opensuse-tumbleweed-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse-tumbleweed/mate.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip atril eom mate-calc engrampa pluma
```

## LXDE
- distro aliases: opensuse-tumbleweed-lxde
- Username: opensuse-tumbleweed-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse-tumbleweed/lxde.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip atril gpicview galculator xarchiver mousepad 
```

## Installing Chromium
```sh
sudo su && curl -fsSL https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/opensuse-tumbleweed/chromium-install.sh | bash
```