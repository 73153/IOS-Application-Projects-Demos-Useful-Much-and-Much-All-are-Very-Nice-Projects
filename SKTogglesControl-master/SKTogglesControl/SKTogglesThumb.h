//
// SKTogglesThumb.h
// SKTogglesControl
//
//
// Adapted by Barry Allard on 2013-06-13
// Copyright 2013 Barry Allard. All rights reserved.
//
// https://github.com/steakknife/SKTogglesControl
//
//
// Originally Created by Sam Vermette on 26.10.10.
// Copyright 2010 Sam Vermette. All rights reserved.
//
// Original project https://github.com/samvermette/SKTogglesControl
//

#import <UIKit/UIKit.h>

@class SKTogglesControl;

@interface SKTogglesThumb : UIView
@property (nonatomic, readwrite, getter=isEnabled) BOOL enabled;   // default is YES
@property (nonatomic, readwrite, getter=isSelected) BOOL selected; // default is NO
@property (nonatomic, strong) UIImage *backgroundImage;            // default is nil
@property (nonatomic, strong) UIImage *highlightedBackgroundImage; // default is nil;

@property (nonatomic, strong) UIColor *tintColor;                  // default is [UIColor grayColor]
@property (nonatomic, strong) UIColor *textColor;                  // default is [UIColor whiteColor]
@property (nonatomic, strong) UIColor *textShadowColor;            // default is [UIColor blackColor]
@property (nonatomic, readwrite) CGSize textShadowOffset;          // default is CGSizeMake(0, -1)
@property (nonatomic, readwrite) BOOL shouldCastShadow;            // default is YES (NO when backgroundImage is set)
@property (nonatomic, assign) CGFloat gradientIntensity;           // default is 0.15

@end
