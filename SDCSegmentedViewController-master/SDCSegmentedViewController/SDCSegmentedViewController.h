//
//  SDCSegmentedViewController.h
//  SDCSegmentedViewController
//
//  Created by Scott Berrevoets on 3/15/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#endif

typedef NS_ENUM(NSInteger, SDCSegmentedViewControllerControlPosition) {
	SDCSegmentedViewControllerControlPositionNavigationBar,
	SDCSegmentedViewControllerControlPositionToolbar
};

@interface SDCSegmentedViewController : UIViewController

@property (nonatomic, readonly, strong) UISegmentedControl *segmentedControl;
@property (nonatomic) SDCSegmentedViewControllerControlPosition position;

// NSArray of UIViewController subclasses
- (instancetype)initWithViewControllers:(NSArray *)viewControllers;

// Takes segmented control item titles separately from the view controllers
- (instancetype)initWithViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles;

// Add a new view controller as the last segment
- (void)addViewController:(UIViewController *)viewController;
- (void)addViewController:(UIViewController *)viewController withTitle:(NSString *)title;

// Add segments from storyboard. The strings in the array should match segue identifiers in the storyboard.
- (void)addStoryboardSegments:(NSArray *)segments;

@end
