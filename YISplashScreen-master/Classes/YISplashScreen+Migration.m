//
//  YISplashScreen+Migration.m
//  YISplashScreenDemo
//
//  Created by Yasuhiro Inami on 2012/08/25.
//  Copyright (c) 2012年 Yasuhiro Inami. All rights reserved.
//

#import "YISplashScreen+Migration.h"

#define YI_IS_IOS_AT_LEAST(ver) ([[[UIDevice currentDevice] systemVersion] compare:ver] != NSOrderedAscending)

static UIAlertView* __confirmAlert = nil;
static UIAlertView* __completeAlert = nil;
static id __migrationDelegate = nil;

static void (^__migrationBlock)(void) = nil;
static void (^__migrationCompletionBlock)(void) = nil;


@interface YISplashScreenMigrationDelegate : NSObject <UIAlertViewDelegate>
@end


@implementation YISplashScreenMigrationDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == __confirmAlert) {
        
        UIAlertView* migrationAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Migrating...", nil) message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        
        UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125, 50, 30, 30)];
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [migrationAlert addSubview:indicator];
        [indicator startAnimating];
        [migrationAlert show];
        
        // perform migration after delay
        double delayInSeconds = 0.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            if (__migrationBlock) {
                __migrationBlock();
            }
            
            // close migrationAlert
            [migrationAlert dismissWithClickedButtonIndex:0 animated:YES];
            
            __completeAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Migration Complete", nil) message:NSLocalizedString(@"Migration Complete Message", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
            
            [__completeAlert show];
            
        });
        
    }
    else if (alertView == __completeAlert) {
        
        // call after migration finished
        if (__migrationCompletionBlock) {
            __migrationCompletionBlock();
        }
        
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView == __completeAlert) {
        
        // clean up
        __migrationBlock = nil;
        __migrationCompletionBlock = nil;
        __migrationDelegate = nil;
        __confirmAlert = nil;
        __completeAlert = nil;
        
    }
}

@end


#pragma mark -


@implementation YISplashScreen (Migration) 

+ (void)showAndWaitForMigration:(void (^)(void))migration completion:(void (^)(void))completion
{
    if (migration) {
        
        [self detachRootViewController];
        [self show];
        
        void (^startMigrationBlock)(void) = ^{
            
            __migrationBlock = migration;
            __migrationCompletionBlock = completion;
            
            __migrationDelegate = [[YISplashScreenMigrationDelegate alloc] init];
            
            // show migration confirm alert
            __confirmAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Migration Start", nil) message:NSLocalizedString(@"Migration Start Message", nil) delegate:__migrationDelegate cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
            [__confirmAlert show];
            
        };
        
        // use dispatch_after to prevent console warning (in iOS5)
        // "Applications are expected to have a root view controller at the end of application launch"
        if (YI_IS_IOS_AT_LEAST(@"5.0") && !YI_IS_IOS_AT_LEAST(@"6.0")) {
            double delayInSeconds = 0.01;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), startMigrationBlock);
        }
        else {
            startMigrationBlock();
        }
        
    }
    else {
        
        [self show];
        
        if (completion) {
            completion();
        }
        
    }
}

@end
