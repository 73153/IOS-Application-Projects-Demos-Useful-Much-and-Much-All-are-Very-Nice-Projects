//
//  UIView+ThumbnailListView.m
//  ThumbnailListViewSample
//
//  Created by katsuhisa.ishii on 2013/01/07.
//  Copyright (c) 2013年 katsuhisa.ishii. All rights reserved.
//

#import "UIView+ThumbnailListView.h"
//#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIView (ThumbnailListView)

- (CGPoint)origin
{
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
	CGRect	rect = self.frame;
	
	rect.origin = origin;
	
	self.frame = rect;
}

- (CGSize)size
{
	return self.frame.size;
}

- (void)setSize:(CGSize)size
{
	CGRect	rect = self.frame;
	
	rect.size = size;
	
	self.frame = rect;
}

- (CGFloat)x
{
	return CGRectGetMinX( self.frame );
}

- (void)setX:(CGFloat)x
{
	CGPoint	origin = self.frame.origin;
	
	origin.x = x;
	
	self.origin = origin;
}

- (CGFloat)y
{
	return CGRectGetMinY( self.frame );
}

- (void)setY:(CGFloat)y
{
	CGPoint	origin = self.origin;
	
	origin.y = y;
	
	self.origin = origin;
}

- (CGFloat)width
{
	return CGRectGetWidth( self.frame );
}

- (void)setWidth:(CGFloat)width
{
	CGSize	size = self.size;
	
	size.width = width;
	
	self.size = size;
}

- (CGFloat)height
{
	return CGRectGetHeight( self.frame );
}

- (void)setHeight:(CGFloat)height
{
	CGSize	size = self.size;
	
	size.height = height;
	
	self.size = size;
}

- (CGFloat)boundsMinX
{
	return CGRectGetMinX( self.bounds );
}

- (CGFloat)boundsMinY
{
	return CGRectGetMinY( self.bounds );
}

- (CGFloat)boundsMidX
{
	return CGRectGetMidX( self.bounds );
}

- (CGFloat)boundsMidY
{
	return CGRectGetMidY( self.bounds );
}

- (CGFloat)boundsMaxX
{
	return CGRectGetMaxX( self.bounds );
}

- (CGFloat)boundsMaxY
{
	return CGRectGetMaxY( self.bounds );
}


- (CGFloat)frameMinX
{
	return CGRectGetMinX( self.frame );
}

- (CGFloat)frameMinY
{
	return CGRectGetMinY( self.frame );
}

- (CGFloat)frameMidX
{
	return CGRectGetMidX( self.frame );
}

- (CGFloat)frameMidY
{
	return CGRectGetMidY( self.frame );
}

- (CGFloat)frameMaxX
{
	return CGRectGetMaxX( self.frame );
}

- (CGFloat)frameMaxY
{
	return CGRectGetMaxY( self.frame );
}

- (NSString*)rectString
{
	return NSStringFromCGRect( self.frame );
}

- (void)moveOrigin:(CGPoint)origin
{
	self.origin = CGPointMake(self.frame.origin.x + origin.x, self.frame.origin.y + origin.y);
}

- (void)moveX:(CGFloat)x
{
	self.x = self.origin.x + x;
}

- (void)moveY:(CGFloat)y
{
	self.y = self.origin.y + y;
}

- (CGPoint)middlePoint
{
	return CGPointMake(self.boundsMidX, self.boundsMidY);
}

- (void)centering
{
	if( self.superview ){
		self.center = [self.superview middlePoint];
	}
}

- (void)toLeft
{
	self.x = 0.0;
}

- (void)toTop
{
	self.y = 0.0;
}

- (void)toRight
{
	if( self.superview ){
		self.x = self.superview.boundsMaxX - self.width;
	}
}

- (void)toBottom
{
	if( self.superview ){
		self.y = self.superview.boundsMaxY - self.height;
	}
}

- (void)autoExpand
{
	self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (UIView*)subviewAtIndex:(NSInteger)index
{
	return [self.subviews objectAtIndex:index];
}

- (UIView*)prevView
{
	UIView*	view = nil;
	
	//Superviewが存在する場合のみ
	if( self.superview ){
		NSInteger	index = [self.superview indexOfSubview:self];
		if( 0 < index ){
			view = [self.superview subviewAtIndex:index-1];
		}
	}
	
	return view;
}

- (UIView*)nextView
{
	UIView*	view = nil;
	
	//Superviewが存在する場合のみ
	if( self.superview ){
		NSInteger	index = [self.superview indexOfSubview:self];
		if( index < [self.superview allSubviewsCount]-1 ){
			view = [self.superview subviewAtIndex:index+1];
		}
	}
	
	return view;
}

- (NSInteger)indexOfSubview:(UIView*)subview
{
	return [self.subviews indexOfObject:subview];
}

- (NSInteger)allSubviewsCount
{
	return [self.subviews count];
}

- (void)removeAllSubviews
{
	NSEnumerator*	enumerator = [self.subviews reverseObjectEnumerator];
	
	UIView*	subView = nil;
	while( subView = [enumerator nextObject] ){
		[subView removeFromSuperview];
	}
}

- (void)fadeInAnimationWithDuration:(NSTimeInterval)duration
						 completion:(void (^)(BOOL))completion
{
	[self.layer removeAllAnimations];
	
	self.alpha = 0.0;
	self.hidden = NO;
	
	//フェードインアニメーション
	[UIView animateWithDuration:duration
					 animations:^{
						 self.alpha = 1.0;
					 }
					 completion:^( BOOL finished ){
						 if( finished == NO ){
							 self.hidden = YES;
						 }
						 
						 //コールバック
						 if( completion ){
							 completion( finished );
						 }
					 }];
}

- (void)fadeOutAnimationWithDuration:(NSTimeInterval)duration
						  completion:(void (^)(BOOL))completion
{
	[self.layer removeAllAnimations];
	
	//フェードアウトアニメーション
	[UIView animateWithDuration:duration
					 animations:^{
						 self.alpha = 0.0;
					 }
					 completion:^( BOOL finished ){
						 self.alpha = 1.0;
						 if( finished == NO ){
							 self.hidden = NO;
						 }else{
							 self.hidden = YES;
						 }
						 
						 //コールバック
						 if( completion ){
							 completion( finished );
						 }
					 }];
}

- (UIImage*)capturedImageWithSize:(CGSize)size
{
	UIImage*	image = nil;
	CGRect		rect = CGRectZero;
	
	rect.size = size;
	
	UIGraphicsBeginImageContextWithOptions( /*rect.size*/self.bounds.size, NO, 0 );	// ラスト引数に0を指定する事により、機種依存の解像度を吸収してくれるっぽい
	
	CGContextRef	context = UIGraphicsGetCurrentContext();
	CGContextFillRect( context, rect );
	[self.layer renderInContext:context];
	image = [UIImage imageWithData:UIImagePNGRepresentation( UIGraphicsGetImageFromCurrentImageContext() )];
	
	UIGraphicsEndImageContext();
	
	return image;
}

//---------------------------------------------------------------------------------
#pragma mark - Override
//---------------------------------------------------------------------------------
- (BOOL)isExclusiveTouch
{
	// マルチタッチを排他するため、すべてのViewでYESを返す
	return YES;
}

@end
