#import <Preferences/Preferences.h>

@interface LSSettingsListController: PSListController {
}
@end

@implementation LSSettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LSSettings" target:self] retain];
	}
	return _specifiers;
}

-(void)restartSB:(id)param {
    system("killall -9 SpringBoard");
}
@end

// vim:ft=objc
