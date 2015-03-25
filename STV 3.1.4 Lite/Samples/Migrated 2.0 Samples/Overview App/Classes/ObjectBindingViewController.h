//
//  ObjectBindingViewController.h
//  Overview App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ObjectBindingViewController : SCTableViewController 
{
    NSMutableArray *_tasksArray;	// Must be a mutable array since the application will add/remove/re-order objects
}

@end
