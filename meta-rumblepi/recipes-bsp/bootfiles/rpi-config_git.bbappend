# Append values to config.txt in order to work with adafruit USB touchscreen

do_deploy_append() {
    echo "hdmi_force_hotplug=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "hdmi_group=2" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "hdmi_mode=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "hdmi_mode=87" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "hdmi_cvt 800 480 60 6 0 0 0" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "max_usb_current=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "start_x=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "gpu_mem=128" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
