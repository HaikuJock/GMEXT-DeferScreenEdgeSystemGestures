//
//  DeferScreenEdgeSystemGestures.m
//

#import <Foundation/Foundation.h>
#import "DeferScreenEdgeSystemGesturesAppDelegate.h"
#import "NSObject+MHOverride.h"

@implementation DeferScreenEdgeSystemGesturesAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"HERE willFinishLaunchingWithOptions");
    // Check if any superclasses implement this method and call it
    if([[self superclass] instancesRespondToSelector:@selector(application:willFinishLaunchingWithOptions:)])
        return [super application:application willFinishLaunchingWithOptions:launchOptions];
    else
        return TRUE;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"HERE didFinishLaunchingWithOptions");

    if([[self superclass] instancesRespondToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        BOOL result =  [super application:application didFinishLaunchingWithOptions:launchOptions];
        
        [self.window.rootViewController mh_overrideSelector:@selector(preferredScreenEdgesDeferringSystemGestures) withBlock:(__bridge void *)^(id _self)
         {
            NSLog(@"UIRectEdgeAll");
            return UIRectEdgeAll;
        }];
        
        [self.window.rootViewController mh_overrideSelector:@selector(prefersHomeIndicatorAutoHidden) withBlock:(__bridge void *)^(id _self)
         {
            NSLog(@"prefersHomeIndicatorAutoHidden YES");
            return YES;
        }];
        
        return result;
    } else {
        return TRUE;
    }
}

@end
