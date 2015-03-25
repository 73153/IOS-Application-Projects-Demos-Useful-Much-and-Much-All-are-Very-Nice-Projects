//
// SKTogglesControl.m
// SKTogglesControl
//
//
// Adapted by Barry Allard on 2013-06-13
// Copyright 2013 Barry Allard. All rights reserved.
//
// https://github.com/steakknife/SKTogglesControl
//
//
// Originally Created by Sam Vermette on 26.10.10.
// Copyright 2010 Sam Vermette. All rights reserved.
//
// Original project https://github.com/samvermette/SKTogglesControl
//

#import <QuartzCore/QuartzCore.h>
#import "SKTogglesControl.h"

@interface SKTogglesThumb ()

@property (nonatomic, assign) UIFont *font;

@property (nonatomic, readonly) UILabel *label;
@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) NSUInteger titlesCount;



- (void)setTitle:(NSString*)title image:(UIImage*)image;

- (void)activate;
- (void)deactivate;

@end



@interface SKTogglesControl()

- (void)activate:(NSUInteger)index;
- (void)deactivate:(NSUInteger)index;
- (void)setupThumbs;
- (void)setupAccessibility;

@property (nonatomic, strong) SKTogglesThumb *thumbPrototype;
@property (nonatomic, strong) NSMutableArray *thumbs;
@property (nonatomic, strong) NSMutableArray *accessibilityElements;
@property (nonatomic, readwrite) CGFloat segmentWidth;
@property (nonatomic, readwrite) CGFloat thumbHeight;
@property (nonatomic, strong, readonly) NSObject *y;
@property (nonatomic, strong, readonly) NSObject *n;

@end


@implementation SKTogglesControl
@synthesize y = _y;
@synthesize n = _n;

- (id)y
{
    if (nil == _y) {
        _y = [[NSNumber alloc] initWithBool:YES];
    }
    return _y;
}

- (id)n
{
    if (nil == _n) {
        _n = [[NSNumber alloc] initWithBool:NO];
    }
    return _n;
}

#pragma mark - Life Cycle

- (SKTogglesThumb*)thumbPrototype
{
    if (nil == _thumbPrototype)
    {
        _thumbPrototype = [[SKTogglesThumb alloc] initWithFrame:CGRectZero];
        _thumbPrototype.hidden = YES;
    }
    return _thumbPrototype;
}

- (NSUInteger)titlesCount
{
    return [self.sectionTitles count];
}

- (SKTogglesThumb*)copyThumbPrototype
{
    SKTogglesThumb *newObject = [[SKTogglesThumb alloc] initWithFrame:CGRectZero];
    
    newObject.tintColor        = self.thumbPrototype.tintColor;
    newObject.textColor        = self.thumbPrototype.textColor;
    newObject.textShadowColor  = self.thumbPrototype.textShadowColor;
    newObject.textShadowOffset = self.thumbPrototype.textShadowOffset;
    newObject.font             = self.thumbPrototype.font;
    newObject.backgroundColor  = self.thumbPrototype.backgroundColor;
    newObject.backgroundImage  = self.thumbPrototype.backgroundImage;
    
    return newObject;

  //  NSData *thumbPrototypeEncoded = [NSKeyedArchiver archivedDataWithRootObject:self.thumbPrototype];
  //  return [NSKeyedUnarchiver unarchiveObjectWithData:thumbPrototypeEncoded];
}

- (id)initWithSectionTitles:(NSArray*)array {
    self = [super initWithFrame:CGRectZero];
    
	if (self) {
        self.sectionTitles = [array copy];
        self.accessibilityElements = [[NSMutableArray alloc] initWithCapacity:self.sectionTitles.count];
        self.thumbs = [[NSMutableArray alloc] initWithCapacity:self.sectionTitles.count];
        self.backgroundColor = [UIColor clearColor];
        self.backgroundTintColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        self.animateToInitialSelection = NO;
        
        self.font = [UIFont boldSystemFontOfSize:15];
        self.textColor = [UIColor grayColor];
        self.textShadowColor = [UIColor blackColor];
        self.textShadowOffset = CGSizeMake(0, -1);
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        self.thumbEdgeInset = UIEdgeInsetsMake(2, 2, 3, 2);
        self.height = 32.0;
        self.cornerRadius = 4.0;
        
        self.innerShadowColor = [UIColor colorWithWhite:0 alpha:0.8];
        
        [self setupThumbs];
        [self setupAccessibility];
    }
    
	return self;
}

