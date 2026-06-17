# OpenSUSE Leap

## CLI
- distro aliases: opensuse-cli

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse/cli.sh | bash
```

## XFCE
- distro aliases: opensuse-xfce
- Username: opensuse-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse/xfce.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in  firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip atril ristretto galculator xarchiver mousepad 
```

## LXQt
- distro aliases: opensuse-lxqt
- Username: opensuse-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse/lxqt.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip lximage-qt kcalc lxqt-archiver qpdfview featherpad
```

## MATE
- distro aliases: opensuse-mate
- Username: opensuse-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse/mate.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip atril eom mate-calc engrampa pluma
```

## LXDE
- distro aliases: opensuse-lxde
- Username: opensuse-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/opensuse/lxde.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo zypper  in firefox  vlc thunderbird  libheif1 webp-pixbuf-loader p7zip atril gpicview galculator xarchiver mousepad 
```

## Installing Chromium
```sh
sudo su && curl -fsSL https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/opensuse/chromium-install.sh | bash
```