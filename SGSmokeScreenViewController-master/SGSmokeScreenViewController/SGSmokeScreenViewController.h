//
//  SGSmokeScreenViewController.h
//  SGSmokeScreenView
//
//  Created by Justin Williams on 7/7/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGSmokeScreenViewController : UIViewController

@property (nonatomic, strong, readonly) UIViewController *startingViewController;
@property (nonatomic, strong, readonly) UIViewController *destinationViewController;

@property (nonatomic, copy) void (^completionBlock)();

// The animations array is expecting an array of `SGSmokeScreenAnimation` objects.
// If it doesn't receive them, we bring back the linen texture.
@property (nonatomic, strong) NSArray *animations;

- (instancetype)initWithStartingViewController:(UIViewController *)startingViewController destinationViewController:(UIViewController *)destinationViewController;

- (void)performTransition;
- (void)unwindTransition;

@end
