//LaunchNotifier by Fr0st
//Rewritten to use the iPhone's native voice
//It's also fancier! :)

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static NSString* appName = nil;

static NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gmoran.launchspeak.plist"];

static id someID = nil;

static NSString* userStr = [dict objectForKey:@"LSSpeech"];



@interface SBApplicationIcon : NSObject { }
-(id)displayName;
-(id)leafIdentifier;
@end

@interface SBUIController : NSObject {}
-(void)activateApplicationAnimated:(id)animated;
-(void)activateApplicationFromSwitcher:(id)switcher;
//-(void)dismissSwitcherAnimated:(BOOL)animated; I don't think we need this.
@end

%hook SBUIController

-(void)activateApplicationAnimated:(id)animated {
    
    if ([[dict objectForKey:@"LSToggle"] boolValue]) {
    
        someID = animated;

        NSObject *speaker = [[NSClassFromString(@"VSSpeechSynthesizer") alloc] init]; 
    
        SBApplicationIcon *appIcon = [[%c(SBApplicationIcon) alloc] initWithApplication:animated];
    
        appName = [appIcon displayName];
    
        NSString* appLaunchStr = [userStr stringByReplacingOccurrencesOfString:@"<App_Name>" withString:appName];
    
        [speaker startSpeakingString:appLaunchStr];

        %orig;
    }
    else {
        %orig;
    }
}

-(void)activateApplicationFromSwitcher:(id)switcher {
    
    if ([[dict objectForKey:@"LSToggle"] boolValue]) {
    
        someID = switcher;
    
        NSObject *speaker = [[NSClassFromString(@"VSSpeechSynthesizer") alloc] init]; 
    
        SBApplicationIcon *appIcon = [[%c(SBApplicationIcon) alloc] initWithApplication:switcher];
    
        appName = [appIcon displayName];
    
        NSString* appLaunchStr = [userStr stringByReplacingOccurrencesOfString:@"<App_Name>" withString:appName];
    
        [speaker startSpeakingString:appLaunchStr];
    
        %orig;
    }
    else {
        %orig;
    }
}

%end
