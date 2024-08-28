# Extra instructions for features that are not configured through a file in the .config folder

## Enabling right- and middle-click on touchpad

1. Create file: /etc/X11/xorg.conf.d/90-touchpad.conf
2. Put this into the file:
'''
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "ScrollMethod" "twofinger"
EndSection
'''

- optionally can enable natural scrolling as per [docs](https://wiki.archlinux.org/title/Libinput#Via_Xorg_configuration_file)

## Sound issues

- install local/sof-firmware
- use pipewire:
'''
pacman -S local/gst-plugin-pipewire local/libpipewire local/libwireplumber local/pipewirelocal/pipewire-alsa local/pipewire-audio local/pipewire-jack local/pipewire-pulse local/wireplumber
'''

- instal alsa-utils and alsa-tools
- fucking with alsamixer a bit and it gets fixed somehow (?)
