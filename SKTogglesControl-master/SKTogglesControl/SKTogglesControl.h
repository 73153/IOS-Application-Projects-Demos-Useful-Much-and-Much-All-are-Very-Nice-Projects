//
// SKTogglesControl.h
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
#import "SKTogglesThumb.h"
#import <AvailabilityMacros.h>

@protocol SKTogglesControlDelegate;

@interface SKTogglesControl : UIControl

@property (nonatomic, copy) void (^changeHandler)(__weak SKTogglesControl *weakSelf, NSUInteger newIndex, BOOL newState); // you can also use addTarget:action:forControlEvents:
@property (nonatomic, copy) NSArray *sectionTitles;
@property (nonatomic, copy) NSArray *sectionImages;

@property (nonatomic, strong, readonly) SKTogglesThumb *thumbPrototype;
@property (nonatomic, strong, readonly) NSMutableArray *thumbs;
@property (nonatomic, readwrite) BOOL animateToInitialSelection; // default is NO

@property (nonatomic, readwrite) UIEdgeInsets touchTargetMargins; // default is UIEdgeInsetsMake(0, 0, 0, 0) - Enlarge touch target of control

@property (nonatomic, strong) UIColor *backgroundTintColor; // default is [UIColor colorWithWhite:0.1 alpha:1]
@property (nonatomic, strong) UIImage *backgroundImage; // default is nil

@property (nonatomic, readwrite) CGFloat height; // default is 32.0
@property (nonatomic, readwrite) UIEdgeInsets thumbEdgeInset; // default is UIEdgeInsetsMake(2, 2, 3, 2)
@property (nonatomic, readwrite) UIEdgeInsets titleEdgeInsets; // default is UIEdgeInsetsMake(0, 10, 0, 10)
@property (nonatomic, readwrite) CGFloat cornerRadius; // default is 4.0

@property (nonatomic, strong) UIFont *font; // default is [UIFont boldSystemFontOfSize:15]
@property (nonatomic, strong) UIColor *textColor; // default is [UIColor grayColor];
@property (nonatomic, strong) UIColor *textShadowColor;  // default is [UIColor blackColor]
@property (nonatomic, readwrite) CGSize textShadowOffset;  // default is CGSizeMake(0, -1)
@property (nonatomic, strong) UIColor *innerShadowColor; // default is [UIColor colorWithWhite:0 alpha:0.8]
@property (nonatomic, readwrite) BOOL animated;

@property (nonatomic, readonly) BOOL newState;
@property (nonatomic, readonly) NSUInteger newIndex;

- (SKTogglesControl*)initWithSectionTitles:(NSArray*)titlesArray;

- (void)setAllFromArray:(NSArray *)array;
- (void)setAllFromArray:(NSArray *)array animated:(BOOL)animated;
- (void)getAllToArray:(NSMutableArray *)array;

- (BOOL)isSetIndex:(NSUInteger)index;
- (void)toggleIndex:(NSUInteger)index;
- (void)toggleIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)setIndex:(NSUInteger)index;
- (void)setIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)unsetIndex:(NSUInteger)index;
- (void)unsetIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)setIndex:(NSUInteger)index withValue:(BOOL)state;
- (void)setIndex:(NSUInteger)index withValue:(BOOL)state animated:(BOOL)animated;


- (BOOL)isEnabledIndex:(NSUInteger)index;
- (void)enableIndex:(NSUInteger)index;
- (void)disableIndex:(NSUInteger)index;
- (void)setEnabledIndex:(NSUInteger)index withValue:(BOOL)state;

@end


@protocol SKTogglesControlDelegate

- (void)segmentedControl:(SKTogglesControl*)segmentedControl didChangeIndex:(NSUInteger)index toState:(BOOL)state;

@end
