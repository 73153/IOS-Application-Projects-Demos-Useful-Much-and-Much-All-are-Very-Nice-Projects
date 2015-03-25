//
//  Custom_Cells_AppAppDelegate.h
//  Custom Cells App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Custom_Cells_AppAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    UITabBarController *tabBarController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;


@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;


@end

