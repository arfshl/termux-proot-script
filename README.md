## Forked from AndronixApp/AndronixOrigin

## Support for Android 5/6 without proot-distro, based on andronixapp/andronixorigin

## Only Debian 11 and Ubuntu 24.04 LTS is supported since they're last version known to be worked with Android 5/6 without critical errors

## You Need
- [Termux App](https://github.com/termux/termux-app/releases)
- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

Supported Desktop Environment:
- XFCE, MATE, LXQt, LXDE (stable and worked well)

## Repo fix (important)
termux21 scientific and games repo GPG signature is expired and will interfere with apt package manager, we recommends to remove it instead with this command:

    rm $PREFIX/etc/apt/sources.list.d/*

| Distribution     | Flavor/Desktop Environment | Supported CPU Arch | Docker Registry |
|------------------|----------------------------|----------------|-----------------|
| [Debian 11 Bullseye](https://github.com/arfshl/pd-21/tree/main/debian) (Recommended for beginners) | CLI XFCE LXQt MATE LXDE | `arm` `aarch64` `x86_64` | `debian:stable` |
| [Ubuntu 20.04 LTS Focal Fossa](https://github.com/arfshl/pd-21/tree/main/ubuntu-lts) (Recommended for beginners) | CLI XFCE LXQt MATE LXDE | `arm` `aarch64` `x86_64` | `ubuntu:latest` |

## Uninstalling
```
- Rootfs-only uninstall
#!/bin/sh
cd ~/pd-21 && chmod -R 777 [distro aliases] && rm -rf [distro aliases]

rm -f /data/data/com.termux/files/usr/bin/[distro aliases]


- Full Uninstall, including in-termux dependency
#!/bin/sh
cd ~/pd-21 && chmod -R 777 [distro aliases] && rm -rf [distro aliases]

rm -f /data/data/com.termux/files/usr/bin/[distro aliases]

apt remove proot pulseaudio -y && apt autoremove -y

Replace [distro aliases] with distro alias you're using, available on installation page
```

# Credits

[andronixapp/andronixorigin](https://github.com/AndronixApp/AndronixOrigin) Inspiration for making this project, VNC startup mechanism, Licensed under MIT License.

[linuxmasterdroid/termux-desktops](https://github.com/LinuxDroidMaster/Termux-Desktops) Pulseaudio startup mechanism, Licensed under GPLv3.

[Termux PRoot Distro v4](https://github.com/termux/proot-distro/tree/98b6d71aaf74b4fe2fc545cab32a7ecc879ad8e9) rootfs build workflows, Licensed under GPLv3.

Pulseaudio fix for One UI, [Issue #19623 on termux-packages](https://github.com/termux/termux-packages/issues/19623)
