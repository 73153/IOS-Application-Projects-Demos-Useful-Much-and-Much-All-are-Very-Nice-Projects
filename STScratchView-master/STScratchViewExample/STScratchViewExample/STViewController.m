//
//  STViewController.m
//  STScratchViewExample
//
//  Created by Sebastien Thiebaud on 12/17/12.
//  Copyright (c) 2012 Sebastien Thiebaud. All rights reserved.
//

#import "STViewController.h"
#import "STScratchView.h"

@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up the STScratchView
    [_scratchView setSizeBrush:20.0];

    // Create a (child) UIView
    UIImageView *ball = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 118.0, 111.0)];
    [ball setImage:[UIImage imageNamed:@"ball.png"]];
    
    // Define the hide view
    [_scratchView setHideView:ball];    

    // Edit randomly the UILabel
    [_dollarsAmount setText:[NSString stringWithFormat:@"$ %d", arc4random() % 100]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
//    If you want to active an automatic scratch
//    [self automaticScratch];
}

- (void)automaticScratch
{
    UIBezierPath *customPath = [UIBezierPath bezierPath];
    [customPath moveToPoint:CGPointMake(0,0)];
    [customPath addLineToPoint:CGPointMake(100,20)];
    [customPath addLineToPoint:CGPointMake(0,30)];
    [customPath addLineToPoint:CGPointMake(90,55)];
    [customPath addLineToPoint:CGPointMake(10,65)];
    [customPath addLineToPoint:CGPointMake(90,80)];
    
    [_scratchView setAutomaticScratchCurve:customPath duration:1.0];
}

@end
