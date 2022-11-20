#############################################################################
#
# gpsp
#
#############################################################################

GPSP_VERSION = a58d2951e6f28ad6be2750dc851ecedeefc8da9e
GPSP_SITE = https://github.com/andymcca/gpsp-retroleap.git
GPSP_SITE_METHOD = git
GPSP_LICENSE = GPLv3
GPSP_LICENSE_FILES = COPYING
GPSP_DEPENDENCIES = sdl sdl_image sdl_ttf
GPSP_INSTALL_STAGING = NO
GPSP_GIT_SUBMODULES = YES


define GPSP_BUILD_CMDS
        CFLAGS="$(TARGET_CFLAGS) -I/home/lubuntu/newbuilds/retroleap/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/SDL -I/home/lubuntu/newbuilds/retroleap/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/bin" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" ARCH=arm POLLUX=1 WIZ=1 -C $(@D) -f gp2x/Makefile all
endef

define GPSP_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/gpsp $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
