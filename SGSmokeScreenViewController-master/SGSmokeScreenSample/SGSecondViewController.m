//
//  SGSecondViewController.m
//  SGSmokeScreenSample
//
//  Created by Justin Williams on 7/12/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import "SGSecondViewController.h"

@interface SGSecondViewController ()

@end

@implementation SGSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Second", @"");
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