- (void)sizeToFit
{
    self.frame = CGRectZero;
    [self updateSectionRects];
}

- (void)getAllToArray:(NSMutableArray *)array
{
    [array removeAllObjects];
    for (NSUInteger index = 0; index < self.titlesCount; ++index) {
        [array addObject: [self isSetIndex:index] ? self.y : self.n];
    }
}

- (void)setAllFromArray:(NSArray *)array
{
    [self setAllFromArray:array animated:self.animated];
}

- (void)setAllFromArray:(NSArray *)array animated:(BOOL)animated
{
    NSUInteger index = 0;
    array = [array copy];
    for (NSNumber *value in array) {
        [self setIndex:index withValue:value.boolValue animated:animated];
        ++index;
    }
}

- (void)updateSectionRects {
    
    int c = [self.sectionTitles count];
	int i = 0;
	
    if(CGRectIsEmpty(self.frame)) {
        self.segmentWidth = 0;
        
        for(NSString *titleString in self.sectionTitles) {
            CGFloat stringWidth = [titleString sizeWithFont:self.font].width+(self.titleEdgeInsets.left+self.titleEdgeInsets.right+self.thumbEdgeInset.left+self.thumbEdgeInset.right);
            
            if(self.sectionImages.count > i)
                stringWidth+=[(UIImage*)[self.sectionImages objectAtIndex:i] size].width+5;
            
            self.segmentWidth = MAX(stringWidth, self.segmentWidth);
            i++;
        }
        
        self.segmentWidth = ceil(self.segmentWidth/2.0)*2; // make it an even number so we can position with center
        self.bounds = CGRectMake(0, 0, self.segmentWidth*c, self.height);
    }
    else {
        self.segmentWidth = round(self.frame.size.width/self.sectionTitles.count);
        self.height = self.frame.size.height;
    }
    

    
    i = 0;
	for(NSString *titleString in self.sectionTitles) {
        SKTogglesThumb *thumb = [self thumbAtIndex:i];
        
        self.thumbHeight = self.thumbPrototype.backgroundImage ? self.thumbPrototype.backgroundImage.size.height : self.height-(self.thumbEdgeInset.top+self.thumbEdgeInset.bottom);
        
        CGRect thumbRect = CGRectMake(self.segmentWidth*i, 0, self.segmentWidth, self.bounds.size.height);
        thumbRect.size.width+=10; // 5px drop shadow on each side
        thumbRect.origin.x-=5;
        thumbRect.size.height-=1; // for segmented bottom gloss
        
        thumb.frame = thumbRect;
        thumb.font = self.font;
        thumb.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:thumb.bounds cornerRadius:2].CGPath;
        
        [self addSubview:thumb];
        [self setThumbValuesForIndex:i];
        
		i++;
	}
	
}

- (void)calculateSegmentWidth {
    if (CGRectIsEmpty(self.frame)) {
        self.segmentWidth = 0;
        int i = 0;
        for (NSString *titleString in self.sectionTitles) {
            CGFloat stringWidth = [titleString sizeWithFont:self.font].width+(self.titleEdgeInsets.left+self.titleEdgeInsets.right+self.thumbEdgeInset.left+self.thumbEdgeInset.right);
            
            if (self.sectionImages.count > i) {
                stringWidth += [(UIImage*)[self.sectionImages objectAtIndex:i] size].width+5;
            }
            self.segmentWidth = MAX(stringWidth, self.segmentWidth);
            i++;
        }
        
        self.segmentWidth = ceil(self.segmentWidth/2.0)*2; // make it an even number so we can position with center
    }
    else {
        if (0 == self.titlesCount) {
            return;
        }
        self.segmentWidth = round(self.frame.size.width/self.titlesCount);
    }
}

