TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DreamHackPreferences

DreamHackPreferences_FRAMEWORKS = UIKit
DreamHackPreferences_PRIVATE_FRAMEWORKS = Preferences
DreamHackPreferences_INSTALL_PATH = /Library/PreferenceBundles
DreamHackPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
