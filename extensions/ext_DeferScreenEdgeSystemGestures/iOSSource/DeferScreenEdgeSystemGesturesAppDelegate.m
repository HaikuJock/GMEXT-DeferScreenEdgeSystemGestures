//
//  DeferScreenEdgeSystemGestures.m
//

#import <Foundation/Foundation.h>
#import "DeferScreenEdgeSystemGesturesAppDelegate.h"
#import "NSObject+MHOverride.h"

@implementation DeferScreenEdgeSystemGesturesAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if([[self superclass] instancesRespondToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        BOOL result =  [super application:application didFinishLaunchingWithOptions:launchOptions];
        
        [self.window.rootViewController mh_overrideSelector:@selector(preferredScreenEdgesDeferringSystemGestures) withBlock:(__bridge void *)^(id _self)
         {
            return UIRectEdgeAll;
        }];
        
        [self.window.rootViewController mh_overrideSelector:@selector(prefersHomeIndicatorAutoHidden) withBlock:(__bridge void *)^(id _self)
         {
            return YES;
        }];
        
        return result;
    } else {
        return TRUE;
    }
}

@end
