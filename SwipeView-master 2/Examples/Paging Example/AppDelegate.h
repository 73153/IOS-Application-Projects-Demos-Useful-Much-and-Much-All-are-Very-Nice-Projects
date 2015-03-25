//
//  iCarouselExampleAppDelegate.h
//  iCarouselExample
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExampleViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet ExampleViewController *viewController;

@end