#pragma mark - Auto Layout
- (CGSize)intrinsicContentSize {
    if (self.segmentWidth == 0) {
        [self calculateSegmentWidth];
    }
    
    CGFloat intrinsicWidth = self.segmentWidth * self.titlesCount;
    return CGSizeMake(intrinsicWidth, self.height);
}

#pragma mark - Accessibility

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setNeedsDisplay];
}

- (void)setBounds:(CGRect)bounds {
    if (0 == self.titlesCount) {
        return;
    }
    [super setBounds:bounds];
    self.segmentWidth = round(bounds.size.width/self.titlesCount);
    [self setupAccessibility];
}

- (void)setCenter:(CGPoint)center {
    [super setCenter:center];
    [self setupAccessibility];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview == nil) {
        return; // control is being _removed_ from super view
    }
    [self updateSectionRects];
}

- (void)removeAllThumbs
{
    for (SKTogglesThumb *thumb in self.thumbs) {
        [thumb removeFromSuperview];
    }
    [self.thumbs removeAllObjects];
}

- (void)setupThumbs {
    [self removeAllThumbs];
    
    NSUInteger i = 0;
    for (NSString *title in self.sectionTitles) {
        SKTogglesThumb * newObject = [self copyThumbPrototype];
        [self addSubview:newObject];
        newObject.label.text = title;
        [self.thumbs addObject:newObject];

        ++i;
    }
}

- (void)setupAccessibility {
    [self.accessibilityElements removeAllObjects];
    
    NSUInteger i = 0;
    for (NSString *title in self.sectionTitles) {
        UIAccessibilityElement *element = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
        element.isAccessibilityElement = YES;
        element.accessibilityLabel = [NSString stringWithFormat:NSLocalizedString(@"%@ tab",), title];
        element.accessibilityHint = [NSString stringWithFormat:NSLocalizedString(@"Tab %d of %d",), i + 1, self.titlesCount];
        
        [self.accessibilityElements addObject:element];
        i++;
    }
}

- (NSInteger)accessibilityElementCount {
    return self.accessibilityElements.count;
}

- (id)accessibilityElementAtIndex:(NSInteger)index {
    UIAccessibilityElement *element = [self.accessibilityElements objectAtIndex:index];
    
    CGFloat posY = ceil((CGRectGetHeight(self.bounds)-self.font.pointSize+self.font.descender)/2)+self.titleEdgeInsets.top-self.titleEdgeInsets.bottom-self.font.pointSize/2;
    element.accessibilityFrame = [self.window convertRect:CGRectMake((self.segmentWidth*index), posY, self.segmentWidth, self.font.pointSize*2) fromView:self];
    
    element.accessibilityTraits = UIAccessibilityTraitNone;
    if ([self isSetIndex:index]) {
        element.accessibilityTraits = element.accessibilityTraits | UIAccessibilityTraitSelected;
    } else if (! self.enabled) {
        element.accessibilityTraits = element.accessibilityTraits | UIAccessibilityTraitNotEnabled;
    }
    
    return element;
}

- (NSInteger)indexOfAccessibilityElement:(id)element {
    NSString *title = [[[element accessibilityLabel] componentsSeparatedByString:@" "] objectAtIndex:0];
    return [self.sectionTitles indexOfObject:title];
}

#pragma mark - Tracking

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    return CGRectContainsPoint(CGRectMake(bounds.origin.x - self.touchTargetMargins.left, bounds.origin.y - self.touchTargetMargins.top,
                                          bounds.size.width + self.touchTargetMargins.left + self.touchTargetMargins.right,
                                          bounds.size.height + self.touchTargetMargins.bottom + self.touchTargetMargins.top), point);
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
    
    CGPoint cPos = [touch locationInView:self];
    CGFloat posX = cPos.x-5;
    
	CGFloat pMaxX = CGRectGetMaxX(self.bounds);
	CGFloat pMinX = CGRectGetMinX(self.bounds); // 5 is for thumb shadow
	
    if (posX < pMinX) {
        posX = pMinX;
    } else if (posX >= pMaxX) {
        posX = pMaxX-1;
    }
    
    if (! [self pointInside:cPos withEvent:event]) {
        return;
    }
    
    if (0 == self.segmentWidth) {
        return;
    }
        
    _newIndex = MIN(floor(posX/self.segmentWidth), self.sectionTitles.count-1);
    [self toggleIndex:self.newIndex];
    _newState = [self isSetIndex:self.newIndex];
    
 //   [self notifyChangeHandler];
}

