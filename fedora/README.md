# Fedora
 
## CLI
- distro aliases: fedora-cli

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/fedora/cli.sh | bash
```

## XFCE
- distro aliases: fedora-xfce
- Username: fedora-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/fedora/xfce.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo dnf update && sudo dnf install firefox vlc thunderbird atril ristretto galculator libheif xarchiver webp-pixbuf-loader p7zip mousepad 
```

## LXQt
- distro aliases: fedora-lxqt
- Username: fedora-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/fedora/lxqt.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo dnf update && sudo dnf install firefox vlc thunderbird lximage-qt kcalc lxqt-archiver qpdf libheif webp-pixbuf-loader p7zip featherpad 
```

## MATE
- distro aliases: fedora-mate
- Username: fedora-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/fedora/mate.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo dnf update && sudo dnf install firefox vlc thunderbird engrampa atril eom mate-calc pluma libheif webp-pixbuf-loader p7zip 
```

## LXDE
- distro aliases: fedora-lxde
- Username: fedora-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/fedora/lxde.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo dnf update && sudo dnf install firefox vlc thunderbird xarchiver atril mousepad galculator gpicview libheif webp-pixbuf-loader p7zip 
```

## Installing Chromium
```sh
sudo su && curl -fsSL https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/fedora/chromium-install.sh | bash
```