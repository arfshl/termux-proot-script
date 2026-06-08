# Ubuntu Regular Release

## CLI
- distro aliases: ubuntu-cli

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/ubuntu/cli.sh | bash
```

## XFCE
- distro aliases: ubuntu-xfce
- Username: ubuntu-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/ubuntu/xfce.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird atril ristretto galculator libheif1 xarchiver webp-pixbuf-loader fonts-liberation p7zip mousepad && apt clean
```

## LXQt
- distro aliases: ubuntu-lxqt
- Username: ubuntu-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/ubuntu/lxqt.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird lximage-qt kcalc lxqt-archiver qpdfview libheif1 webp-pixbuf-loader fonts-liberation p7zip featherpad && apt clean
```

## MATE
- distro aliases: ubuntu-mate
- Username: ubuntu-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/ubuntu/mate/bootstrap.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird engrampa atril eom mate-calc pluma libheif1 webp-pixbuf-loader fonts-liberation p7zip && apt clean
```

## LXDE
- distro aliases: ubuntu-lxde
- Username: ubuntu-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890

#### Install
```sh
curl -fsSL https://raw.githubusercontent.com/arfshl/termux-proot-script/refs/heads/main/ubuntu/lxde.sh | bash
```

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
```sh
sudo apt update && sudo apt install firefox vlc thunderbird xarchiver atril mousepad galculator gpicview libheif1 webp-pixbuf-loader fonts-liberation p7zip && apt clean
```

## Installing Chromium
```sh
sudo su && curl -fsSL https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/ubuntu/chromium-install.sh | bash
```

## Disable apt Pager at Debian 13 or Ubuntu 26.04
```sh
echo 'Binary::apt::Pager "false";' | sudo tee -a /etc/apt/apt.conf.d/99nopager
```