- (void)notifyChangeHandler
{
    if (self.changeHandler) {
        __weak SKTogglesControl *weakSelf = self;
        self.changeHandler(weakSelf, self.newIndex, self.newState);
    }
}

#pragma mark - SectionTitles

- (void)setSectionTitles:(NSArray *)sectionTitles
{
    if (_sectionTitles != sectionTitles) {
        _sectionTitles = [sectionTitles copy];
        [self setNeedsDisplay];
        [self setupAccessibility];
    }
}

#pragma mark -

- (void)setBackgroundImage:(UIImage *)newImage {
    
    if (_backgroundImage) {
        _backgroundImage = nil;
    }
    
    if (newImage) {
        _backgroundImage = newImage;
        self.height = _backgroundImage.size.height;
    }
}

- (UIImage*)imageForSectionIndex:(NSUInteger)index {
    if (self.sectionImages.count <= index) {
        return nil;
    }
    return [self.sectionImages objectAtIndex:index];
}

- (SKTogglesThumb*)thumbAtIndex:(NSUInteger)index
{
    return (SKTogglesThumb*)[self.thumbs objectAtIndex:index];
}

- (void)setThumbValuesForIndex:(NSUInteger)index {
    SKTogglesThumb* thumb = [self thumbAtIndex:index];
    
    NSString *title = [self.sectionTitles objectAtIndex:index];
    UIImage *image = [self sectionImage:[self imageForSectionIndex:index]
                          withTintColor:self.thumbPrototype.textColor];
    [thumb setTitle:title
              image:image];
}

- (BOOL)isSetIndex:(NSUInteger)index
{
    return ![self thumbAtIndex:index].hidden;
}

- (void)setIndex:(NSUInteger)index withValue:(BOOL)state
{
    [self setIndex:index withValue:state animated:self.animated];
}

- (void)setIndex:(NSUInteger)index withValue:(BOOL)state animated:(BOOL)animated
{
    if ([self isSetIndex:index] != state) {
        [self toggleIndex:index animated:animated];
    }
}

- (void)setIndex:(NSUInteger)index {
    [self setIndex:index animated:self.animated];
}

- (void)unsetIndex:(NSUInteger)index {
    [self unsetIndex:index animated:self.animated];
}

- (void)toggleIndex:(NSUInteger)index {
    [self toggleIndex:index animated:self.animated];
}

- (void)toggleIndex:(NSUInteger)index animated:(BOOL)animated {
    if ([self isSetIndex:index]) {
        [self unsetIndex:index animated:animated];
    } else {
        [self setIndex:index animated:animated];
    }
}

- (void)setIndex:(NSUInteger)index animated:(BOOL)animated {
    if (! [self isEnabledIndex:index]) {
        return; // dont change if disabled
    }
    
    if ([self isSetIndex:index]) {
        return; // already done
    }
    
    if (self.superview) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        
        if (animated) {
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:nil
                             completion:^(BOOL finished){
                                 if (finished) {
                                     [self activate:index];
                                 }
                             }];
        } else {
            [self activate:index];
        }
    } else {
        [self activate:index];
    }
    
    [self notifyChangeHandler];
}

- (BOOL)isEnabledIndex:(NSUInteger)index
{
    return [self thumbAtIndex:index].enabled;
}

- (void)enableIndex:(NSUInteger)index
{
    [self setEnabledIndex:index withValue:YES];
}

- (void)disableIndex:(NSUInteger)index
{
    [self setEnabledIndex:index withValue:NO];
}

- (void)setEnabledIndex:(NSUInteger)index withValue:(BOOL)state
{
    [self thumbAtIndex:index].enabled = state;
}

