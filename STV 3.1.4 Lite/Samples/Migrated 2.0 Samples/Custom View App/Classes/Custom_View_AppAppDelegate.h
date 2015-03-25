//
//  Custom_View_AppAppDelegate.h
//  Custom View App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom_View_AppAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

