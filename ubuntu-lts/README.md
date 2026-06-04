# Ubuntu LTS

## CLI
- distro aliases: ubuntu-lts-cli


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/pd-21/refs/heads/main/ubuntu-lts/cli.sh && sh cli.sh

## XFCE
- distro aliases: ubuntu-lts-xfce
- Username: ubuntu-lts-xfce
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/pd-21/refs/heads/main/ubuntu-lts/xfce.sh && sh xfce.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird atril ristretto galculator libheif1 xarchiver webp-pixbuf-loader fonts-liberation p7zip mousepad && apt clean

## LXQt
- distro aliases: ubuntu-lts-lxqt
- Username: ubuntu-lts-lxqt
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/pd-21/refs/heads/main/ubuntu-lts/lxqt.sh && sh lxqt.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird lximage-qt kcalc lxqt-archiver qpdfview libheif1 webp-pixbuf-loader fonts-liberation p7zip featherpad && apt clean

## MATE
- distro aliases: ubuntu-lts-mate
- Username: ubuntu-lts-mate
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/pd-21/refs/heads/main/ubuntu-lts/mate/bootstrap.sh && sh bootstrap.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird engrampa atril eom mate-calc pluma libheif1 webp-pixbuf-loader fonts-liberation p7zip && apt clean

    
## LXDE 
- distro aliases: ubuntu-lts-lxde
- Username: ubuntu-lts-lxde
- `sudo` Password: 123
- VNC Server Address: 127.0.0.1:5900
- VNC Server Password: 1234567890


#### Install
    apt update && apt install wget -y && wget https://raw.githubusercontent.com/arfshl/pd-21/refs/heads/main/ubuntu-lts/lxde.sh && sh lxde.sh

#### Install Web Browser, Media Player, Utility (Execute on rootfs)
    sudo apt update && sudo apt install firefox vlc thunderbird xarchiver atril mousepad galculator gpicview libheif1 webp-pixbuf-loader fonts-liberation p7zip && apt clean


## Installing Chromium
    sudo su && wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/ubuntu/chromium-install.sh && sh chromium-install.sh && rm chromium-install.sh

## Disable apt Pager at Debian 13 or ubuntu-lts 26.04

      echo 'Binary::apt::Pager "false";' | sudo tee -a  /etc/apt/apt.conf.d/99nopager
