//
//  UIView+Screenshots.m
//  ZoomingTest
//
//  Created by Justin Williams on 7/2/13.
//  Copyright (c) 2013 Second Gear. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIView+Screenshots.h"

@implementation UIView (Screenshots)

+ (UIImageView *)screenshotForScreen
{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    
	UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat barHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    if ([[UIApplication sharedApplication] isStatusBarHidden] == NO)
    {
        CGFloat scale = [[UIScreen mainScreen] scale];
        CGFloat scaledY = barHeight * scale;
        CGFloat scaledWidth = view.bounds.size.width * scale;
        CGFloat scaledHeight = ((view.bounds.size.height - barHeight) * scale);
        
        CGRect rect = (CGRect) { {0, scaledY }, { scaledWidth, scaledHeight } };
        
        CGImageRef imageRef = CGImageCreateWithImageInRect(screenshotImage.CGImage, rect);
        screenshotImage = [UIImage imageWithCGImage:imageRef scale:screenshotImage.scale orientation:screenshotImage.imageOrientation];
    }
    
	UIImageView *screenshotView = [[UIImageView alloc] initWithImage:screenshotImage];
    screenshotView.frame = (CGRect) { CGPointZero, { view.bounds.size.width, view.bounds.size.height - barHeight }};
    
    return screenshotView;
}

+ (UIImageView *)screenshotForView:(UIView *)view
{
    BOOL isViewHidden = NO;
    
    if (view.hidden == YES)
    {
        isViewHidden = YES;
        view.hidden = NO;
    }
    
	UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
	UIImageView *screenshotView = [[UIImageView alloc] initWithImage:viewImage];
    screenshotView.frame = (CGRect) { CGPointZero, view.bounds.size };
    view.hidden = isViewHidden;
    
    return screenshotView;
}

@end
