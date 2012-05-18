GO_EASY_ON_ME = 1
include theos/makefiles/common.mk

TWEAK_NAME = LaunchSpeak
LaunchSpeak_FILES = Tweak.xm
LaunchSpeak_FRAMEWORKS = Foundation
SUBPROJECTS = launchnotifiersettings

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
