DESCRIPTION = "RaspberryPi window manager Packagegroup"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit packagegroup

# Several items where removed using morty (leafpad, sato-icon-theme...)
# Need to review if it is better to move to other packages for our window manager
RDEPENDS_${PN} = "\
    x11-common \
    xauth \
    xcursor-transparent-theme \
    xf86-input-evdev \
    xf86-input-keyboard \
    xf86-input-mouse \
    xf86-video-fbdev \
    xhost \
    xinit \
    xinput \
    xinput-calibrator \
    xkbcomp \
    xkeyboard-config \
    xkeyboard-config-locale-en-gb \
    xmodmap \
    xrandr \
    xserver-nodm-init \
    xserver-xf86-config \
    xserver-xorg \
    xset \
    xtscal \
    disable-x11-blanking \
    formfactor \
    pcmanfm \
    pcmanfm-locale-en-gb \
    shutdown-desktop \
    x11vnc \
    openbox \
    matchbox-config-gtk \
    matchbox-desktop \
    matchbox-keyboard \
    matchbox-keyboard-applet \
    matchbox-panel-2 \
    matchbox-session \
    matchbox-terminal \
    matchbox-wm \
    settings-daemon \
 "
