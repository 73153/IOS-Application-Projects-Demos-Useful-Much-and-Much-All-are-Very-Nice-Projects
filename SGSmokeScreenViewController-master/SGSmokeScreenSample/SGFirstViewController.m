//
//  SGFirstViewController.m
//  SGSmokeScreenSample
//
//  Created by Justin Williams on 7/12/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import "SGFirstViewController.h"
#import "SGSecondViewController.h"
#import "SGSmokeScreenAnimation.h"
#import "UIView+Screenshots.h"
#import "SGSmokeScreenViewController.h"


@interface SGFirstViewController ()
@property (nonatomic, strong) UIButton *transitionButton;
@end

@implementation SGFirstViewController

- (instancetype)init
{
    
    if (self = [super initWithNibName:nil bundle:nil])
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"First", @"");
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.transitionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.transitionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.transitionButton setTitle:@"Moo" forState:UIControlStateNormal];
    [self.transitionButton addTarget:self action:@selector(transition:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.transitionButton];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.transitionButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.transitionButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
}

- (void)transition:(id)sender
{
    SGSecondViewController *secondViewController = [[SGSecondViewController alloc] init];
    
    SGSmokeScreenViewController *smokeScreenViewController = [[SGSmokeScreenViewController alloc] initWithStartingViewController:self destinationViewController:secondViewController];
    
    UIImageView *screenshot = [UIView screenshotForScreen];
    
    // Scale back the view.
    SGSmokeScreenAnimation *animation1 = [[SGSmokeScreenAnimation alloc] initWithSmokeScreenView:smokeScreenViewController];
    animation1.duration = 0.2f;
    animation1.delay = 0.0f;
    animation1.options = UIViewAnimationOptionCurveLinear;
    animation1.animations =  ^(SGSmokeScreenViewController *smokeScreen){
        [smokeScreenViewController.view addSubview:screenshot];
        
        screenshot.transform = CGAffineTransformMakeScale(0.9, 0.9);
    };
    
    // Convert it to blue
    UIView *blueView = [[UIView alloc] initWithFrame:screenshot.bounds];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.alpha = 0.0f;
    blueView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [smokeScreenViewController.view insertSubview:blueView aboveSubview:screenshot];
    
    
    SGSmokeScreenAnimation *animation2 = [[SGSmokeScreenAnimation alloc] initWithSmokeScreenView:smokeScreenViewController];
    animation2.duration = 0.2f;
    animation2.delay = 0.0f;
    animation2.options = UIViewAnimationOptionCurveLinear;
    animation2.animations =  ^(SGSmokeScreenViewController *smokeScreen) {
        screenshot.alpha = 0.0f;
        blueView.alpha = 1.0f;
        
        blueView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    };
    
    
    // Zoom it back in.
    
    smokeScreenViewController.animations = @[animation1, animation2];
    
    [smokeScreenViewController performTransition];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
