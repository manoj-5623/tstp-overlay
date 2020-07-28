# timesys-test-project.bbappend.tmpl: template overlay recipe for TSTP
# See meta-timesys-test/README.md for instructions to use this overlay.

DESCRIPTION = "TSTP Overlay for Custom BSP"

# If a project has a mirrored copy of the repo, its URI must be set here.
#SRC_URI = " \
#	git://git@src.timesys.com/services/customer/project/timesys-test-project.git;protocol=ssh;branch=${SRCBRANCH};name=tstp \
#	"

# This example disables an i.MX-only test and excludes the 1M backing_file
TSTP_DISABLED_TESTS = " \
	test_adc \
	backing_file \
	"
######
# Package Configuration

# The TSTP Yocto recipe supports numerous package configuration options:
#
#  fb - generic framebuffer tests
#  gstreamer - GStreamer tests
#  i2c - I2C tests
#  mtd - flash memory tests
#  can - CAN bus tests
#  iperf - iperf3 network performance tests
#  qt - Qt tests
#  usb - USB tests
#  usbgadget - USB gadget tests
#  vivante - Vivante graphics test

# Some features will be autodetected via DISTRO_FEATURES, but they also
# can be enabled manually:
#
#  alsa - audio/alsa tests
#  bluetooth - Bluetooth tests
#  wayland - Weston framebuffer tests
#  x11 - X11 framebuffer tests
#  wifi - WiFi tests

#PACKAGECONFIG_append = ""

######
# Yocto meta layer overlay

# An overlay directory contains custom configuration and test files
FILESEXTRAPATHS_prepend := "${THISDIR}/overlay:"
SRC_URI_append = " file://conf;subdir=${S}"
SRC_URI_append = " file://target;subdir=${S}"

######
# Out-of-tree tests

# Add URIs for test overlays
#SRC_URI_append = " \
#	git://git@src.timesys.com/path/to/your/tstp-overlay.git;protocol=ssh;name=overlay;destsuffix=tstp-overlay \
#	"
# If you use out-of-tree repository for tests, adjust SRCREV_FORMAT to
# contain an '_'-delimited list of all 'name' attributes of the SRC_URIs.
#SRCREV_FORMAT = "tstp_overlay"

# Overlays listed in TSTP_OVERLAYS will be merged (in order)
#TSTP_OVERLAYS += "tstp-overlay"
