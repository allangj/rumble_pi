# Base this image on rumblepi-image-minimal
include rumblepi-image-minimal.bb

SPLASH = "psplash-rumblepi"

IMAGE_FEATURES += "ssh-server-dropbear splash"
