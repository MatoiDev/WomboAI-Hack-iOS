export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.6
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk

INSTALL_TARGET_PROCESSES = Maple
TWEAK_NAME = DreamHack

DreamHack_FILES = WomboAIDreamHack.xm
DreamHack_CFLAGS = -fobjc-arc
DreamHack_FRAMEWORKS = UIKit

SUBPROJECTS += dreamhackpreferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

