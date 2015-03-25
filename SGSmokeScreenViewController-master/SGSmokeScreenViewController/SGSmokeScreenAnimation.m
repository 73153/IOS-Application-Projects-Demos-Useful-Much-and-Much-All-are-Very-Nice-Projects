//
//  SGSmokeScreenAnimation.m
//  SGSmokeScreenView
//
//  Created by Justin Williams on 7/7/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import "SGSmokeScreenAnimation.h"

@interface SGSmokeScreenAnimation ()

@property (nonatomic, strong) SGSmokeScreenViewController *smokeScreenViewController;

@end

@implementation SGSmokeScreenAnimation

- (instancetype)initWithSmokeScreenView:(SGSmokeScreenViewController *)viewController
{
    if ((self = [super init]))
    {
        self.smokeScreenViewController = viewController;
    }
    return self;
}

@end
