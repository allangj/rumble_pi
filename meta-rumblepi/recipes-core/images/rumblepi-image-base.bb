# Base this image on rumblepi-image-minimal
include rumblepi-image-minimal.bb

SPLASH = "psplash-rumblepi"

IMAGE_FEATURES += " \
    ssh-server-dropbear \
    splash \
 "

IMAGE_INSTALL += " \
    packagegroup-rpi-special \
    packagegroup-rpi-window \
 "

LICENSE_FLAGS_WHITELIST = "commercial"
