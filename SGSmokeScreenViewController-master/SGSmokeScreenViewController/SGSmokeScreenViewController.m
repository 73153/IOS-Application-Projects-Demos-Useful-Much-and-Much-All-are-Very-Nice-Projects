//
//  SGSmokeScreenViewController.m
//  SGSmokeScreenView
//
//  Created by Justin Williams on 7/7/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import "SGSmokeScreenViewController.h"
#import "SGSmokeScreenAnimation.h"

@interface SGSmokeScreenViewController ()
@property (nonatomic, strong) UIViewController *startingViewController;
@property (nonatomic, strong) UIViewController *destinationViewController;
@property (nonatomic, assign, getter=isUnwinding) BOOL unwinding;
@end

@implementation SGSmokeScreenViewController

- (instancetype)initWithStartingViewController:(UIViewController *)startingViewController destinationViewController:(UIViewController *)destinationViewController;
{
    if ((self = [super initWithNibName:nil bundle:nil]))
    {
        _startingViewController = startingViewController;
        _destinationViewController = destinationViewController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    double totalDuration = [[self.animations valueForKeyPath:@"@sum.duration"] doubleValue];
    totalDuration += [[self.animations valueForKeyPath:@"@sum.delay"] doubleValue];
    
    SGBlockWeakSelf bSelf = self;
    for (SGSmokeScreenAnimation *animation in self.animations)
    {
        if (animation.setupBlock != nil)
        {
            animation.setupBlock(bSelf);
        }
        
        NSTimeInterval duration = animation.duration;
        NSTimeInterval delay = animation.delay;
        UIViewAnimationOptions options = animation.options;
        
        
        [UIView animateWithDuration:duration
							  delay:delay
							options:options
						 animations:^{
                             animation.animations(bSelf);
                         } completion:nil];
    }
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(totalDuration * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [bSelf removeSmokeScreen];
    });
}

- (void)performTransition
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self.view];
}

- (void)unwindTransition
{
    self.unwinding = YES;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self.view];
}

- (void)removeSmokeScreen
{
    self.startingViewController.view.hidden = NO;
    self.destinationViewController.view.hidden = NO;

    [self.view removeFromSuperview];
    self.view = nil;
    [self resignFirstResponder];

    if (self.isUnwinding == YES)
    {
        [self.destinationViewController dismissViewControllerAnimated:NO completion:nil];
    }
    
    if (self.completionBlock != nil)
    {
        self.completionBlock();
    }
}

@end
