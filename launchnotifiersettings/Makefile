include theos/makefiles/common.mk

BUNDLE_NAME = LSSettings
LSSettings_FILES = LaunchSpeakSettings.mm
LSSettings_INSTALL_PATH = /Library/PreferenceBundles
LSSettings_FRAMEWORKS = UIKit
LSSettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LSSettings.plist$(ECHO_END)
