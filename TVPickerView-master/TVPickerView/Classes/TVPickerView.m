//
//  TVPickerView.m
//
//  Created by TaviscaIOS on 9/5/12.
//  Copyright (c) 2012 Tavisca. All rights reserved.
//

#import "TVPickerView.h"

#define kDecrementButtonTag 10
#define kIncrementButtonTag 11

@interface TVPickerView (){
    UIButton *_decrementIndexBtn;
    UIButton *_incrementIndexBtn;
    UITextField *_contentView;
    int _currentIndex;
    int _count;
}
@end

@implementation TVPickerView

@synthesize delegate = _delegate ,datasource = _datasource , block = _block;

#pragma mark init method

-(id) init {
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        _currentIndex = 0;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        _currentIndex = 0;
    }
    return self;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    for(UIView *v in self.subviews){
        [v removeFromSuperview];
    }
    [self initializePickerSubviews];
}

#pragma mark - Initializing picker subviews

-(void) initializePickerSubviews {
    UIImage *plusNormalStateImage = [UIImage imageNamed:@"plus.png"];
    UIImage *plusPressedStateImage = [UIImage imageNamed:@"plus_press.png"];
    UIImage *minusNormalStateImage = [UIImage imageNamed:@"minus.png"];
    UIImage *minusPressedStateImage = [UIImage imageNamed:@"minus_press.png"];
    
    _decrementIndexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_decrementIndexBtn setBackgroundColor:[UIColor clearColor]];
    [_decrementIndexBtn setBackgroundImage:plusNormalStateImage forState:UIControlStateNormal];
    [_decrementIndexBtn setBackgroundImage:plusPressedStateImage forState:UIControlStateSelected];
    _decrementIndexBtn.frame = CGRectMake(0, 0, plusNormalStateImage.size.width, self.frame.size.height);
    [_decrementIndexBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_decrementIndexBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [_decrementIndexBtn setTitle:@"-" forState:UIControlStateNormal];
    _decrementIndexBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _decrementIndexBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    _decrementIndexBtn.tag = kDecrementButtonTag;
    [_decrementIndexBtn addTarget:self action:@selector(incrementDecrementButtonPressed:) forControlEvents:UIControlStateHighlighted];
    
    _contentView = [[UITextField alloc] initWithFrame:CGRectMake(_decrementIndexBtn.frame.size.width, 0, self.frame.size.width - (plusNormalStateImage.size.width + minusNormalStateImage.size.width), _decrementIndexBtn.frame.size.height)];
    _contentView.borderStyle = UITextBorderStyleBezel;
    [_contentView setTextAlignment:UITextAlignmentCenter];
    _contentView.adjustsFontSizeToFitWidth = YES;
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _contentView.enabled = NO;
    
    _incrementIndexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_incrementIndexBtn setBackgroundColor:[UIColor clearColor]];
    [_incrementIndexBtn setBackgroundImage:minusNormalStateImage forState:UIControlStateNormal];
    [_incrementIndexBtn setBackgroundImage:minusPressedStateImage forState:UIControlStateSelected];
    _incrementIndexBtn.frame = CGRectMake(_decrementIndexBtn.frame.size.width + _contentView.frame.size.width, 0, minusNormalStateImage.size.width, self.frame.size.height);
    [_incrementIndexBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_incrementIndexBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [_incrementIndexBtn setTitle:@"+" forState:UIControlStateNormal];
    _incrementIndexBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _incrementIndexBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    _incrementIndexBtn.tag = kIncrementButtonTag;
    [_incrementIndexBtn addTarget:self action:@selector(incrementDecrementButtonPressed:) forControlEvents:UIControlStateHighlighted];
    
    [self addSubview:_decrementIndexBtn];
    [self addSubview:_incrementIndexBtn];
    [self addSubview:_contentView];
}

- (void) incrementDecrementButtonPressed:(id)sender {
    UIButton *button = (UIButton*) sender;
    if (button.tag == kIncrementButtonTag && (_currentIndex < _count - 1)) {
        _currentIndex++;
    }
    
    if(button.tag == kDecrementButtonTag && _currentIndex > 0) {
        _currentIndex--;
    }
    _contentView.text = [_delegate tvPickerView:self titleForIndex:_currentIndex];
    if(_block != nil){
        _contentView.text = _block(_currentIndex);
    }
}

#pragma mark - Setting Delegate and datasource

- (void)setDelegate:(id<TVPickerViewDelegate>)delegate {
    _delegate = delegate;
}

- (void)setDatasource:(id<TVPickerViewDatasource>)datasource {
    _datasource = datasource;
    [self reloadData];
}

- (void)setBlock:(titleOfPickerAtIndexBlock)block {
    _block = block;
    [self reloadData];
}

- (void) reloadData {
    _count = [_datasource numberOfElementsInTVPickerViewView];
    _contentView.text = [_delegate tvPickerView:self titleForIndex:_currentIndex];

    if(_block != nil){
        NSString *value = _block(_currentIndex);
        [_contentView setText:value];
    }
}

- (NSInteger)selectedIndex {
    return _currentIndex;
}

- (void)setSelectedIndex:(NSInteger) index {
    _currentIndex = index;
    [self reloadData];
}

-(void)setSelectedIndex:(NSInteger) index andReloadView:(BOOL)doReload {
    _currentIndex = index;
    if(doReload){
        [self reloadData];
    }
}

- (void)setBackgroundImageOfDecrementButton:(NSString *)imageName forState:(UIControlState)state {
    [_decrementIndexBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:state];
}

- (void)setBackgroundImageOfIncrementButton:(NSString *)imageName forState:(UIControlState)state {
    [_incrementIndexBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:state];
}

- (void)setIncrementDecrementTextColor:(UIColor *)color {
    [_decrementIndexBtn setTitleColor:color forState:UIControlStateNormal];
    [_incrementIndexBtn setTitleColor:color forState:UIControlStateNormal];
}

- (void)setContentTextColor:(UIColor *)color {
    [_contentView setTextColor:color];
}

-(void)setContentTextFont:(UIFont *)font  {
    [_contentView setFont:font];
}

@end