//
//  Custom_Cells_AppAppDelegate.m
//  Custom Cells App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "Custom_Cells_AppAppDelegate.h"


@implementation Custom_Cells_AppAppDelegate

@synthesize window;
@synthesize tabBarController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    window.rootViewController = self.tabBarController;
    [window makeKeyAndVisible];
    
    return YES;
}



@end

