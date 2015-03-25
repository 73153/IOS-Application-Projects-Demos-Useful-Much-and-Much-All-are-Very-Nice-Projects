//
//  RMEIdeasPullDownControl.m
//  Back in Touch
//
//  Created by Osagie Zogie-Odigie on 01/06/2013.
//  The MIT License (MIT)
//
//  Copyright (c) 2013 RME-IDEAS Limited
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  If you use this software in a product, an acknowledgment in the product
//  documentation would be appreciated but is not required.
//

#import "RMEIdeasPullDownControl.h"

#define kControlStartIndexTag 500
#define kFuzzyThreshold 70.0
#define kShowInfoDownThreshold -70.0
#define KSelectionLabelThreshold -30.0
#define kShowSelectionDownThershold -55.0
#define kOperationalRange 50.0


@interface RMEIdeasPullDownControl ()
@property (nonatomic, weak)id<RMEIdeasPullDownControlDataSource> dataSource;
@property (nonatomic, weak)id<RMEIdeasPullDownControlProtocol> delegate;
@property (nonatomic, weak)UIScrollView* clientScrollView;
@property (nonatomic) NSInteger numberOfButtons;
@property (nonatomic, strong) NSMutableArray *unselectedImagesArray;
@property (nonatomic, strong) NSMutableArray *selectedImagesArray;
@property (nonatomic, strong) NSMutableArray *selectedControlTextArray;
@property (nonatomic, strong) UILabel *selectedTextLabel;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic) BOOL selectionProcessingInProgress;
@property (nonatomic) NSInteger previousSelectedControlIndex;
@property (nonatomic) NSInteger currentSelectedControlIndex;
@property (nonatomic) CGFloat cutOffDelta;
@property (nonatomic, strong) NSMutableArray *allControls;

@end

@implementation RMEIdeasPullDownControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithDataSource:(id<RMEIdeasPullDownControlDataSource>)dataSource
                delegate:(id<RMEIdeasPullDownControlProtocol>)delegate
        clientScrollView:(UIScrollView*)clientScrollView
{
    self = [super initWithFrame:CGRectMake(0.0, 0.0, clientScrollView.frame.size.width, 70.0)];
    if (self) {
        // Custom initialization
        self.delegate = delegate;
        self.dataSource = dataSource;
        self.clientScrollView = clientScrollView;
        
        [self setSelfUp];
    }
    return self;
}

#pragma mark - Setup

- (void) setSelfUp
{
    self.clipsToBounds = YES;
    [self.clientScrollView addObserver:self forKeyPath:@"contentOffset" options:0 context:NULL];
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionProcessingInProgress = NO;
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, -70.0, self.frame.size.width, 70.0)];
    self.containerView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0];
    
    self.unselectedImagesArray = [[NSMutableArray alloc] initWithCapacity:1];
    self.selectedImagesArray = [[NSMutableArray alloc] initWithCapacity:1];
    self.selectedControlTextArray = [[NSMutableArray alloc] initWithCapacity:1];
    
    self.numberOfButtons = [self.dataSource numberOfButtonsRequired:self];
    NSAssert(self.numberOfButtons>1, @"Number of controls must be at least 2");
    
    self.cutOffDelta = kOperationalRange/self.numberOfButtons;
    CGFloat requiredControlWidth = self.frame.size.width/self.numberOfButtons;
    CGFloat currentImageXcoordinate = 0.0;
    
    self.allControls =[[NSMutableArray alloc] initWithCapacity:1];
    for (int i = 0; i < self.numberOfButtons; i++)
    {
        UIImage *thisUnselectedImage = [self.dataSource rmeIdeasPullDownControl:self imageForControlAtIndex:i];
        UIImage *thisSelectedImage = [self.dataSource rmeIdeasPullDownControl:self selectedImageForControlAtIndex:i];
        NSString *thisSelectedControlText = [self.dataSource rmeIdeasPullDownControl:self titleForControlAtIndex:i];
        
        [self.unselectedImagesArray addObject:thisUnselectedImage];
        [self.selectedImagesArray addObject:thisSelectedImage];
        [self.selectedControlTextArray addObject:thisSelectedControlText];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(currentImageXcoordinate, 0.0, requiredControlWidth, 44.0)];
        imageView.tag = kControlStartIndexTag + i;
        [imageView setImage:thisSelectedImage];
        [self.containerView addSubview:imageView];
        
        [self.allControls addObject:imageView];
        
        currentImageXcoordinate = currentImageXcoordinate + requiredControlWidth;
    }
    self.selectedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 50.0, 280.0, 15.0)];
    self.selectedTextLabel.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1.0];
    self.selectedTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
    self.selectedTextLabel.backgroundColor = [UIColor clearColor];
    self.selectedTextLabel.textAlignment = NSTextAlignmentCenter;
    [self.containerView addSubview:self.selectedTextLabel];
    
    UIImageView *separatingLine = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 44.0, self.frame.size.width, 2.0)];
    [separatingLine setImage:[UIImage imageNamed:@"pullDownSeparatingLine.png"]];
    [self.containerView addSubview:separatingLine];
    
    [self addSubview:self.containerView];
}

