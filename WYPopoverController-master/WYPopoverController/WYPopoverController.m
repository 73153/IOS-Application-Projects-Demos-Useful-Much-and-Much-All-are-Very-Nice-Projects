/*
 Version 0.2.0
 
 WYPopoverController is available under the MIT license.
 
 Copyright © 2013 Nicolas CHENG
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "WYPopoverController.h"

#import <objc/runtime.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
#define WY_BASE_SDK_7_ENABLED
#endif

#ifdef DEBUG
#define WY_LOG(fmt, ...)		NSLog((@"%s (%d) : " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define WY_LOG(...)
#endif

#define WY_IS_IOS_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define WY_IS_IOS_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define WY_IS_IOS_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define WY_IS_IOS_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


@interface UINavigationController (WYPopover)

@property(nonatomic, assign, getter = isEmbedInPopover) BOOL embedInPopover;

@end

@implementation UINavigationController (WYPopover)

static char const * const UINavigationControllerEmbedInPopoverTagKey = "UINavigationControllerEmbedInPopoverTagKey";

@dynamic embedInPopover;

+ (void)load
{
    Method original, swizzle;
    
    original = class_getInstanceMethod(self, @selector(pushViewController:animated:));
    swizzle = class_getInstanceMethod(self, @selector(sizzled_pushViewController:animated:));
    
    method_exchangeImplementations(original, swizzle);
    
    original = class_getInstanceMethod(self, @selector(setViewControllers:animated:));
    swizzle = class_getInstanceMethod(self, @selector(sizzled_setViewControllers:animated:));
    
    method_exchangeImplementations(original, swizzle);
}

- (BOOL)isEmbedInPopover
{
    BOOL result = NO;
    
    NSNumber *value = objc_getAssociatedObject(self, UINavigationControllerEmbedInPopoverTagKey);
    
    if (value)
    {
        result = [value boolValue];
    }
    
    return result;
}

- (void)setEmbedInPopover:(BOOL)value
{
    objc_setAssociatedObject(self, UINavigationControllerEmbedInPopoverTagKey, [NSNumber numberWithBool:value], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)sizzled_pushViewController:(UIViewController *)aViewController animated:(BOOL)aAnimated
{
    if (self.isEmbedInPopover)
    {
#ifdef WY_BASE_SDK_7_ENABLED
        if ([aViewController respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            aViewController.edgesForExtendedLayout = UIRectEdgeNone;
        }
#endif
    }
    
    [self sizzled_pushViewController:aViewController animated:aAnimated];
}

- (void)sizzled_setViewControllers:(NSArray *)aViewControllers animated:(BOOL)aAnimated
{
    if (self.isEmbedInPopover)
    {
#ifdef WY_BASE_SDK_7_ENABLED
        if (aViewControllers && [aViewControllers count] > 0)
        {
            for (UIViewController *viewController in aViewControllers) {
                if ([viewController respondsToSelector:@selector(setEdgesForExtendedLayout:)])
                {
                    viewController.edgesForExtendedLayout = UIRectEdgeNone;
                }
            }
        }
#endif
    }
    
    [self sizzled_setViewControllers:aViewControllers animated:aAnimated];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIViewController (WYPopover)
@end

@implementation UIViewController (WYPopover)

+ (void)load
{
    Method original, swizzle;
    
#pragma clang diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated"
    original = class_getInstanceMethod(self, @selector(setContentSizeForViewInPopover:));
    swizzle = class_getInstanceMethod(self, @selector(sizzled_setContentSizeForViewInPopover:));
    method_exchangeImplementations(original, swizzle);
#pragma clang diagnostic pop
    
#ifdef WY_BASE_SDK_7_ENABLED
    original = class_getInstanceMethod(self, @selector(setPreferredContentSize:));
    swizzle = class_getInstanceMethod(self, @selector(sizzled_setPreferredContentSize:));
    
    if (original != NULL) {
        method_exchangeImplementations(original, swizzle);
    }
#endif
}

- (void)sizzled_setContentSizeForViewInPopover:(CGSize)aSize
{
    [self sizzled_setContentSizeForViewInPopover:aSize];
    
    if ([self isKindOfClass:[UINavigationController class]] == NO && self.navigationController != nil)
    {
#pragma clang diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated"
        [self.navigationController setContentSizeForViewInPopover:aSize];
#pragma clang diagnostic pop
    }
}

- (void)sizzled_setPreferredContentSize:(CGSize)aSize
{
    [self sizzled_setPreferredContentSize:aSize];
    
    if ([self isKindOfClass:[UINavigationController class]] == NO && self.navigationController != nil)
    {
#ifdef WY_BASE_SDK_7_ENABLED
        if ([self respondsToSelector:@selector(setPreferredContentSize:)]) {
            [self.navigationController setPreferredContentSize:aSize];
        }
#endif
    }
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface WYPopoverArea : NSObject
{
}

@property (nonatomic, assign) WYPopoverArrowDirection arrowDirection;
@property (nonatomic, assign) CGSize areaSize;
@property (nonatomic, assign, readonly) CGFloat value;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - WYPopoverArea

@implementation WYPopoverArea

@synthesize arrowDirection;
@synthesize areaSize;
@synthesize value;

- (NSString*)description
{
    NSString* direction = @"";
    
    if (arrowDirection == WYPopoverArrowDirectionUp)
    {
        direction = @"UP";
    }
    else if (arrowDirection == WYPopoverArrowDirectionDown)
    {
        direction = @"DOWN";
    }
    else if (arrowDirection == WYPopoverArrowDirectionLeft)
    {
        direction = @"LEFT";
    }
    else if (arrowDirection == WYPopoverArrowDirectionRight)
    {
        direction = @"RIGHT";
    }
    else if (arrowDirection == WYPopoverArrowDirectionNone)
    {
        direction = @"NONE";
    }
    
    return [NSString stringWithFormat:@"%@ [ %f x %f ]", direction, areaSize.width, areaSize.height];
}

- (CGFloat)value
{
    CGFloat result = 0;
    
    if (areaSize.width > 0 && areaSize.height > 0)
    {
        CGFloat w1 = ceilf(areaSize.width / 10.0);
        CGFloat h1 = ceilf(areaSize.height / 10.0);
        
        result = (w1 * h1);
    }
    
    return result;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIImage (WYPopover)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - UIImage (WYPopover)

@implementation UIImage (WYPopover)

static CGFloat edgeSizeFromCornerRadius(CGFloat cornerRadius) {
    return cornerRadius * 2 + 1;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color size:CGSizeMake(8, 8) cornerRadius:0];
}

+ (UIImage *)imageWithColor:(UIColor *)color
               cornerRadius:(CGFloat)cornerRadius
{
    CGFloat min = edgeSizeFromCornerRadius(cornerRadius);
    
    CGSize minSize = CGSizeMake(min, min);
    
    return [self imageWithColor:color size:minSize cornerRadius:cornerRadius];
}

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)aSize
               cornerRadius:(CGFloat)cornerRadius
{
    CGRect rect = CGRectMake(0, 0, aSize.width, aSize.height);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    roundedRect.lineWidth = 0;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    [color setFill];
    [roundedRect fill];
    //[roundedRect stroke];
    //[roundedRect addClip];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIColor (WYPopover)

- (BOOL)getValueOfRed:(CGFloat*)red green:(CGFloat*)green blue:(CGFloat*)blue alpha:(CGFloat*)apha;
- (NSString *)hexString;
- (UIColor *)colorByLighten:(CGFloat)d;
- (UIColor *)colorByDarken:(CGFloat)d;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation UIColor (WYPopover)

- (BOOL)getValueOfRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
    // model: kCGColorSpaceModelRGB, num_comps: 4
    // model: kCGColorSpaceModelMonochrome, num_comps: 2
    
    CGColorSpaceRef colorSpace = CGColorSpaceRetain(CGColorGetColorSpace([self CGColor]));
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(colorSpace);
    CGColorSpaceRelease(colorSpace);
    
    CGFloat rFloat = 0, gFloat = 0, bFloat = 0, aFloat = 0;
    BOOL result = NO;
    
    if (colorSpaceModel == kCGColorSpaceModelRGB)
    {
        result = [self getRed:&rFloat green:&gFloat blue:&bFloat alpha:&aFloat];
    }
    else if (colorSpaceModel == kCGColorSpaceModelMonochrome)
    {
        result = [self getWhite:&rFloat alpha:&aFloat];
        gFloat = rFloat;
        bFloat = rFloat;
    }
    
    if (red) *red = rFloat;
    if (green) *green = gFloat;
    if (blue) *blue = bFloat;
    if (alpha) *alpha = aFloat;
    
    return result;
}

- (NSString *)hexString
{
    CGFloat rFloat, gFloat, bFloat, aFloat;
    int r, g, b, a;
    [self getValueOfRed:&rFloat green:&gFloat blue:&bFloat alpha:&aFloat];
    
    r = (int)(255.0 * rFloat);
    g = (int)(255.0 * gFloat);
    b = (int)(255.0 * bFloat);
    a = (int)(255.0 * aFloat);
    
    return [NSString stringWithFormat:@"#%02x%02x%02x%02x", r, g, b, a];
}

- (UIColor *)colorByLighten:(CGFloat)d
{
    CGFloat rFloat, gFloat, bFloat, aFloat;
    [self getValueOfRed:&rFloat green:&gFloat blue:&bFloat alpha:&aFloat];
    
    return [UIColor colorWithRed:MIN(rFloat + d, 1.0)
                           green:MIN(gFloat + d, 1.0)
                            blue:MIN(bFloat + d, 1.0)
                           alpha:1.0];
}

- (UIColor *)colorByDarken:(CGFloat)d
{
    CGFloat rFloat, gFloat, bFloat, aFloat;
    [self getValueOfRed:&rFloat green:&gFloat blue:&bFloat alpha:&aFloat];
    
    return [UIColor colorWithRed:MAX(rFloat - d, 0.0)
                           green:MAX(gFloat - d, 0.0)
                            blue:MAX(bFloat - d, 0.0)
                           alpha:1.0];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface WYPopoverInnerView : UIView
{
}

@property (nonatomic, strong) UIColor *innerStrokeColor;

@property (nonatomic, strong) UIColor *gradientTopColor;
@property (nonatomic, strong) UIColor *gradientBottomColor;
@property (nonatomic, assign) CGFloat  gradientHeight;
@property (nonatomic, assign) CGFloat  gradientTopPosition;

@property (nonatomic, strong) UIColor *innerShadowColor;
@property (nonatomic, assign) CGSize   innerShadowOffset;
@property (nonatomic, assign) CGFloat  innerShadowBlurRadius;
@property (nonatomic, assign) CGFloat  innerCornerRadius;

@property (nonatomic, assign) CGFloat  navigationBarHeight;
@property (nonatomic, assign) BOOL     wantsDefaultContentAppearance;
@property (nonatomic, assign) CGFloat  borderWidth;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - WYPopoverInnerView

@implementation WYPopoverInnerView

@synthesize innerStrokeColor;

@synthesize gradientTopColor;
@synthesize gradientBottomColor;
@synthesize gradientHeight;
@synthesize gradientTopPosition;

@synthesize innerShadowColor;
@synthesize innerShadowOffset;
@synthesize innerShadowBlurRadius;
@synthesize innerCornerRadius;

@synthesize navigationBarHeight;
@synthesize wantsDefaultContentAppearance;
@synthesize borderWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Gradient Declarations
    NSArray* fillGradientColors = [NSArray arrayWithObjects:
                                   (id)gradientTopColor.CGColor,
                                   (id)gradientBottomColor.CGColor, nil];
    CGFloat fillGradientLocations[] = {0, 1};
    CGGradientRef fillGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)fillGradientColors, fillGradientLocations);
    
    //// innerRect Drawing
    CGFloat barHeight = (wantsDefaultContentAppearance == NO) ? navigationBarHeight : 0;
    CGFloat cornerRadius = (wantsDefaultContentAppearance == NO) ? innerCornerRadius : 0;
    
    CGRect innerRect = CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect) + barHeight, CGRectGetWidth(rect) , CGRectGetHeight(rect) - barHeight);
    
    UIBezierPath* rectPath = [UIBezierPath bezierPathWithRect:innerRect];
    
    UIBezierPath* roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:innerRect cornerRadius:cornerRadius + 1];
    
    if (wantsDefaultContentAppearance == NO && borderWidth > 0)
    {
        CGContextSaveGState(context);
        {
            [rectPath appendPath:roundedRectPath];
            rectPath.usesEvenOddFillRule = YES;
            [rectPath addClip];
            
            CGContextDrawLinearGradient(context, fillGradient,
                                        CGPointMake(0, -gradientTopPosition),
                                        CGPointMake(0, -gradientTopPosition + gradientHeight),
                                        0);
        }
        CGContextRestoreGState(context);
    }
    
    CGContextSaveGState(context);
    {
        if (wantsDefaultContentAppearance == NO && borderWidth > 0)
        {
            [roundedRectPath addClip];
            CGContextSetShadowWithColor(context, innerShadowOffset, innerShadowBlurRadius, innerShadowColor.CGColor);
        }
        
        UIBezierPath* inRoundedRectPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(innerRect, 0.5, 0.5) cornerRadius:cornerRadius];
        
        if (borderWidth == 0)
        {
            inRoundedRectPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(innerRect, 0.5, 0.5) byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
        
        [self.innerStrokeColor setStroke];
        inRoundedRectPath.lineWidth = 1;
        [inRoundedRectPath stroke];
    }
    
    CGContextRestoreGState(context);
    
    CGGradientRelease(fillGradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)dealloc
{
    innerShadowColor = nil;
    innerStrokeColor = nil;
    gradientTopColor = nil;
    gradientBottomColor = nil;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@protocol WYPopoverOverlayViewDelegate;

@interface WYPopoverOverlayView : UIView
{
    BOOL _isAccessible;
}

@property(nonatomic, assign) id <WYPopoverOverlayViewDelegate> delegate;
@property(nonatomic, assign) BOOL testHits;
@property(nonatomic, unsafe_unretained) NSArray *passthroughViews;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - WYPopoverOverlayViewDelegate

@protocol WYPopoverOverlayViewDelegate <NSObject>

@optional
- (void)popoverOverlayView:(WYPopoverOverlayView*)overlayView didTouchAtPoint:(CGPoint)point;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - WYPopoverOverlayView

@implementation WYPopoverOverlayView

- (id)initWithFrame:(CGRect)aFrame {
    self = [super initWithFrame:aFrame];
    if (self) {
        self.autoresizesSubviews = NO;
        self.accessibilityTraits = UIAccessibilityTraitNone;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *oneTouch = [touches anyObject];
    
    if ([self.delegate respondsToSelector:@selector(popoverOverlayView:didTouchAtPoint:)])
    {
        [self.delegate popoverOverlayView:self didTouchAtPoint:[oneTouch locationInView:self]];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.testHits)
    {
        return NO;
    }
    
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view == self)
    {
        self.testHits = YES;
        UIView *superHitView = [self.superview hitTest:point withEvent:event];
        self.testHits = NO;
        
        if ([self isPassthroughView:superHitView])
        {
            return superHitView;
        }
    }
    
    return view;
}

- (BOOL)isPassthroughView:(UIView *)view
{
	if (view == nil)
    {
		return NO;
	}
	
	if ([self.passthroughViews containsObject:view])
    {
		return YES;
	}
	
	return [self isPassthroughView:view.superview];
}

#pragma mark - UIAccessibility

- (void)accessibilityElementDidBecomeFocused {
    self.accessibilityLabel = NSLocalizedString(@"Double-tap to dismiss pop-up window.", nil);
}

- (void)accessibilityElementDidLoseFocus {
    
}

@end


////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface WYPopoverBackgroundView ()
{
    WYPopoverInnerView* innerView;
    CGSize contentSize;
}

@property (nonatomic, assign) WYPopoverArrowDirection arrowDirection;

@property (nonatomic, strong, readonly) UIView *contentView;
@property (nonatomic, assign, readonly) CGFloat navigationBarHeight;
@property (nonatomic, assign, readonly) UIEdgeInsets outerShadowInsets;
@property (nonatomic, assign) CGFloat arrowOffset;
@property (nonatomic, assign) BOOL wantsDefaultContentAppearance;

@property (nonatomic, strong, readonly) UIColor* defaultTintColor;

- (void)setViewController:(UIViewController*)viewController;

- (CGRect)outerRect;
- (CGRect)innerRect;
- (CGRect)arrowRect;

- (CGRect)outerRect:(CGRect)rect arrowDirection:(WYPopoverArrowDirection)aArrowDirection;
- (CGRect)innerRect:(CGRect)rect arrowDirection:(WYPopoverArrowDirection)aArrowDirection;
- (CGRect)arrowRect:(CGRect)rect arrowDirection:(WYPopoverArrowDirection)aArrowDirection;

- (id)initWithContentSize:(CGSize)contentSize;

- (BOOL)isTouchedAtPoint:(CGPoint)point;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - WYPopoverBackgroundView

@implementation WYPopoverBackgroundView

@synthesize tintColor;

@synthesize fillTopColor;
@synthesize fillBottomColor;
@synthesize glossShadowColor;
@synthesize glossShadowOffset;
@synthesize glossShadowBlurRadius;
@synthesize borderWidth;
@synthesize arrowBase;
@synthesize arrowHeight;
@synthesize outerShadowColor;
@synthesize outerStrokeColor;
@synthesize outerShadowBlurRadius;
@synthesize outerShadowOffset;
@synthesize outerCornerRadius;
@synthesize minOuterCornerRadius;
@synthesize innerShadowColor;
@synthesize innerStrokeColor;
@synthesize innerShadowBlurRadius;
@synthesize innerShadowOffset;
@synthesize innerCornerRadius;
@synthesize viewContentInsets;

@synthesize arrowDirection;
@synthesize contentView;
@synthesize arrowOffset;
@synthesize navigationBarHeight;
@synthesize wantsDefaultContentAppearance;
@synthesize defaultTintColor;

@synthesize outerShadowInsets;

+ (void)load
{
    @autoreleasepool {
        WYPopoverBackgroundView* appearance = [WYPopoverBackgroundView appearance];
        
        if (WY_IS_IOS_LESS_THAN(@"7.0"))
        {
            appearance.tintColor = nil;
            
            appearance.outerStrokeColor = nil;
            appearance.innerStrokeColor = nil;
            appearance.fillTopColor = nil;
            appearance.fillBottomColor = nil;
            appearance.glossShadowColor = nil;
            appearance.glossShadowOffset = CGSizeMake(0, 1.5);
            appearance.glossShadowBlurRadius = 0;
            appearance.borderWidth = 6;
            appearance.arrowBase = 42;
            appearance.arrowHeight = 18;
            appearance.outerShadowColor = [UIColor colorWithWhite:0 alpha:0.75];
            appearance.outerShadowBlurRadius = 8;
            appearance.outerShadowOffset = CGSizeMake(0, 2);
            appearance.outerCornerRadius = 8;
            appearance.minOuterCornerRadius = 0;
            appearance.innerShadowColor = [UIColor colorWithWhite:0 alpha:0.75];
            appearance.innerShadowBlurRadius = 2;
            appearance.innerShadowOffset = CGSizeMake(0, 1);
            appearance.innerCornerRadius = 6;
            appearance.viewContentInsets = UIEdgeInsetsMake(3, 0, 0, 0);
            appearance.overlayColor = [UIColor clearColor];
        }
        else
        {
            appearance.tintColor = nil;
            
            appearance.outerStrokeColor = [UIColor clearColor];
            appearance.innerStrokeColor = [UIColor clearColor];
            appearance.fillTopColor = nil;
            appearance.fillBottomColor = nil;
            appearance.glossShadowColor = nil;
            appearance.glossShadowOffset = CGSizeZero;
            appearance.glossShadowBlurRadius = 0;
            appearance.borderWidth = 0;
            appearance.arrowBase = 25;
            appearance.arrowHeight = 13;
            appearance.outerShadowColor = [UIColor clearColor];
            appearance.outerShadowBlurRadius = 0;
            appearance.outerShadowOffset = CGSizeZero;
            appearance.outerCornerRadius = 5;
            appearance.minOuterCornerRadius = 0;
            appearance.innerShadowColor = [UIColor clearColor];
            appearance.innerShadowBlurRadius = 0;
            appearance.innerShadowOffset = CGSizeZero;
            appearance.innerCornerRadius = 0;
            appearance.viewContentInsets = UIEdgeInsetsZero;
            appearance.overlayColor = [UIColor colorWithWhite:0 alpha:0.15];
        }
    }
}

- (id)initWithContentSize:(CGSize)aContentSize
{
    self = [super initWithFrame:CGRectMake(0, 0, aContentSize.width, aContentSize.height)];
    
    if (self != nil)
    {
        contentSize = aContentSize;
        
        self.autoresizesSubviews = NO;
        self.backgroundColor = [UIColor clearColor];
        
        self.arrowDirection = WYPopoverArrowDirectionDown;
        self.arrowOffset = 0;
        
        self.layer.name = @"parent";
        
        if (WY_IS_IOS_GREATER_THAN_OR_EQUAL_TO(@"6.0"))
        {
            self.layer.drawsAsynchronously = YES;
        }
        
        self.layer.contentsScale = [UIScreen mainScreen].scale;
        //self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
        self.layer.delegate = self;
    }
    
    return self;
}

- (UIEdgeInsets)outerShadowInsets
{
    UIEdgeInsets result = UIEdgeInsetsMake(outerShadowBlurRadius, outerShadowBlurRadius, outerShadowBlurRadius, outerShadowBlurRadius);
    
    result.top -= self.outerShadowOffset.height;
    result.bottom += self.outerShadowOffset.height;
    result.left -= self.outerShadowOffset.width;
    result.right += self.outerShadowOffset.width;
    
    return result;
}

- (void)setArrowOffset:(CGFloat)value
{
    CGFloat coef = 1;
    
    if (value != 0)
    {
        coef = value / ABS(value);
        
        value = ABS(value);
        
        CGRect outerRect = [self outerRect];
        
        CGFloat delta = self.arrowBase / 2. + .5;
        
        delta  += MIN(minOuterCornerRadius, outerCornerRadius);
        
        outerRect = CGRectInset(outerRect, delta, delta);
        
        if (arrowDirection == WYPopoverArrowDirectionUp || arrowDirection == WYPopoverArrowDirectionDown)
        {
            value += coef * self.outerShadowOffset.width;
            value = MIN(value, CGRectGetWidth(outerRect) / 2);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionLeft || arrowDirection == WYPopoverArrowDirectionRight)
        {
            value += coef * self.outerShadowOffset.height;
            value = MIN(value, CGRectGetHeight(outerRect) / 2);
        }
    }
    else
    {
        if (arrowDirection == WYPopoverArrowDirectionUp || arrowDirection == WYPopoverArrowDirectionDown)
        {
            value += self.outerShadowOffset.width;
        }
        
        if (arrowDirection == WYPopoverArrowDirectionLeft || arrowDirection == WYPopoverArrowDirectionRight)
        {
            value += self.outerShadowOffset.height;
        }
    }
    
    arrowOffset = value * coef;
}

- (void)setViewController:(UIViewController *)viewController
{
    contentView = viewController.view;
    
    contentView.frame = CGRectIntegral(CGRectMake(0, 0, self.bounds.size.width, 100));
    
    [self addSubview:contentView];
    
    navigationBarHeight = 0;
    
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController* navigationController = (UINavigationController*)viewController;
        navigationBarHeight = navigationController.navigationBar.bounds.size.height;
    }
    
    contentView.frame = CGRectIntegral([self innerRect]);
    
    if (innerView == nil)
    {
        innerView = [[WYPopoverInnerView alloc] initWithFrame:contentView.frame];
        innerView.userInteractionEnabled = NO;
        
        innerView.gradientTopColor = self.fillTopColor;
        innerView.gradientBottomColor = self.fillBottomColor;
        innerView.innerShadowColor = innerShadowColor;
        
        innerView.innerStrokeColor = self.innerStrokeColor;
        
        innerView.innerShadowOffset = innerShadowOffset;
        innerView.innerCornerRadius = self.innerCornerRadius;
        innerView.innerShadowBlurRadius = innerShadowBlurRadius;
        innerView.borderWidth = self.borderWidth;
    }
    
    innerView.navigationBarHeight = navigationBarHeight;
    innerView.gradientHeight = self.frame.size.height - 2 * outerShadowBlurRadius;
    innerView.gradientTopPosition = contentView.frame.origin.y - self.outerShadowInsets.top;
    innerView.wantsDefaultContentAppearance = wantsDefaultContentAppearance;
    
    [self insertSubview:innerView aboveSubview:contentView];
    
    innerView.frame = CGRectIntegral(contentView.frame);
    
    [self.layer setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize result = size;
    
    result.width += 2 * (borderWidth + outerShadowBlurRadius);
    result.height += borderWidth + 2 * outerShadowBlurRadius;
    
    if (navigationBarHeight == 0)
    {
        result.height += borderWidth;
    }
    
    if (arrowDirection == WYPopoverArrowDirectionUp || arrowDirection == WYPopoverArrowDirectionDown)
    {
        result.height += arrowHeight;
    }
    
    if (arrowDirection == WYPopoverArrowDirectionLeft || arrowDirection == WYPopoverArrowDirectionRight)
    {
        result.width += arrowHeight;
    }
    
    return result;
}

- (void)sizeToFit
{
    CGSize size = [self sizeThatFits:contentSize];
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

#pragma mark Overrides

- (CGFloat)innerCornerRadius
{
    CGFloat result = innerCornerRadius;
    
    if (borderWidth == 0)
    {
        result = 0;
        
        if (outerCornerRadius > 0)
        {
            result = outerCornerRadius;
        }
    }
    
    return result;
}

- (CGSize)outerShadowOffset
{
    CGSize result = outerShadowOffset;
    
    result.width = MIN(result.width, outerShadowBlurRadius);
    result.height = MIN(result.height, outerShadowBlurRadius);
    
    return result;
}

- (UIColor *)innerStrokeColor
{
    UIColor *result = innerStrokeColor;
    
    if (result == nil)
    {
        result = [self.fillTopColor colorByDarken:0.6];
    }
    
    return result;
}

- (UIColor *)outerStrokeColor
{
    UIColor *result = outerStrokeColor;
    
    if (result == nil)
    {
        result = [self.fillTopColor colorByDarken:0.6];
    }
    
    return result;
}

- (UIColor *)glossShadowColor
{
    UIColor *result = glossShadowColor;
    
    if (result == nil)
    {
        result = [self.fillTopColor colorByLighten:0.2];
    }
    
    return result;
}

- (UIColor *)fillTopColor
{
    UIColor *result = fillTopColor;
    
    if (result == nil)
    {
        UIColor *baseColor = tintColor;
        
        if (baseColor == nil)
        {
            baseColor = self.defaultTintColor;
        }
        
        result = baseColor;
    }
    
    return result;
}

- (UIColor *)fillBottomColor
{
    UIColor *result = fillBottomColor;
    
    if (result == nil)
    {
        result = (WY_IS_IOS_LESS_THAN(@"7.0")) ? [self.fillTopColor colorByDarken:0.4] : self.fillTopColor;
    }
    
    return result;
}

- (UIColor *)defaultTintColor
{
    BOOL isUI7 = (WY_IS_IOS_LESS_THAN(@"7.0") == NO);
    
    CGFloat r = ((isUI7) ? 244. : 55.) / 255.;
    CGFloat g = ((isUI7) ? 244. : 63.) / 255.;
    CGFloat b = ((isUI7) ? 244. : 71.) / 255.;
    
    UIColor* result = [UIColor colorWithRed:r green:g blue:b alpha:1];
    return result;
}

#pragma mark Drawing

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    
    [self.layer setNeedsDisplay];
    
    if (innerView)
    {
        innerView.navigationBarHeight = navigationBarHeight;
        innerView.gradientHeight = self.frame.size.height - 2 * outerShadowBlurRadius;
        innerView.gradientTopPosition = contentView.frame.origin.y - self.outerShadowInsets.top;
        innerView.wantsDefaultContentAppearance = wantsDefaultContentAppearance;
        [innerView setNeedsDisplay];
    }
}

#pragma mark CALayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context
{
    if ([layer.name isEqualToString:@"parent"])
    {
        UIGraphicsPushContext(context);
        //CGContextSetShouldAntialias(context, YES);
        //CGContextSetAllowsAntialiasing(context, YES);
        
        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        //// Gradient Declarations
        NSArray* fillGradientColors = [NSArray arrayWithObjects:
                                       (id)self.fillTopColor.CGColor,
                                       (id)self.fillBottomColor.CGColor, nil];
        CGFloat fillGradientLocations[] = {0, 1};
        CGGradientRef fillGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)fillGradientColors, fillGradientLocations);
        
        // Frames
        CGRect rect = self.bounds;
        
        CGRect outerRect = [self outerRect:rect arrowDirection:self.arrowDirection];
        outerRect = CGRectInset(outerRect, 0.5, 0.5);
        
        // Inner Path
        CGMutablePathRef outerPathRef = CGPathCreateMutable();
        
        CGPoint origin = CGPointZero;
        
        CGFloat reducedOuterCornerRadius = 0;
        
        if (arrowDirection == WYPopoverArrowDirectionUp || arrowDirection == WYPopoverArrowDirectionDown)
        {
            if (arrowOffset >= 0)
            {
                reducedOuterCornerRadius = CGRectGetMaxX(outerRect) - (CGRectGetMidX(outerRect) + arrowOffset + arrowBase / 2);
            }
            else
            {
                reducedOuterCornerRadius = (CGRectGetMidX(outerRect) + arrowOffset - arrowBase / 2) - CGRectGetMinX(outerRect);
            }
        }
        else if (arrowDirection == WYPopoverArrowDirectionLeft || arrowDirection == WYPopoverArrowDirectionRight)
        {
            if (arrowOffset >= 0)
            {
                reducedOuterCornerRadius = CGRectGetMaxY(outerRect) - (CGRectGetMidY(outerRect) + arrowOffset + arrowBase / 2);
            }
            else
            {
                reducedOuterCornerRadius = (CGRectGetMidY(outerRect) + arrowOffset - arrowBase / 2) - CGRectGetMinY(outerRect);
            }
        }
        
        reducedOuterCornerRadius = MIN(reducedOuterCornerRadius, outerCornerRadius);
        
        if (arrowDirection == WYPopoverArrowDirectionUp)
        {
            origin = CGPointMake(CGRectGetMidX(outerRect) + arrowOffset - arrowBase / 2, CGRectGetMinY(outerRect));
            
            CGPathMoveToPoint(outerPathRef, NULL, origin.x, origin.y);
            
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMidX(outerRect) + arrowOffset, CGRectGetMinY(outerRect) - arrowHeight);
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMidX(outerRect) + arrowOffset + arrowBase / 2, CGRectGetMinY(outerRect));
            
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), (arrowOffset >= 0) ? reducedOuterCornerRadius : outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), (arrowOffset < 0) ? reducedOuterCornerRadius : outerCornerRadius);
            
            CGPathAddLineToPoint(outerPathRef, NULL, origin.x, origin.y);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionDown)
        {
            origin = CGPointMake(CGRectGetMidX(outerRect) + arrowOffset + arrowBase / 2, CGRectGetMaxY(outerRect));
            
            CGPathMoveToPoint(outerPathRef, NULL, origin.x, origin.y);
            
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMidX(outerRect) + arrowOffset, CGRectGetMaxY(outerRect) + arrowHeight);
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMidX(outerRect) + arrowOffset - arrowBase / 2, CGRectGetMaxY(outerRect));
            
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), (arrowOffset < 0) ? reducedOuterCornerRadius : outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), (arrowOffset >= 0) ? reducedOuterCornerRadius : outerCornerRadius);
            
            CGPathAddLineToPoint(outerPathRef, NULL, origin.x, origin.y);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionLeft)
        {
            origin = CGPointMake(CGRectGetMinX(outerRect), CGRectGetMidY(outerRect) + arrowOffset + arrowBase / 2);
            
            CGPathMoveToPoint(outerPathRef, NULL, origin.x, origin.y);
            
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect) - arrowHeight, CGRectGetMidY(outerRect) + arrowOffset);
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMidY(outerRect) + arrowOffset - arrowBase / 2);
            
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), (arrowOffset < 0) ? reducedOuterCornerRadius : outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), (arrowOffset >= 0) ? reducedOuterCornerRadius : outerCornerRadius);
            
            CGPathAddLineToPoint(outerPathRef, NULL, origin.x, origin.y);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionRight)
        {
            origin = CGPointMake(CGRectGetMaxX(outerRect), CGRectGetMidY(outerRect) + arrowOffset - arrowBase / 2);
            
            CGPathMoveToPoint(outerPathRef, NULL, origin.x, origin.y);
            
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect) + arrowHeight, CGRectGetMidY(outerRect) + arrowOffset);
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMidY(outerRect) + arrowOffset + arrowBase / 2);
            
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), (arrowOffset >= 0) ? reducedOuterCornerRadius : outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), (arrowOffset < 0) ? reducedOuterCornerRadius : outerCornerRadius);
            
            CGPathAddLineToPoint(outerPathRef, NULL, origin.x, origin.y);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionNone)
        {
            origin = CGPointMake(CGRectGetMaxX(outerRect), CGRectGetMidY(outerRect));
            
            CGPathMoveToPoint(outerPathRef, NULL, origin.x, origin.y);
            
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMidY(outerRect));
            CGPathAddLineToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMidY(outerRect));
            
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMaxY(outerRect), CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMinX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), outerCornerRadius);
            CGPathAddArcToPoint(outerPathRef, NULL, CGRectGetMaxX(outerRect), CGRectGetMinY(outerRect), CGRectGetMaxX(outerRect), CGRectGetMaxY(outerRect), outerCornerRadius);
            
            CGPathAddLineToPoint(outerPathRef, NULL, origin.x, origin.y);
        }
        
        CGPathCloseSubpath(outerPathRef);
        
        UIBezierPath* outerRectPath = [UIBezierPath bezierPathWithCGPath:outerPathRef];
        
        CGContextSaveGState(context);
        {
            CGContextSetShadowWithColor(context, self.outerShadowOffset, outerShadowBlurRadius, outerShadowColor.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [outerRectPath addClip];
            CGRect outerRectBounds = CGPathGetPathBoundingBox(outerRectPath.CGPath);
            CGContextDrawLinearGradient(context, fillGradient,
                                        CGPointMake(CGRectGetMidX(outerRectBounds), CGRectGetMinY(outerRectBounds)),
                                        CGPointMake(CGRectGetMidX(outerRectBounds), CGRectGetMaxY(outerRectBounds)),
                                        0);
            CGContextEndTransparencyLayer(context);
        }
        CGContextRestoreGState(context);
        
        ////// outerRect Inner Shadow
        CGRect outerRectBorderRect = CGRectInset([outerRectPath bounds], -glossShadowBlurRadius, -glossShadowBlurRadius);
        outerRectBorderRect = CGRectOffset(outerRectBorderRect, -glossShadowOffset.width, -glossShadowOffset.height);
        outerRectBorderRect = CGRectInset(CGRectUnion(outerRectBorderRect, [outerRectPath bounds]), -1, -1);
        
        UIBezierPath* outerRectNegativePath = [UIBezierPath bezierPathWithRect: outerRectBorderRect];
        [outerRectNegativePath appendPath: outerRectPath];
        outerRectNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = glossShadowOffset.width + round(outerRectBorderRect.size.width);
            CGFloat yOffset = glossShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        glossShadowBlurRadius,
                                        self.glossShadowColor.CGColor);
            
            [outerRectPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(outerRectBorderRect.size.width), 0);
            [outerRectNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [outerRectNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        [self.outerStrokeColor setStroke];
        outerRectPath.lineWidth = 1;
        [outerRectPath stroke];
        
        //// Cleanup
        CFRelease(outerPathRef);
        CGGradientRelease(fillGradient);
        CGColorSpaceRelease(colorSpace);
        
        UIGraphicsPopContext();
    }
}

#pragma mark Private

- (CGRect)outerRect
{
    return [self outerRect:self.bounds arrowDirection:self.arrowDirection];
}

- (CGRect)innerRect
{
    return [self innerRect:self.bounds arrowDirection:self.arrowDirection];
}

- (CGRect)arrowRect
{
    return [self arrowRect:self.bounds arrowDirection:self.arrowDirection];
}

- (CGRect)outerRect:(CGRect)rect arrowDirection:(WYPopoverArrowDirection)aArrowDirection
{
    CGRect result = rect;
    
    if (aArrowDirection == WYPopoverArrowDirectionUp || arrowDirection == WYPopoverArrowDirectionDown)
    {
        result.size.height -= arrowHeight;
        
        if (aArrowDirection == WYPopoverArrowDirectionUp)
        {
            result = CGRectOffset(result, 0, arrowHeight);
        }
    }
    
    if (aArrowDirection == WYPopoverArrowDirectionLeft || arrowDirection == WYPopoverArrowDirectionRight)
    {
        result.size.width -= arrowHeight;
        
        if (aArrowDirection == WYPopoverArrowDirectionLeft)
        {
            result = CGRectOffset(result, arrowHeight, 0);
        }
    }
    
    result = CGRectInset(result, outerShadowBlurRadius, outerShadowBlurRadius);
    result.origin.x -= self.outerShadowOffset.width;
    result.origin.y -= self.outerShadowOffset.height;
    
    return result;
}

- (CGRect)innerRect:(CGRect)rect arrowDirection:(WYPopoverArrowDirection)aArrowDirection
{
    CGRect result = [self outerRect:rect arrowDirection:aArrowDirection];
    
    result.origin.x += borderWidth;
    result.origin.y += 0;
    result.size.width -= 2 * borderWidth;
    result.size.height -= borderWidth;
    
    if (navigationBarHeight == 0 || wantsDefaultContentAppearance)
    {
        result.origin.y += borderWidth;
        result.size.height -= borderWidth;
    }
    
    result.origin.x += viewContentInsets.left;
    result.origin.y += viewContentInsets.top;
    result.size.width = result.size.width - viewContentInsets.left - viewContentInsets.right;
    result.size.height = result.size.height - viewContentInsets.top - viewContentInsets.bottom;
    
    if (borderWidth > 0)
    {
        result = CGRectInset(result, -1, -1);
    }
    
    return result;
}

- (CGRect)arrowRect:(CGRect)rect arrowDirection:(WYPopoverArrowDirection)aArrowDirection
{
    CGRect result = CGRectZero;
    
    if (arrowHeight > 0)
    {
        result.size = CGSizeMake(arrowBase, arrowHeight);
        
        if (aArrowDirection == WYPopoverArrowDirectionLeft || arrowDirection == WYPopoverArrowDirectionRight)
        {
            result.size = CGSizeMake(arrowHeight, arrowBase);
        }
        
        CGRect outerRect = [self outerRect:rect arrowDirection:aArrowDirection];
        
        if (aArrowDirection == WYPopoverArrowDirectionDown)
        {
            result.origin.x = CGRectGetMidX(outerRect) - result.size.width / 2 + arrowOffset;
            result.origin.y = CGRectGetMaxY(outerRect);
        }
        
        if (aArrowDirection == WYPopoverArrowDirectionUp)
        {
            result.origin.x = CGRectGetMidX(outerRect) - result.size.width / 2 + arrowOffset;
            result.origin.y = CGRectGetMinY(outerRect) - result.size.height;
        }
        
        if (aArrowDirection == WYPopoverArrowDirectionRight)
        {
            result.origin.x = CGRectGetMaxX(outerRect);
            result.origin.y = CGRectGetMidY(outerRect) - result.size.height / 2 + arrowOffset;
        }
        
        if (aArrowDirection == WYPopoverArrowDirectionLeft)
        {
            result.origin.x = CGRectGetMinX(outerRect) - result.size.width;
            result.origin.y = CGRectGetMidY(outerRect) - result.size.height / 2 + arrowOffset;
        }
    }
    
    return result;
}

- (BOOL)isTouchedAtPoint:(CGPoint)point
{
    BOOL result = NO;
    
    CGRect outerRect = [self outerRect];
    CGRect arrowRect = [self arrowRect];
    
    result = (CGRectContainsPoint(outerRect, point) || CGRectContainsPoint(arrowRect, point));
    
    return result;
}

#pragma mark Memory Management

- (void)dealloc
{
    contentView = nil;
    innerView = nil;
    tintColor = nil;
    outerStrokeColor = nil;
    innerStrokeColor = nil;
    fillTopColor = nil;
    fillBottomColor = nil;
    glossShadowColor = nil;
    outerShadowColor = nil;
    innerShadowColor = nil;
}

@end

////////////////////////////////////////////////////////////////////////////

@interface WYPopoverController () <WYPopoverOverlayViewDelegate>
{
    UIViewController        *viewController;
    CGRect                   rect;
    UIView                  *inView;
    WYPopoverOverlayView    *overlayView;
    WYPopoverBackgroundView *containerView;
    WYPopoverArrowDirection  permittedArrowDirections;
    BOOL                     animated;
    BOOL                     isListeningNotifications;
    BOOL                     isInterfaceOrientationChanging;
    __weak UIBarButtonItem  *barButtonItem;
    CGRect                   keyboardRect;
    BOOL                     hasAppearanceProxyAvailable;
    
    WYPopoverAnimationOptions options;
}

//@property (nonatomic, assign, readonly) CGSize contentSizeForViewInPopover;

- (void)dismissPopoverAnimated:(BOOL)animated
                       options:(WYPopoverAnimationOptions)options
                    completion:(void (^)(void))completion
                  callDelegate:(BOOL)callDelegate;

- (WYPopoverArrowDirection)arrowDirectionForRect:(CGRect)aRect
                                          inView:(UIView*)aView
                                     contentSize:(CGSize)contentSize
                                     arrowHeight:(CGFloat)arrowHeight
                        permittedArrowDirections:(WYPopoverArrowDirection)arrowDirections;

- (CGSize)sizeForRect:(CGRect)aRect
               inView:(UIView *)aView
          arrowHeight:(CGFloat)arrowHeight
       arrowDirection:(WYPopoverArrowDirection)arrowDirection;

@end

////////////////////////////////////////////////////////////////////////////

#pragma mark
#pragma mark - WYPopoverController

@implementation WYPopoverController

@synthesize delegate;
@synthesize passthroughViews;
@synthesize wantsDefaultContentAppearance;
@synthesize popoverVisible;
@synthesize popoverLayoutMargins;
@synthesize animationDuration;

- (id)initWithContentViewController:(UIViewController *)aViewController
{
    self = [super init];
    
    if (self)
    {
        viewController = aViewController;
        popoverLayoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
        keyboardRect = CGRectZero;
        animationDuration = WY_POPOVER_DEFAULT_ANIMATION_DURATION;
    }
    
    return self;
}

- (BOOL)isPopoverVisible
{
    BOOL result = (overlayView != nil);
    return result;
}

- (UIViewController *)contentViewController
{
    return viewController;
}

- (CGSize)popoverContentSize
{
    CGSize result = CGSizeZero;
    
    UIViewController *topViewController = viewController;
    
    if ([viewController isKindOfClass:[UINavigationController class]] == YES)
    {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        topViewController = [navigationController topViewController];
    }
    
#ifdef WY_BASE_SDK_7_ENABLED
    if ([topViewController respondsToSelector:@selector(preferredContentSize)])
    {
        result = topViewController.preferredContentSize;
    }
#endif
    
    if (CGSizeEqualToSize(result, CGSizeZero))
    {
#pragma clang diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated"
        result = topViewController.contentSizeForViewInPopover;
#pragma clang diagnostic pop
    }
    
    if (CGSizeEqualToSize(result, CGSizeZero))
    {
        CGSize windowSize = [[UIApplication sharedApplication] keyWindow].bounds.size;
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        result = CGSizeMake(320, UIDeviceOrientationIsLandscape(orientation) ? windowSize.width : windowSize.height);
    }
    
    return result;
}

- (void)setPopoverContentSize:(CGSize)size
{
    UIViewController *topViewController = viewController;
    
    if ([viewController isKindOfClass:[UINavigationController class]] == YES)
    {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        topViewController = [navigationController topViewController];
    }
    
#ifdef WY_BASE_SDK_7_ENABLED
    if ([viewController respondsToSelector:@selector(setPreferredContentSize:)])
    {
        @try {
            [viewController removeObserver:self forKeyPath:NSStringFromSelector(@selector(setPreferredContentSize))];
        }
        @catch (NSException * __unused exception) {}
        
        [topViewController setPreferredContentSize:size];
        
        [viewController addObserver:self forKeyPath:NSStringFromSelector(@selector(preferredContentSize)) options:0 context:nil];
    }
    else
#endif
    {
#pragma clang diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated"
        @try {
            [viewController removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentSizeForViewInPopover))];
        }
        @catch (NSException * __unused exception) {}
        
        [topViewController setContentSizeForViewInPopover:size];
        
        [viewController addObserver:self forKeyPath:NSStringFromSelector(@selector(contentSizeForViewInPopover)) options:0 context:nil];
#pragma clang diagnostic pop
    }
    
    [self positionPopover:NO];
}

- (void)presentPopoverFromRect:(CGRect)aRect
                        inView:(UIView *)aView
      permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                      animated:(BOOL)aAnimated
{
    [self presentPopoverFromRect:aRect
                          inView:aView
        permittedArrowDirections:aArrowDirections
                        animated:aAnimated
                      completion:nil];
}

- (void)presentPopoverFromRect:(CGRect)aRect
                        inView:(UIView *)aView
      permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                      animated:(BOOL)aAnimated
                    completion:(void (^)(void))completion
{
    [self presentPopoverFromRect:aRect
                          inView:aView
        permittedArrowDirections:aArrowDirections
                        animated:aAnimated
                         options:WYPopoverAnimationOptionFade
                      completion:completion];
}

- (void)presentPopoverFromRect:(CGRect)aRect
                        inView:(UIView *)aView
      permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                      animated:(BOOL)aAnimated
                       options:(WYPopoverAnimationOptions)aOptions
{
    [self presentPopoverFromRect:aRect
                          inView:aView
        permittedArrowDirections:aArrowDirections
                        animated:aAnimated
                         options:aOptions
                      completion:nil];
}

- (void)presentPopoverFromRect:(CGRect)aRect
                        inView:(UIView *)aView
      permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                      animated:(BOOL)aAnimated
                       options:(WYPopoverAnimationOptions)aOptions
                    completion:(void (^)(void))completion
{
    NSAssert((aArrowDirections != WYPopoverArrowDirectionUnknown), @"WYPopoverArrowDirection must not be UNKNOWN");
    
    rect = aRect;
    inView = aView;
    permittedArrowDirections = aArrowDirections;
    animated = aAnimated;
    options = aOptions;
    
    CGSize contentViewSize = self.popoverContentSize;
    
    if (overlayView == nil)
    {
        overlayView = [[WYPopoverOverlayView alloc] initWithFrame:inView.window.bounds];
        
        overlayView.delegate = self;
        overlayView.userInteractionEnabled = YES;
        overlayView.passthroughViews = passthroughViews;
        
        containerView = [[WYPopoverBackgroundView alloc] initWithContentSize:contentViewSize];
        containerView.hidden = YES;
        containerView.accessibilityViewIsModal = YES;
        
        [inView.window addSubview:containerView];
        [inView.window insertSubview:overlayView belowSubview:containerView];
    }
    
    if (WY_IS_IOS_LESS_THAN(@"6.0") && hasAppearanceProxyAvailable == NO)
    {
        hasAppearanceProxyAvailable = YES;
        
        WYPopoverBackgroundView *appearance = [WYPopoverBackgroundView appearance];
        
        containerView.tintColor = appearance.tintColor;
        
        containerView.outerStrokeColor = appearance.outerStrokeColor;
        containerView.innerStrokeColor = appearance.innerStrokeColor;
        containerView.fillTopColor = appearance.fillTopColor;
        containerView.fillBottomColor = appearance.fillBottomColor;
        containerView.glossShadowColor = appearance.glossShadowColor;
        containerView.glossShadowOffset = appearance.glossShadowOffset;
        containerView.glossShadowBlurRadius = appearance.glossShadowBlurRadius;
        containerView.borderWidth = appearance.borderWidth;
        containerView.arrowBase = appearance.arrowBase;
        containerView.arrowHeight = appearance.arrowHeight;
        containerView.outerShadowColor = appearance.outerShadowColor;
        containerView.outerShadowBlurRadius = appearance.outerShadowBlurRadius;
        containerView.outerShadowOffset = appearance.outerShadowOffset;
        containerView.outerCornerRadius = appearance.outerCornerRadius;
        containerView.minOuterCornerRadius = appearance.minOuterCornerRadius;
        containerView.innerShadowColor = appearance.innerShadowColor;
        containerView.innerShadowBlurRadius = appearance.innerShadowBlurRadius;
        containerView.innerShadowOffset = appearance.innerShadowOffset;
        containerView.innerCornerRadius = appearance.innerCornerRadius;
        containerView.viewContentInsets = appearance.viewContentInsets;
        overlayView.backgroundColor = appearance.overlayColor;
    }
    else
    {
        overlayView.backgroundColor = containerView.overlayColor;
    }
    
    [self positionPopover:NO];
    
    [self setPopoverNavigationBarBackgroundImage];
    
    __weak __typeof__(self) weakSelf = self;
    
    void (^completionBlock)(BOOL) = ^(BOOL animated) {
        
        __typeof__(self) strongSelf = weakSelf;
        
        if (strongSelf)
        {
            if ([strongSelf->viewController isKindOfClass:[UINavigationController class]] == NO)
            {
                [strongSelf->viewController viewDidAppear:YES];
            }
            
            strongSelf->containerView.accessibilityViewIsModal = NO;
            
            if ([strongSelf->viewController respondsToSelector:@selector(preferredContentSize)])
            {
                [strongSelf->viewController addObserver:self forKeyPath:NSStringFromSelector(@selector(preferredContentSize)) options:0 context:nil];
            }
            else
            {
                [strongSelf->viewController addObserver:self forKeyPath:NSStringFromSelector(@selector(contentSizeForViewInPopover)) options:0 context:nil];
            }
        }
        
        if (completion)
        {
            completion();
        }
        else if (strongSelf && strongSelf->delegate && [strongSelf->delegate respondsToSelector:@selector(popoverControllerDidPresentPopover:)])
        {
            [strongSelf->delegate popoverControllerDidPresentPopover:strongSelf];
        }
        
        
    };
    
#ifdef WY_BASE_SDK_7_ENABLED
    if ([inView.window respondsToSelector:@selector(setTintAdjustmentMode:)]) {
        for (UIView *subview in inView.window.subviews) {
            if (subview != containerView) {
                [subview setTintAdjustmentMode:UIViewTintAdjustmentModeDimmed];
            }
        }
    }
#endif
    
    containerView.hidden = NO;
    
    if (animated)
    {
        if ((options & WYPopoverAnimationOptionFade) == WYPopoverAnimationOptionFade)
        {
            overlayView.alpha = 0;
            containerView.alpha = 0;
        }
        
        [viewController viewWillAppear:YES];
        
        CGAffineTransform endTransform = containerView.transform;
        
        if ((options & WYPopoverAnimationOptionScale) == WYPopoverAnimationOptionScale)
        {
            CGAffineTransform startTransform = [self transformForArrowDirection:containerView.arrowDirection];
            containerView.transform = startTransform;
        }
        
        [UIView animateWithDuration:animationDuration animations:^{
            __typeof__(self) strongSelf = weakSelf;
            
            if (strongSelf)
            {
                strongSelf->overlayView.alpha = 1;
                strongSelf->containerView.alpha = 1;
                strongSelf->containerView.transform = endTransform;
            }
        } completion:^(BOOL finished) {
            completionBlock(YES);
        }];
    }
    else
    {
        [viewController viewWillAppear:NO];
        completionBlock(NO);
    }
    
    if (isListeningNotifications == NO)
    {
        isListeningNotifications = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didChangeStatusBarOrientation:)
                                                     name:UIApplicationDidChangeStatusBarOrientationNotification
                                                   object:nil];
        
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didChangeDeviceOrientation:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification object:nil];
    }
    
    overlayView.isAccessibilityElement = YES;
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)aItem
               permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                               animated:(BOOL)aAnimated
{
    [self presentPopoverFromBarButtonItem:aItem
                 permittedArrowDirections:aArrowDirections
                                 animated:aAnimated
                               completion:nil];
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)aItem
               permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                               animated:(BOOL)aAnimated
                             completion:(void (^)(void))completion
{
    [self presentPopoverFromBarButtonItem:aItem
                 permittedArrowDirections:aArrowDirections
                                 animated:aAnimated
                                  options:WYPopoverAnimationOptionFade
                               completion:completion];
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)aItem
               permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                               animated:(BOOL)aAnimated
                                options:(WYPopoverAnimationOptions)aOptions
{
    [self presentPopoverFromBarButtonItem:aItem
                 permittedArrowDirections:aArrowDirections
                                 animated:aAnimated
                                  options:aOptions
                               completion:nil];
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)aItem
               permittedArrowDirections:(WYPopoverArrowDirection)aArrowDirections
                               animated:(BOOL)aAnimated
                                options:(WYPopoverAnimationOptions)aOptions
                             completion:(void (^)(void))completion
{
    barButtonItem = aItem;
    UIView *itemView = [barButtonItem valueForKey:@"view"];
    aArrowDirections = WYPopoverArrowDirectionDown | WYPopoverArrowDirectionUp;
    [self presentPopoverFromRect:itemView.bounds
                          inView:itemView
        permittedArrowDirections:aArrowDirections
                        animated:aAnimated
                         options:aOptions
                      completion:completion];
}

- (void)presentPopoverAsDialogAnimated:(BOOL)aAnimated
{
    [self presentPopoverAsDialogAnimated:aAnimated
                              completion:nil];
}

- (void)presentPopoverAsDialogAnimated:(BOOL)aAnimated
                            completion:(void (^)(void))completion
{
    [self presentPopoverAsDialogAnimated:aAnimated
                                 options:WYPopoverAnimationOptionFade
                              completion:completion];
}

- (void)presentPopoverAsDialogAnimated:(BOOL)aAnimated
                               options:(WYPopoverAnimationOptions)aOptions
{
    [self presentPopoverAsDialogAnimated:aAnimated
                                 options:aOptions
                              completion:nil];
}

- (void)presentPopoverAsDialogAnimated:(BOOL)aAnimated
                               options:(WYPopoverAnimationOptions)aOptions
                            completion:(void (^)(void))completion
{
    [self presentPopoverFromRect:CGRectZero
                          inView:nil
        permittedArrowDirections:WYPopoverArrowDirectionNone
                        animated:aAnimated
                         options:aOptions
                      completion:completion];
}

- (CGAffineTransform)transformForArrowDirection:(WYPopoverArrowDirection)arrowDirection
{
    CGAffineTransform transform = containerView.transform;
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];

    CGSize containerViewSize = containerView.frame.size;
    
    if (containerView.arrowHeight > 0)
    {
        if (UIDeviceOrientationIsLandscape(orientation)) {
            containerViewSize.width = containerView.frame.size.height;
            containerViewSize.height = containerView.frame.size.width;
        }
        
        //WY_LOG(@"containerView.arrowOffset = %f", containerView.arrowOffset);
        //WY_LOG(@"containerViewSize = %@", NSStringFromCGSize(containerViewSize));
        //WY_LOG(@"orientation = %@", WYStringFromOrientation(orientation));
        
        if (arrowDirection == WYPopoverArrowDirectionDown)
        {
            transform = CGAffineTransformTranslate(transform, containerView.arrowOffset, containerViewSize.height / 2);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionUp)
        {
            transform = CGAffineTransformTranslate(transform, containerView.arrowOffset, -containerViewSize.height / 2);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionRight)
        {
            transform = CGAffineTransformTranslate(transform, containerViewSize.width / 2, containerView.arrowOffset);
        }
        
        if (arrowDirection == WYPopoverArrowDirectionLeft)
        {
            transform = CGAffineTransformTranslate(transform, -containerViewSize.width / 2, containerView.arrowOffset);
        }
    }
    
    transform = CGAffineTransformScale(transform, 0.01, 0.01);
    
    return transform;
}

- (void)setPopoverNavigationBarBackgroundImage
{
    if ([viewController isKindOfClass:[UINavigationController class]] == YES)
    {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        navigationController.embedInPopover = YES;
        
#ifdef WY_BASE_SDK_7_ENABLED
        if ([navigationController respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            UIViewController *topViewController = [navigationController topViewController];
            [topViewController setEdgesForExtendedLayout:UIRectEdgeNone];
        }
#endif
        
        if (wantsDefaultContentAppearance == NO)
        {
            [navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    viewController.view.clipsToBounds = YES;
    
    if (containerView.borderWidth == 0)
    {
        viewController.view.layer.cornerRadius = containerView.outerCornerRadius;
    }
}

- (void)positionPopover:(BOOL)aAnimated
{
    CGRect savedContainerFrame = containerView.frame;
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGSize contentViewSize = self.popoverContentSize;
    CGSize minContainerSize = WY_POPOVER_MIN_SIZE;
    
    CGRect viewFrame;
    CGRect containerFrame = CGRectZero;
    CGFloat minX, maxX, minY, maxY, offset = 0;
    CGSize containerViewSize = CGSizeZero;
    
    CGFloat overlayWidth = UIInterfaceOrientationIsPortrait(orientation) ? overlayView.bounds.size.width : overlayView.bounds.size.height;
    CGFloat overlayHeight = UIInterfaceOrientationIsPortrait(orientation) ? overlayView.bounds.size.height : overlayView.bounds.size.width;
    
    WYPopoverArrowDirection arrowDirection = permittedArrowDirections;
    
    overlayView.bounds = inView.window.bounds;
    containerView.transform = CGAffineTransformIdentity;
    
    viewFrame = [inView convertRect:rect toView:nil];
    
    viewFrame = WYRectInWindowBounds(viewFrame, orientation);
    
    minX = popoverLayoutMargins.left;
    maxX = overlayWidth - popoverLayoutMargins.right;
    minY = WYStatusBarHeight() + popoverLayoutMargins.top;
    maxY = overlayHeight - popoverLayoutMargins.bottom;
    
    // Which direction ?
    //
    arrowDirection = [self arrowDirectionForRect:rect
                                          inView:inView
                                     contentSize:contentViewSize
                                     arrowHeight:containerView.arrowHeight
                        permittedArrowDirections:arrowDirection];
    
    // Position of the popover
    //
    CGFloat keyboardHeight = UIInterfaceOrientationIsPortrait(orientation) ? keyboardRect.size.height : keyboardRect.size.width;
    
    minX -= containerView.outerShadowInsets.left;
    maxX += containerView.outerShadowInsets.right;
    minY -= containerView.outerShadowInsets.top;
    maxY += containerView.outerShadowInsets.bottom - keyboardHeight;
    
    if (arrowDirection == WYPopoverArrowDirectionDown)
    {
        containerView.arrowDirection = WYPopoverArrowDirectionDown;
        containerViewSize = [containerView sizeThatFits:contentViewSize];
        
        containerFrame = CGRectZero;
        containerFrame.size = containerViewSize;
        containerFrame.size.width = MIN(maxX - minX, containerFrame.size.width);
        containerFrame.size.height = MIN(maxY - minY, containerFrame.size.height);
        
        containerView.frame = CGRectIntegral(containerFrame);
        
        containerView.center = CGPointMake(viewFrame.origin.x + viewFrame.size.width / 2, viewFrame.origin.y + viewFrame.size.height / 2);
        
        containerFrame = containerView.frame;
        
        offset = 0;
        
        if (containerFrame.origin.x < minX)
        {
            offset = minX - containerFrame.origin.x;
            containerFrame.origin.x = minX;
            offset = -offset;
        }
        else if (containerFrame.origin.x + containerFrame.size.width > maxX)
        {
            offset = (containerView.frame.origin.x + containerView.frame.size.width) - maxX;
            containerFrame.origin.x -= offset;
        }
        
        containerView.arrowOffset = offset;
        offset = containerView.frame.size.height / 2 + viewFrame.size.height / 2 - containerView.outerShadowInsets.bottom;
        
        containerFrame.origin.y -= offset;
        
        if (containerFrame.origin.y < minY)
        {
            offset = minY - containerFrame.origin.y;
            containerFrame.size.height -= offset;
            
            if (containerFrame.size.height < minContainerSize.height)
            {
                // popover is overflowing
                offset -= (minContainerSize.height - containerFrame.size.height);
                containerFrame.size.height = minContainerSize.height;
            }
            
            containerFrame.origin.y += offset;
        }
    }
    
    if (arrowDirection == WYPopoverArrowDirectionUp)
    {
        containerView.arrowDirection = WYPopoverArrowDirectionUp;
        containerViewSize = [containerView sizeThatFits:contentViewSize];
        
        containerFrame = CGRectZero;
        containerFrame.size = containerViewSize;
        containerFrame.size.width = MIN(maxX - minX, containerFrame.size.width);
        containerFrame.size.height = MIN(maxY - minY, containerFrame.size.height);
        
        containerView.frame = containerFrame;
        
        containerView.center = CGPointMake(viewFrame.origin.x + viewFrame.size.width / 2, viewFrame.origin.y + viewFrame.size.height / 2);
        
        containerFrame = containerView.frame;
        
        offset = 0;
        
        if (containerFrame.origin.x < minX)
        {
            offset = minX - containerFrame.origin.x;
            containerFrame.origin.x = minX;
            offset = -offset;
        }
        else if (containerFrame.origin.x + containerFrame.size.width > maxX)
        {
            offset = (containerView.frame.origin.x + containerView.frame.size.width) - maxX;
            containerFrame.origin.x -= offset;
        }
        
        containerView.arrowOffset = offset;
        offset = containerView.frame.size.height / 2 + viewFrame.size.height / 2 - containerView.outerShadowInsets.top;
        
        containerFrame.origin.y += offset;
        
        if (containerFrame.origin.y + containerFrame.size.height > maxY)
        {
            offset = (containerFrame.origin.y + containerFrame.size.height) - maxY;
            containerFrame.size.height -= offset;
            
            if (containerFrame.size.height < minContainerSize.height)
            {
                // popover is overflowing
                containerFrame.size.height = minContainerSize.height;
            }
        }
    }
    
    if (arrowDirection == WYPopoverArrowDirectionRight)
    {
        containerView.arrowDirection = WYPopoverArrowDirectionRight;
        containerViewSize = [containerView sizeThatFits:contentViewSize];
        
        containerFrame = CGRectZero;
        containerFrame.size = containerViewSize;
        containerFrame.size.width = MIN(maxX - minX, containerFrame.size.width);
        containerFrame.size.height = MIN(maxY - minY, containerFrame.size.height);
        
        containerView.frame = CGRectIntegral(containerFrame);
        
        containerView.center = CGPointMake(viewFrame.origin.x + viewFrame.size.width / 2, viewFrame.origin.y + viewFrame.size.height / 2);
        
        containerFrame = containerView.frame;
        
        offset = containerView.frame.size.width / 2 + viewFrame.size.width / 2 - containerView.outerShadowInsets.right;
        
        containerFrame.origin.x -= offset;
        
        if (containerFrame.origin.x < minX)
        {
            offset = minX - containerFrame.origin.x;
            containerFrame.size.width -= offset;
            
            if (containerFrame.size.width < minContainerSize.width)
            {
                // popover is overflowing
                offset -= (minContainerSize.width - containerFrame.size.width);
                containerFrame.size.width = minContainerSize.width;
            }
            
            containerFrame.origin.x += offset;
        }
        
        offset = 0;
        
        if (containerFrame.origin.y < minY)
        {
            offset = minY - containerFrame.origin.y;
            containerFrame.origin.y = minY;
            offset = -offset;
        }
        else if (containerFrame.origin.y + containerFrame.size.height > maxY)
        {
            offset = (containerView.frame.origin.y + containerView.frame.size.height) - maxY;
            containerFrame.origin.y -= offset;
        }
        
        containerView.arrowOffset = offset;
    }
    
    if (arrowDirection == WYPopoverArrowDirectionLeft)
    {
        containerView.arrowDirection = WYPopoverArrowDirectionLeft;
        containerViewSize = [containerView sizeThatFits:contentViewSize];
        
        containerFrame = CGRectZero;
        containerFrame.size = containerViewSize;
        containerFrame.size.width = MIN(maxX - minX, containerFrame.size.width);
        containerFrame.size.height = MIN(maxY - minY, containerFrame.size.height);
        containerView.frame = containerFrame;
        
        containerView.center = CGPointMake(viewFrame.origin.x + viewFrame.size.width / 2, viewFrame.origin.y + viewFrame.size.height / 2);
        
        containerFrame = CGRectIntegral(containerView.frame);
        
        offset = containerView.frame.size.width / 2 + viewFrame.size.width / 2 - containerView.outerShadowInsets.left;
        
        containerFrame.origin.x += offset;
        
        if (containerFrame.origin.x + containerFrame.size.width > maxX)
        {
            offset = (containerFrame.origin.x + containerFrame.size.width) - maxX;
            containerFrame.size.width -= offset;
            
            if (containerFrame.size.width < minContainerSize.width)
            {
                // popover is overflowing
                containerFrame.size.width = minContainerSize.width;
            }
        }
        
        offset = 0;
        
        if (containerFrame.origin.y < minY)
        {
            offset = minY - containerFrame.origin.y;
            containerFrame.origin.y = minY;
            offset = -offset;
        }
        else if (containerFrame.origin.y + containerFrame.size.height > maxY)
        {
            offset = (containerView.frame.origin.y + containerView.frame.size.height) - maxY;
            containerFrame.origin.y -= offset;
        }
        
        containerView.arrowOffset = offset;
    }
    
    if (arrowDirection == WYPopoverArrowDirectionNone)
    {
        containerView.arrowDirection = WYPopoverArrowDirectionNone;
        containerViewSize = [containerView sizeThatFits:contentViewSize];
        
        containerFrame = CGRectZero;
        containerFrame.size = containerViewSize;
        containerFrame.size.width = MIN(maxX - minX, containerFrame.size.width);
        containerFrame.size.height = MIN(maxY - minY, containerFrame.size.height);
        containerView.frame = CGRectIntegral(containerFrame);
        
        containerView.center = CGPointMake(minX + (maxX - minX) / 2, minY + (maxY - minY) / 2);
        
        containerFrame = containerView.frame;
        
        containerView.arrowOffset = offset;
    }
    
    containerFrame = CGRectIntegral(containerFrame);
    
    containerView.frame = containerFrame;
    
    containerView.wantsDefaultContentAppearance = wantsDefaultContentAppearance;
    
    [containerView setViewController:viewController];
    
    // keyboard support
    //
    if (keyboardHeight > 0) {
        
        CGFloat keyboardY = UIInterfaceOrientationIsPortrait(orientation) ? keyboardRect.origin.y : keyboardRect.origin.x;
        
        if (containerFrame.origin.y + containerFrame.size.height > keyboardY) {
            
            containerFrame.origin.y -= (containerFrame.origin.y + containerFrame.size.height - keyboardY);
            
            if (containerFrame.origin.y < minY) {
                containerFrame.origin.y = minY;
            }
        }
    }
    
    CGPoint containerOrigin = containerFrame.origin;
    
    containerView.transform = CGAffineTransformMakeRotation(WYInterfaceOrientationAngleOfOrientation(orientation));
    
    containerFrame = containerView.frame;
    
    containerFrame.origin = WYPointRelativeToOrientation(containerOrigin, containerFrame.size, orientation);

    if (aAnimated == YES) {
        containerView.frame = savedContainerFrame;
        __weak __typeof__(self) weakSelf = self;
        [UIView animateWithDuration:0.10f animations:^{
            __typeof__(self) strongSelf = weakSelf;
            strongSelf->containerView.frame = containerFrame;
        }];
    } else {
        containerView.frame = containerFrame;
    }
    
    WY_LOG(@"popoverContainerView.frame = %@", NSStringFromCGRect(containerView.frame));
}

- (void)dismissPopoverAnimated:(BOOL)aAnimated
{
    [self dismissPopoverAnimated:aAnimated
                         options:options
                      completion:nil];
}

- (void)dismissPopoverAnimated:(BOOL)aAnimated
                    completion:(void (^)(void))completion
{
    [self dismissPopoverAnimated:aAnimated
                         options:options
                      completion:completion];
}

- (void)dismissPopoverAnimated:(BOOL)aAnimated
                       options:(WYPopoverAnimationOptions)aOptions
{
    [self dismissPopoverAnimated:aAnimated
                         options:aOptions
                      completion:nil];
}

- (void)dismissPopoverAnimated:(BOOL)aAnimated
                       options:(WYPopoverAnimationOptions)aOptions
                    completion:(void (^)(void))completion
{
    [self dismissPopoverAnimated:aAnimated
                         options:aOptions
                      completion:completion
                    callDelegate:NO];
}

- (void)dismissPopoverAnimated:(BOOL)aAnimated
                       options:(WYPopoverAnimationOptions)aOptions
                    completion:(void (^)(void))completion
                  callDelegate:(BOOL)callDelegate
{
    CGFloat duration = self.animationDuration;
    WYPopoverAnimationOptions style = aOptions;
    
    __weak __typeof__(self) weakSelf = self;
    
    void (^afterCompletionBlock)() = ^() {
        
#ifdef WY_BASE_SDK_7_ENABLED
        if ([inView.window respondsToSelector:@selector(setTintAdjustmentMode:)]) {
            for (UIView *subview in inView.window.subviews) {
                if (subview != containerView) {
                    [subview setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];
                }
            }
        }
#endif
        
        __typeof__(self) strongSelf = weakSelf;
        
        if (strongSelf)
        {
            strongSelf->containerView = nil;
            
            [strongSelf->overlayView removeFromSuperview];
            strongSelf->overlayView = nil;
            
            if ([strongSelf->viewController isKindOfClass:[UINavigationController class]] == NO)
            {
                [strongSelf->viewController viewDidDisappear:aAnimated];
            }
            
            if (completion)
            {
                completion();
            }
            else if (callDelegate)
            {
                if (strongSelf->delegate && [strongSelf->delegate respondsToSelector:@selector(popoverControllerDidDismissPopover:)])
                {
                    [strongSelf->delegate popoverControllerDidDismissPopover:strongSelf];
                }
            }
        }
    };
    
    void (^completionBlock)() = ^() {
        
        __typeof__(self) strongSelf = weakSelf;
        [strongSelf->containerView removeFromSuperview];
        
        if (aAnimated)
        {
            [UIView animateWithDuration:duration animations:^{
                __typeof__(self) strongSelf = weakSelf;
                
                if (strongSelf)
                {
                    strongSelf->overlayView.alpha = 0;
                }
            } completion:^(BOOL finished) {
                afterCompletionBlock();
            }];
        }
        else
        {
            afterCompletionBlock();
        }
    };
    
    if (isListeningNotifications == YES)
    {
        isListeningNotifications = NO;
        
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIApplicationDidChangeStatusBarOrientationNotification
                                                      object:nil];
        
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIDeviceOrientationDidChangeNotification
                                                      object:nil];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIKeyboardWillShowNotification
                                                      object:nil];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIKeyboardWillHideNotification
                                                      object:nil];
    }
    
    if ([viewController isKindOfClass:[UINavigationController class]] == NO)
    {
        [viewController viewWillDisappear:aAnimated];
    }
    
    @try {
        if ([viewController respondsToSelector:@selector(preferredContentSize)]) {
            [viewController removeObserver:self forKeyPath:NSStringFromSelector(@selector(preferredContentSize))];
        } else {
            [viewController removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentSizeForViewInPopover))];
        }
    }
    @catch (NSException * __unused exception) {}
    
    if (aAnimated)
    {
        [UIView animateWithDuration:duration animations:^{
            __typeof__(self) strongSelf = weakSelf;
            
            if (strongSelf)
            {
                if ((style & WYPopoverAnimationOptionFade) == WYPopoverAnimationOptionFade)
                {
                    strongSelf->containerView.alpha = 0;
                }
                
                if ((style & WYPopoverAnimationOptionScale) == WYPopoverAnimationOptionScale)
                {
                    CGAffineTransform endTransform = [self transformForArrowDirection:strongSelf->containerView.arrowDirection];
                    strongSelf->containerView.transform = endTransform;
                }
            }
        } completion:^(BOOL finished) {
            completionBlock();
        }];
    }
    else
    {
        completionBlock();
    }
    
    overlayView.isAccessibilityElement = NO;
}

#pragma mark KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == viewController)
    {
        if ([keyPath isEqualToString:NSStringFromSelector(@selector(preferredContentSize))]
            || [keyPath isEqualToString:NSStringFromSelector(@selector(contentSizeForViewInPopover))])
        {
            [self positionPopover:YES];
        }
    }
}

#pragma mark WYPopoverOverlayViewDelegate

- (void)popoverOverlayView:(WYPopoverOverlayView *)aOverlayView didTouchAtPoint:(CGPoint)aPoint
{
    BOOL isTouched = [containerView isTouchedAtPoint:[containerView convertPoint:aPoint fromView:aOverlayView]];
    
    if (!isTouched)
    {
        BOOL shouldDismiss = !viewController.modalInPopover;
        
        if (shouldDismiss && delegate && [delegate respondsToSelector:@selector(popoverControllerShouldDismissPopover:)])
        {
            shouldDismiss = [delegate popoverControllerShouldDismissPopover:self];
        }
        
        if (shouldDismiss)
        {
            [self dismissPopoverAnimated:animated options:options completion:nil callDelegate:YES];
        }
    }
}

#pragma mark Private

- (WYPopoverArrowDirection)arrowDirectionForRect:(CGRect)aRect
                                          inView:(UIView *)aView
                                     contentSize:(CGSize)contentSize
                                     arrowHeight:(CGFloat)arrowHeight
                        permittedArrowDirections:(WYPopoverArrowDirection)arrowDirections
{
    WYPopoverArrowDirection arrowDirection = WYPopoverArrowDirectionUnknown;
    
    NSMutableArray *areas = [NSMutableArray arrayWithCapacity:0];
    WYPopoverArea *area;
    
    if ((arrowDirections & WYPopoverArrowDirectionDown) == WYPopoverArrowDirectionDown)
    {
        area = [[WYPopoverArea alloc] init];
        area.areaSize = [self sizeForRect:aRect inView:aView arrowHeight:arrowHeight arrowDirection:WYPopoverArrowDirectionDown];
        area.arrowDirection = WYPopoverArrowDirectionDown;
        [areas addObject:area];
    }
    
    if ((arrowDirections & WYPopoverArrowDirectionUp) == WYPopoverArrowDirectionUp)
    {
        area = [[WYPopoverArea alloc] init];
        area.areaSize = [self sizeForRect:aRect inView:aView arrowHeight:arrowHeight arrowDirection:WYPopoverArrowDirectionUp];
        area.arrowDirection = WYPopoverArrowDirectionUp;
        [areas addObject:area];
    }
    
    if ((arrowDirections & WYPopoverArrowDirectionLeft) == WYPopoverArrowDirectionLeft)
    {
        area = [[WYPopoverArea alloc] init];
        area.areaSize = [self sizeForRect:aRect inView:aView arrowHeight:arrowHeight arrowDirection:WYPopoverArrowDirectionLeft];
        area.arrowDirection = WYPopoverArrowDirectionLeft;
        [areas addObject:area];
    }
    
    if ((arrowDirections & WYPopoverArrowDirectionRight) == WYPopoverArrowDirectionRight)
    {
        area = [[WYPopoverArea alloc] init];
        area.areaSize = [self sizeForRect:aRect inView:aView arrowHeight:arrowHeight arrowDirection:WYPopoverArrowDirectionRight];
        area.arrowDirection = WYPopoverArrowDirectionRight;
        [areas addObject:area];
    }
    
    if ((arrowDirections & WYPopoverArrowDirectionNone) == WYPopoverArrowDirectionNone)
    {
        area = [[WYPopoverArea alloc] init];
        area.areaSize = [self sizeForRect:aRect inView:aView arrowHeight:arrowHeight arrowDirection:WYPopoverArrowDirectionNone];
        area.arrowDirection = WYPopoverArrowDirectionNone;
        [areas addObject:area];
    }
    
    if ([areas count] > 1)
    {
        NSIndexSet* indexes = [areas indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            WYPopoverArea* popoverArea = (WYPopoverArea*)obj;
            
            BOOL result = (popoverArea.areaSize.width > 0 && popoverArea.areaSize.height > 0);
            
            return result;
        }];
        
        areas = [NSMutableArray arrayWithArray:[areas objectsAtIndexes:indexes]];
    }
    
    [areas sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        WYPopoverArea *area1 = (WYPopoverArea *)obj1;
        WYPopoverArea *area2 = (WYPopoverArea *)obj2;
        
        CGFloat val1 = area1.value;
        CGFloat val2 = area2.value;
        
        NSComparisonResult result = NSOrderedSame;
        
        if (val1 > val2)
        {
            result = NSOrderedAscending;
        }
        else if (val1 < val2)
        {
            result = NSOrderedDescending;
        }
        
        return result;
    }];
    
    for (NSUInteger i = 0; i < [areas count]; i++)
    {
        WYPopoverArea *popoverArea = (WYPopoverArea *)[areas objectAtIndex:i];
        
        if (popoverArea.areaSize.width >= contentSize.width)
        {
            arrowDirection = popoverArea.arrowDirection;
            break;
        }
    }
    
    if (arrowDirection == WYPopoverArrowDirectionUnknown)
    {
        if ([areas count] > 0)
        {
            arrowDirection = ((WYPopoverArea *)[areas objectAtIndex:0]).arrowDirection;
        }
        else
        {
            if ((arrowDirections & WYPopoverArrowDirectionDown) == WYPopoverArrowDirectionDown)
            {
                arrowDirection = WYPopoverArrowDirectionDown;
            }
            else if ((arrowDirections & WYPopoverArrowDirectionUp) == WYPopoverArrowDirectionUp)
            {
                arrowDirection = WYPopoverArrowDirectionUp;
            }
            else if ((arrowDirections & WYPopoverArrowDirectionLeft) == WYPopoverArrowDirectionLeft)
            {
                arrowDirection = WYPopoverArrowDirectionLeft;
            }
            else
            {
                arrowDirection = WYPopoverArrowDirectionRight;
            }
        }
    }
    
    return arrowDirection;
}

- (CGSize)sizeForRect:(CGRect)aRect
               inView:(UIView *)aView
          arrowHeight:(CGFloat)arrowHeight
       arrowDirection:(WYPopoverArrowDirection)arrowDirection
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGRect viewFrame = [aView convertRect:aRect toView:nil];
    viewFrame = WYRectInWindowBounds(viewFrame, orientation);
    
    CGFloat minX, maxX, minY, maxY = 0;
    
    CGFloat keyboardHeight = UIInterfaceOrientationIsPortrait(orientation) ? keyboardRect.size.height : keyboardRect.size.width;
    
    CGFloat overlayWidth = UIInterfaceOrientationIsPortrait(orientation) ? overlayView.bounds.size.width : overlayView.bounds.size.height;
    
    CGFloat overlayHeight = UIInterfaceOrientationIsPortrait(orientation) ? overlayView.bounds.size.height : overlayView.bounds.size.width;
    
    minX = popoverLayoutMargins.left;
    maxX = overlayWidth - popoverLayoutMargins.right;
    minY = WYStatusBarHeight() + popoverLayoutMargins.top;
    maxY = overlayHeight - popoverLayoutMargins.bottom - keyboardHeight;
    
    CGSize result = CGSizeZero;
    
    if (arrowDirection == WYPopoverArrowDirectionLeft)
    {
        result.width = maxX - (viewFrame.origin.x + viewFrame.size.width);
        result.width -= arrowHeight;
        result.height = maxY - minY;
    }
    else if (arrowDirection == WYPopoverArrowDirectionRight)
    {
        result.width = viewFrame.origin.x - minX;
        result.width -= arrowHeight;
        result.height = maxY - minY;
    }
    else if (arrowDirection == WYPopoverArrowDirectionDown)
    {
        result.width = maxX - minX;
        result.height = viewFrame.origin.y - minY;
        result.height -= arrowHeight;
    }
    else if (arrowDirection == WYPopoverArrowDirectionUp)
    {
        result.width = maxX - minX;
        result.height = maxY - (viewFrame.origin.y + viewFrame.size.height);
        result.height -= arrowHeight;
    }
    else if (arrowDirection == WYPopoverArrowDirectionNone)
    {
        result.width = maxX - minX;
        result.height = maxY - minY;
    }
    
    return result;
}

#pragma mark Inline functions

static NSString* WYStringFromOrientation(NSInteger orientation) {
    NSString *result = @"Unknown";
    
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            result = @"Portrait";
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            result = @"Portrait UpsideDown";
            break;
        case UIInterfaceOrientationLandscapeLeft:
            result = @"Landscape Left";
            break;
        case UIInterfaceOrientationLandscapeRight:
            result = @"Landscape Right";
            break;
        default:
            break;
    }
    
    return result;
}

static CGFloat WYStatusBarHeight() {
    UIInterfaceOrientation orienation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGFloat statusBarHeight = 0;
    {
        CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
        statusBarHeight = statusBarFrame.size.height;
        
        if (UIDeviceOrientationIsLandscape(orienation))
        {
            statusBarHeight = statusBarFrame.size.width;
        }
    }
    
    return statusBarHeight;
}

static CGFloat WYInterfaceOrientationAngleOfOrientation(UIInterfaceOrientation orientation)
{
    CGFloat angle;
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortraitUpsideDown:
            angle = M_PI;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            angle = -M_PI_2;
            break;
        case UIInterfaceOrientationLandscapeRight:
            angle = M_PI_2;
            break;
        default:
            angle = 0.0;
            break;
    }
    
    return angle;
}

static CGRect WYRectInWindowBounds(CGRect rect, UIInterfaceOrientation orientation) {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    CGFloat windowWidth = keyWindow.bounds.size.width;
    CGFloat windowHeight = keyWindow.bounds.size.height;
    
    CGRect result = rect;
    
    if (orientation == UIInterfaceOrientationLandscapeRight) {
        
        result.origin.x = rect.origin.y;
        result.origin.y = windowWidth - rect.origin.x - rect.size.width;
        result.size.width = rect.size.height;
        result.size.height = rect.size.width;
    }
    
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        
        result.origin.x = windowHeight - rect.origin.y - rect.size.height;
        result.origin.y = rect.origin.x;
        result.size.width = rect.size.height;
        result.size.height = rect.size.width;
    }
    
    if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        result.origin.x = windowWidth - rect.origin.x - rect.size.width;
        result.origin.y = windowHeight - rect.origin.y - rect.size.height;
    }
    
    return result;
}

static CGPoint WYPointRelativeToOrientation(CGPoint origin, CGSize size, UIInterfaceOrientation orientation) {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    CGFloat windowWidth = keyWindow.bounds.size.width;
    CGFloat windowHeight = keyWindow.bounds.size.height;
    
    CGPoint result = origin;
    
    if (orientation == UIInterfaceOrientationLandscapeRight) {
        result.x = windowWidth - origin.y - size.width;
        result.y = origin.x;
    }
    
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        result.x = origin.y;
        result.y = windowHeight - origin.x - size.height;
    }
    
    if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        result.x = windowWidth - origin.x - size.width;
        result.y = windowHeight - origin.y - size.height;
    }
    
    return result;
}

#pragma mark Selectors

- (void)didChangeStatusBarOrientation:(NSNotification *)notification
{
    isInterfaceOrientationChanging = YES;
}

- (void)didChangeDeviceOrientation:(NSNotification *)notification
{
    if (isInterfaceOrientationChanging == NO) return;
    
    isInterfaceOrientationChanging = NO;
    
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController* navigationController = (UINavigationController*)viewController;
        
        if (navigationController.navigationBarHidden == NO)
        {
            navigationController.navigationBarHidden = YES;
            navigationController.navigationBarHidden = NO;
        }
    }
    
    if (barButtonItem)
    {
        inView = [barButtonItem valueForKey:@"view"];
        rect = inView.bounds;
    }
    else if ([delegate respondsToSelector:@selector(popoverController:willRepositionPopoverToRect:inView:)])
    {
        CGRect anotherRect;
        UIView *anotherInView;
        
        [delegate popoverController:self willRepositionPopoverToRect:&anotherRect inView:&anotherInView];
        
        if (&anotherRect != NULL)
        {
            rect = anotherRect;
        }
        
        if (&anotherInView != NULL)
        {
            inView = anotherInView;
        }
    }
    
    [self positionPopover:NO];
    //[containerView setNeedsDisplay];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    keyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    WY_LOG(@"orientation = %@", WYStringFromOrientation(orientation));
    WY_LOG(@"keyboardRect = %@", NSStringFromCGRect(keyboardRect));
    
    [self positionPopover:YES];
    //[containerView setNeedsDisplay];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    keyboardRect = CGRectZero;
    [self positionPopover:YES];
    //[containerView setNeedsDisplay];
}

#pragma mark Memory management

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [containerView removeFromSuperview];
    [overlayView removeFromSuperview];
    [overlayView setDelegate:nil];
    
    barButtonItem = nil;
    passthroughViews = nil;
    viewController = nil;
    inView = nil;
    overlayView = nil;
    containerView = nil;
}

@end
