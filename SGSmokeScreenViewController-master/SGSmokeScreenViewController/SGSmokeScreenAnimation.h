//
//  SGSmokeScreenAnimation.h
//  SGSmokeScreenView
//
//  Created by Justin Williams on 7/7/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SGSmokeScreenViewController.h"

typedef void (^SGSmokeScreenAnimationsBlock)(SGSmokeScreenViewController *smokeScreen);

@interface SGSmokeScreenAnimation : NSObject

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, assign) UIViewAnimationOptions options;
@property (nonatomic, copy) SGSmokeScreenAnimationsBlock setupBlock;
@property (nonatomic, copy) SGSmokeScreenAnimationsBlock animations;

- (instancetype)initWithSmokeScreenView:(SGSmokeScreenViewController *)viewController;

@end
