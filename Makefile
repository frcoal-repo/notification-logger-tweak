TARGET := iphone:clang:15.0:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_PACKAGE_SCHEME=rootless
export SYSROOT = $(THEOS)/sdks/iPhoneOS15.0.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = notification-test

notification-test_FILES = Tweak.x
notification-test_CFLAGS = -fobjc-arc
notification-test_PRIVATE_FRAMEWORK = BulletinBoard
include $(THEOS_MAKE_PATH)/tweak.mk
