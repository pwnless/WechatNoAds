FINALPACKAGE=1

# INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_PACKAGE_SCHEME=rootless

ifeq ($(THEOS_PACKAGE_SCHEME), rootless)
TARGET = iphone:clang:latest:15.0
else
TARGET = iphone:clang:latest:12.0
endif


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeChatNoAds

WeChatNoAds_FILES = Tweak.x
WeChatNoAds_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
