//
//  UIView+Screenshots.h
//  ZoomingTest
//
//  Created by Justin Williams on 7/2/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshots)

+ (UIImageView *)screenshotForScreen;
+ (UIImageView *)screenshotForView:(UIView *)view;

@end