- (void)unsetIndex:(NSUInteger)index animated:(BOOL)animated {
    if (! [self isEnabledIndex:index]) {
        return; // don't change if disabled
    }

    if (! [self isSetIndex:index]) {
        return; // already unset
    }
    
    if (self.superview) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        
        if (animated) {
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:nil
                             completion:^(BOOL finished){
                                 if (finished) {
                                     [self deactivate:index];
                                 }
                             }];
        } else {
            [self deactivate:index];
        }
    } else {
        [self deactivate:index];
    }
    
    [self notifyChangeHandler];
}

#pragma mark - Drawing


- (void)activate:(NSUInteger)index
{
    [self thumbAtIndex:index].hidden = NO;
}

- (void)deactivate:(NSUInteger)index
{
    [self thumbAtIndex:index].hidden = YES;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (self.backgroundImage) {
        [self.backgroundImage drawInRect:rect];
    } else {
        // bottom gloss
        CGRect insetRect = CGRectMake(0, 0, rect.size.width, rect.size.height-1);
        CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:1 alpha:0.1].CGColor);
        
        UIBezierPath *bottomGlossPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.cornerRadius];
        [bottomGlossPath appendPath:[UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:self.cornerRadius]];
        bottomGlossPath.usesEvenOddFillRule = YES;
        [bottomGlossPath fill];
        
        CGPathRef roundedRect = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:self.cornerRadius].CGPath;
        CGContextAddPath(context, roundedRect);
        CGContextClip(context);
        
        // background tint
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        UIColor *tintColorToApply = self.backgroundTintColor;
        
        // if color was created with colorWithWhite:alpha:
        if (CGColorGetNumberOfComponents(tintColorToApply.CGColor) == 2) {
            float white = CGColorGetComponents(tintColorToApply.CGColor)[0];
            float alpha = CGColorGetComponents(tintColorToApply.CGColor)[1];
            tintColorToApply = [UIColor colorWithRed:white green:white blue:white alpha:alpha];
        }
        
        CGFloat tintColorRGBA[4];
        [tintColorToApply getRed:&tintColorRGBA[0] green:&tintColorRGBA[1] blue:&tintColorRGBA[2] alpha:&tintColorRGBA[3]];
        
        float darkeningDelta = 0.2;
        UIColor *darkerTintColor = [UIColor colorWithRed:(tintColorRGBA[0] - darkeningDelta) green:(tintColorRGBA[1] - darkeningDelta) blue:(tintColorRGBA[2] - darkeningDelta) alpha:(tintColorRGBA[3] + darkeningDelta*0.2)];
        CGFloat darkerTintColorRGBA[4];
        [darkerTintColor getRed:&darkerTintColorRGBA[0] green:&darkerTintColorRGBA[1] blue:&darkerTintColorRGBA[2] alpha:&darkerTintColorRGBA[3]];
        
        CGFloat components[8] = {darkerTintColorRGBA[0], darkerTintColorRGBA[1], darkerTintColorRGBA[2], darkerTintColorRGBA[3], tintColorRGBA[0], tintColorRGBA[1], tintColorRGBA[2], tintColorRGBA[3]};
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, NULL, 2);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,CGRectGetHeight(rect)-1), 0);
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorSpace);
        
        // inner shadow
        NSArray *paths = [NSArray arrayWithObject:[UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:self.cornerRadius]];
        UIImage *mask = [self maskWithPaths:paths bounds:CGRectInset(insetRect, -10, -10)];
        UIImage *invertedImage = [self invertedImageWithMask:mask color:self.innerShadowColor];
        
        CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 2, self.innerShadowColor.CGColor);
        [invertedImage drawAtPoint:CGPointMake(-10, -10)];
        
    }
    
	CGContextSetShadowWithColor(context, self.textShadowOffset, 0, self.textShadowColor.CGColor);
	[self.textColor set];
    
	int i = 0;
	
	for (NSString *titleString in self.sectionTitles) {
        CGSize titleSize = [titleString sizeWithFont:self.font];
        CGFloat titleWidth = titleSize.width;
        CGFloat posY = round((CGRectGetHeight(rect)-self.font.ascender-5)/2)+self.titleEdgeInsets.top-self.titleEdgeInsets.bottom;

        CGFloat imageWidth = 0;
        UIImage *image = nil;
        
        if (self.sectionImages.count > i) {
            image = [self.sectionImages objectAtIndex:i];
            imageWidth = image.size.width+5;
        }
        
        titleWidth += imageWidth;
        CGFloat sectionOffset = round((self.segmentWidth-titleWidth)/2);
        CGFloat titlePosX = (self.segmentWidth*i)+sectionOffset;
        
        if (image) {
            [[self sectionImage:image withTintColor:self.textColor] drawAtPoint:CGPointMake(titlePosX, round((rect.size.height-image.size.height)/2))];
        }
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
		[titleString drawAtPoint:CGPointMake(titlePosX+imageWidth, posY) forWidth:self.segmentWidth withFont:self.font lineBreakMode:UILineBreakModeTailTruncation];
#else
        [titleString drawAtPoint:CGPointMake(titlePosX+imageWidth, posY) forWidth:self.segmentWidth withFont:self.font lineBreakMode:NSLineBreakByClipping];
#endif
		i++;
	}
}