- (void) deselectAllControls
{
    
}

#pragma mark - KVO methods

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.clientScrollView)
    {
        if ([keyPath isEqualToString:@"contentOffset"])
        {
            [self psuedoScrollViewDidScroll];
        }
    }
}

- (void) dealloc
{
    [self.clientScrollView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - CopyScrollView delegate methods
- (void) psuedoScrollViewDidScroll
{
    CGFloat yOffset = self.clientScrollView.contentOffset.y;
    if ((self.clientScrollView.dragging == NO) && (yOffset < 0))
    {
        self.selectionProcessingInProgress = YES;
    }
    else if (yOffset > -1.0)
    {
        self.selectionProcessingInProgress = NO;
        [self notifyDelegateOfSelection];
        
    }
    if ((yOffset < -kFuzzyThreshold) && (self.selectionProcessingInProgress == NO))
    {
        [self decodeButtonSelectionForOffset:(-1*self.clientScrollView.contentOffset.y)];
    }
    
    if (yOffset < 0)
    {
        if (yOffset > kShowInfoDownThreshold)
        {
            self.containerView.frame = CGRectMake(0.0, (kShowInfoDownThreshold - yOffset), 320.0, 70.0);
            
        }
        if (yOffset < kShowSelectionDownThershold)
        {
            self.selectedTextLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
             [self updateCurrentSelectionText];
            
        }
        else
        {
            self.selectedTextLabel.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1.0];
            self.selectedTextLabel.text = @"Keep dragging to change; Release to select";
        }
    }
}


- (void) notifyDelegateOfSelection
{
    if (self.previousSelectedControlIndex != self.currentSelectedControlIndex)
    {
        //Notify the delegate
        [self.delegate rmeIdeasPullDownControl:self selectedControlAtIndex:self.currentSelectedControlIndex];
        self.previousSelectedControlIndex = self.currentSelectedControlIndex;
    }
}


#pragma mark - Control decoding methods
- (void) decodeButtonSelectionForOffset:(CGFloat)offset
{
    NSInteger buttonChangeNumber = (NSUInteger)floorf(offset - kFuzzyThreshold)/self.cutOffDelta;
    NSInteger tempNewButtonNumber = 0;
    
    //Important Note: buttonChangeNumber is with reference to initial button position.
    if (buttonChangeNumber > (self.numberOfButtons - 1))
    {
        buttonChangeNumber = (self.numberOfButtons - 1);
    }
    //else
    {
        tempNewButtonNumber = self.previousSelectedControlIndex+buttonChangeNumber;
        if (tempNewButtonNumber > (self.numberOfButtons - 1))
        {
            tempNewButtonNumber = tempNewButtonNumber%self.numberOfButtons;
        }
    }
    if (self.currentSelectedControlIndex != tempNewButtonNumber)
    {
        self.currentSelectedControlIndex = tempNewButtonNumber;
        [self updateSelectedButtonAt:self.currentSelectedControlIndex];
    }
}

- (void) updateSelectedButtonAt:(NSInteger)index
{
    for (int i = 0; i < self.numberOfButtons; i++)
    {
        UIImageView *thisControl = self.allControls[i];
        
        if (i == index)
        {
            [thisControl setImage:self.selectedImagesArray[i]];
        }
        else
        {
            [thisControl setImage:self.unselectedImagesArray[i]];
        }
    }
}
- (void)updateCurrentSelectionText
{
    if ([self.selectedControlTextArray count] > self.currentSelectedControlIndex)
    {
        self.selectedTextLabel.text = self.selectedControlTextArray[self.currentSelectedControlIndex];
    }
}

#pragma mark - Public methods
- (void) selectControlAtIndex:(NSInteger)controlIndex
{
    self.currentSelectedControlIndex = controlIndex;
    self.previousSelectedControlIndex = 9999;//Always trigger notification to delegate
    [self updateSelectedButtonAt:self.currentSelectedControlIndex];
    [self notifyDelegateOfSelection];
    
}


@end
