//
//  ViewController.m
//  SKTogglesControl
//
//  Created by Sam Vermette on 24.05.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// 1st CONTROL
	
	SKTogglesControl *navSC = [[SKTogglesControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
    navSC.changeHandler = ^(__weak SKTogglesControl *weakSelf, NSUInteger newIndex, BOOL newState) {
        NSLog(@"segmentedControl did select index %i (via block handler), %i", newIndex, newState);
    };
    
	[self.view addSubview:navSC];
	
	navSC.center = CGPointMake(160, 70);
	
	
	// 2nd CONTROL
	SKTogglesControl *redSC = [SKTogglesControl alloc];
    redSC.thumbPrototype.tintColor = [UIColor colorWithRed:0.6 green:0.2 blue:0.2 alpha:1];
    redSC = [redSC initWithSectionTitles:[NSArray arrayWithObjects:@"About", @"Help", @"Credits", nil]];
    
    [redSC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
	
    [redSC setIndex:1 animated:NO];
	
	[self.view addSubview:redSC];
	
	redSC.center = CGPointMake(160, 170);
	
	
	// 3rd CONTROL
	SKTogglesControl *grayRC = [SKTogglesControl alloc];
    grayRC.thumbPrototype.tintColor = [UIColor colorWithRed:0 green:0.5 blue:0.1 alpha:1];
    grayRC = [grayRC initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
    [grayRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    grayRC.font = [UIFont boldSystemFontOfSize:19];
	grayRC.height = 46;
	grayRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
    [grayRC setIndex:0 animated:NO];
	
	[self.view addSubview:grayRC];
	
	grayRC.center = CGPointMake(160, 270);
	
	
	// 4th CONTROL
	SKTogglesControl *yellowRC = [SKTogglesControl alloc];
	yellowRC.thumbPrototype.tintColor = [UIColor colorWithRed:0.999 green:0.889 blue:0.312 alpha:1.000];
	yellowRC.thumbPrototype.textColor = [UIColor blackColor];
	yellowRC.thumbPrototype.textShadowColor = [UIColor colorWithWhite:1 alpha:0.5];
	yellowRC.thumbPrototype.textShadowOffset = CGSizeMake(0, 1);
    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    yellowRC = [yellowRC initWithSectionTitles:[NSArray arrayWithObjects:@"One", @"Two", @"Three", nil]];
    yellowRC.font = [UIFont fontWithName:@"Marker Felt" size:20];
	yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
	yellowRC.height = 40;
	//yellowRC.crossFadeLabelsOnDrag = YES;
    [yellowRC setIndex:2 animated:NO];
	
	[self.view addSubview:yellowRC];
	
	yellowRC.center = CGPointMake(160, 370);
}


#pragma mark - UIControlEventValueChanged

- (void)segmentedControlChangedValue:(SKTogglesControl*)segmentedControl {
	NSLog(@"togglesControl %i index %i state %i (via UIControl method)", segmentedControl.tag, segmentedControl.newIndex, segmentedControl.newState);
}


@end
