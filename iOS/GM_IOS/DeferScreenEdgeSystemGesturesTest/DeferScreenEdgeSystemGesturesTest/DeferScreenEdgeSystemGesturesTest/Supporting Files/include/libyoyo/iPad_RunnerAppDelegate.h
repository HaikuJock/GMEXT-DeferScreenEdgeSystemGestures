//
//  iPad_RunnerAppDelegate.h
//  iPad_Runner
//
//  Created by Russell Kay on 08/09/2010.
//  Copyright Rapid Quality Systems Ltd. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAGLView;
@class RunnerViewController;

extern NSMutableArray* g_Extensions;

@interface iPad_RunnerAppDelegate : NSObject <UIApplicationDelegate,
											  UIAlertViewDelegate,
											  UIImagePickerControllerDelegate>
{
@protected
    UIWindow *window;
    EAGLView *glView;
	RunnerViewController *runnerViewController;
   
@public
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;
@property (nonatomic, retain) IBOutlet RunnerViewController *runnerViewController;
@property (nonatomic, retain) NSMutableArray *capturedImages;

-(void) installChallengeHandler;
-(void) initAVAudioSession;

// UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window;

// Ads
-(bool) AdInterstitialAvailable;
-(bool) AdInterstitialDisplay;
-(int) AdDisplayWidth;
-(int) AdDisplayHeight;
-(void) AdMove:(int)x Y:(int)y Slot:(int)slot;

// Orientation
-(void) OnRotate:(UIInterfaceOrientation)neworient;

// Push Notifications
/*
-(void) setupPushNotifications;
-(void) clearLocalNotifications;
-(bool) getLocalNotification:(int)_index;
-(bool) cancelLocalNotification:(int)_index;
-(void) setApplicationBadgeNumber:(long)_badgeNumber;
-(long) getApplicationBadgeNumber;
-(void) sendLocalNotifcation:(double)_delay
				   withTitle:(NSString*)_title
				 withMessage:(NSString*)_message
					withData:(NSString*)_data;

					*/
@end

