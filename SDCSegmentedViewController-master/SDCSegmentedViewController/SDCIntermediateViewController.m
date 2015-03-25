//
//  SDCIntermediateViewController.m
//  SDCSegmentedViewController
//
//  Created by Scott Berrevoets on 7/25/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import "SDCIntermediateViewController.h"
#import "SDCSegmentedViewController.h"

@interface SDCIntermediateViewController ()

@end

@implementation SDCIntermediateViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	SDCSegmentedViewController *segmentedViewController = segue.destinationViewController;
	segmentedViewController.position = SDCSegmentedViewControllerControlPositionNavigationBar;
	[segmentedViewController addStoryboardSegments:@[@"segment1", @"segment2"]];
}

@end
