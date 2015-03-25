//
//  UIView+ThumbnailListView.h
//  ThumbnailListViewSample
//
//  Created by katsuhisa.ishii on 2013/01/07.
//  Copyright (c) 2013年 katsuhisa.ishii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ThumbnailListView)

@property (nonatomic, assign) CGPoint	origin;
@property (nonatomic, assign) CGSize	size;
@property (nonatomic, assign) CGFloat	x;
@property (nonatomic, assign) CGFloat	y;
@property (nonatomic, assign) CGFloat	width;
@property (nonatomic, assign) CGFloat	height;

@property (nonatomic, readonly) CGFloat	boundsMinX;
@property (nonatomic, readonly) CGFloat	boundsMinY;
@property (nonatomic, readonly) CGFloat	boundsMidX;
@property (nonatomic, readonly) CGFloat	boundsMidY;
@property (nonatomic, readonly) CGFloat	boundsMaxX;
@property (nonatomic, readonly) CGFloat	boundsMaxY;

@property (nonatomic, readonly) CGFloat	frameMinX;
@property (nonatomic, readonly) CGFloat	frameMinY;
@property (nonatomic, readonly) CGFloat	frameMidX;
@property (nonatomic, readonly) CGFloat	frameMidY;
@property (nonatomic, readonly) CGFloat	frameMaxX;
@property (nonatomic, readonly) CGFloat	frameMaxY;

@property (nonatomic, readonly) NSString*	rectString;

- (void)moveOrigin:(CGPoint)origin;
- (void)moveX:(CGFloat)x;
- (void)moveY:(CGFloat)y;

- (CGPoint)middlePoint;
- (void)centering;

- (void)toLeft;
- (void)toTop;
- (void)toRight;
- (void)toBottom;

- (void)autoExpand;

- (UIView*)subviewAtIndex:(NSInteger)index;
- (UIView*)prevView;
- (UIView*)nextView;
- (NSInteger)indexOfSubview:(UIView*)subview;
- (NSInteger)allSubviewsCount;

- (void)removeAllSubviews;

- (void)fadeInAnimationWithDuration:(NSTimeInterval)duration
						 completion:(void (^)(BOOL))completion;
- (void)fadeOutAnimationWithDuration:(NSTimeInterval)duration
						  completion:(void (^)(BOOL))completion;

- (UIImage*)capturedImageWithSize:(CGSize)size;

@end
