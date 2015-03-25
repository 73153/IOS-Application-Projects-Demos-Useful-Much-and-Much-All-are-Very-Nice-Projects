//
//  KIFTestStep+SGBDrillDownController.m
//  SGBDrillDownControllerDemo
//
//  Created by Simon Booth on 12/04/2013.
//  Copyright (c) 2013 Simon Booth. All rights reserved.
//

#import "KIFTestStep+SGBDrillDownController.h"
#import "SGBDemoAppDelegate.h"

@implementation KIFTestStep (SGBDrillDownController)

+ (KIFTestStep *)stepToResetWindow
{
    return [self stepWithDescription:@"Reset the main window" executionBlock:^KIFTestStepResult(KIFTestStep *step, NSError **error) {
       
        SGBDemoAppDelegate *appDelegate = (SGBDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate resetWindow];
        return KIFTestStepResultSuccess;
        
    }];
}

@end
