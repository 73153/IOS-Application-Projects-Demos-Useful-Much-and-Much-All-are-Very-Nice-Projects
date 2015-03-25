//
//  ViewController.h
//  USStatesColorMapDemo
//
//  Created by Andrey Cherkashin on 07.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class USStatesColorMap;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet USStatesColorMap *statesMap;

- (IBAction)customizeMap:(id)sender;

@end