#pragma mark - Image Methods Methods

- (UIImage *)sectionImage:(UIImage*)image withTintColor:(UIColor*)color {
    if (! image) {
        return nil;
    }
    CGRect rect = { CGPointZero, image.size };
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale); {
        [color set];
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(context, 0, rect.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextClipToMask(context, rect, [image CGImage]);
        CGContextFillRect(context, rect);
    }
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}


// http://stackoverflow.com/a/8482103/87158

- (UIImage *)maskWithPaths:(NSArray *)paths bounds:(CGRect)bounds
{
    // Get the scale for good results on Retina screens.
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize scaledSize = CGSizeMake(bounds.size.width * scale, bounds.size.height * scale);
    
    // Create the bitmap with just an alpha channel.
    // When created, it has value 0 at every pixel.
    CGContextRef gc = CGBitmapContextCreate(NULL, scaledSize.width, scaledSize.height, 8, scaledSize.width, NULL, kCGImageAlphaOnly);
    
    // Adjust the current transform matrix for the screen scale.
    CGContextScaleCTM(gc, scale, scale);
    // Adjust the CTM in case the bounds origin isn't zero.
    CGContextTranslateCTM(gc, -bounds.origin.x, -bounds.origin.y);
    
    // whiteColor has all components 1, including alpha.
    CGContextSetFillColorWithColor(gc, [UIColor whiteColor].CGColor);
    
    // Fill each path into the mask.
    for (UIBezierPath *path in paths) {
        CGContextBeginPath(gc);
        CGContextAddPath(gc, path.CGPath);
        CGContextFillPath(gc);
    }
    
    // Turn the bitmap context into a UIImage.
    CGImageRef cgImage = CGBitmapContextCreateImage(gc);
    CGContextRelease(gc);
    UIImage *image = [UIImage imageWithCGImage:cgImage scale:scale orientation:UIImageOrientationDownMirrored];
    CGImageRelease(cgImage);
    return image;
}

- (UIImage *)invertedImageWithMask:(UIImage *)mask color:(UIColor *)color
{
    CGRect rect = { CGPointZero, mask.size };
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, mask.scale); {
        // Fill the entire image with color.
        [color setFill];
        UIRectFill(rect);
        // Now erase the masked part.
        CGContextClipToMask(UIGraphicsGetCurrentContext(), rect, mask.CGImage);
        CGContextClearRect(UIGraphicsGetCurrentContext(), rect);
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)drawInnerGlowWithPaths:(NSArray *)paths bounds:(CGRect)bounds color:(UIColor *)color offset:(CGSize)offset blur:(CGFloat)blur
{
    UIImage *mask = [self maskWithPaths:paths bounds:bounds];
    UIImage *invertedImage = [self invertedImageWithMask:mask color:color];
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    // Save the graphics state so I can restore the clip and
    // shadow attributes after drawing.
    CGContextSaveGState(gc); {
        CGContextClipToMask(gc, bounds, mask.CGImage);
        CGContextSetShadowWithColor(gc, offset, blur, color.CGColor);
        [invertedImage drawInRect:bounds];
    } CGContextRestoreGState(gc);
}

@end
