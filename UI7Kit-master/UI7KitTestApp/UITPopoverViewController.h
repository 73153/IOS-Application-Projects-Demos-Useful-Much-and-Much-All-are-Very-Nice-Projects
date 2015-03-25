//
//  UITPopoverViewController.h
//  UI7Kit
//
//  Created by Jeong YunWon on 13. 9. 6..
//  Copyright (c) 2013년 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITPopoverViewController : UIViewController

@property(strong,nonatomic) UIPopoverController *popoverController;

@end


@interface UITPopoverContentViewController : UIViewController

- (IBAction)actionSheet:(id)sender;

@end
