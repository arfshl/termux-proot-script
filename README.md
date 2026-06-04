## Forked from AndronixApp/AndronixOrigin

## Support for android 5/6 without proot-distro, based on andronixapp/andronixorigin

## You Need
- [Termux App](https://github.com/termux/termux-app/releases)
- [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

Supported Desktop Environment:
- XFCE, MATE, LXQt, LXDE (stable and worked well)

| Distribution     | Flavor/Desktop Environment | Supported CPU Arch | Docker Registry |
|------------------|----------------------------|----------------|-----------------|
| [Debian Stable](https://github.com/arfshl/pd-21/tree/main/debian) (Recommended for beginners) | CLI XFCE LXQt MATE LXDE | `arm` `aarch64` `x86_64` | `debian:stable` |
| [Ubuntu LTS](https://github.com/arfshl/pd-21/tree/main/ubuntu-lts) (Recommended for beginners) | CLI XFCE LXQt MATE LXDE | `arm` `aarch64` `x86_64` | `ubuntu:latest` |

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
