//
//  TVPickerView.h
//
//  Created by TaviscaIOS on 9/5/12.
//  Copyright (c) 2012 Tavisca. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString* (^titleOfPickerAtIndexBlock)(int index);

@protocol TVPickerViewDelegate, TVPickerViewDatasource;

/** 
Custom picker view with increment decrement operations.
 
Example usage:
        TVPickerView *tvPickerView = [[TVPickerView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        tvPickerView.delegate = //set delegate
        tvPickerView.dataSource = //set dataSouce
        [parentView addSubView:tvPickerView];
 */
@interface TVPickerView : UIView

/**
 @abstract TVPickerViewDelegate property
 */
@property (weak ,nonatomic) id<TVPickerViewDelegate> delegate;

/**
 @abstract TVPickerViewDataSource property
 */
@property (weak ,nonatomic) id<TVPickerViewDatasource> datasource;


@property (nonatomic, copy) titleOfPickerAtIndexBlock block;

/**
 @abstract This is used to set the color of the text.
 @param color UIColor, color of the text.
 */
-(void)setContentTextColor:(UIColor *)color;

/**
 @abstract Used to set the font of the text.
 @param font UIFont, font of the text.
 */
-(void)setContentTextFont:(UIFont *)font;

/**     
 @abstract Used to set the color of increment & decerement buttons.
 @param color UIColor
 */
-(void)setIncrementDecrementTextColor:(UIColor *)color;

/**     
 @abstract Set the image of the increment button.
 @param imageName Name of the image.
 @param state Button state for which the image should be applied.
 */
-(void)setBackgroundImageOfIncrementButton:(NSString *)imageName forState:(UIControlState)state;

/**
 @abstract Set the image of the decrement button.
 @param imageName Name of the image.
 @param state Button state for which the image should be applied.
 */
-(void)setBackgroundImageOfDecrementButton:(NSString *)imageName forState:(UIControlState)state;

/**
 @abstract Reload all data source elements
 */
-(void)reloadData;

/**
 @abstract Return the current index
 @return selected index
 */
-(NSInteger)selectedIndex;

/**
 @abstract Set the current index.
 @param value value to set
 */
-(void)setSelectedIndex:(NSInteger)value;

/**
 @abstract Set the current index.
 @param value value to set
 @param doReload Do update View
 */
-(void)setSelectedIndex:(NSInteger) index andReloadView:(BOOL)doReload;
@end

@protocol TVPickerViewDelegate <NSObject>

@required

/**
 @abstract Called by the picker view when it needs the title for a given index.
 @param picker An object representing the picker view requesting the data.
 @param index  A zero-indexed number identifying the element.
 @return NSString representing the value.
 */
-(NSString *)tvPickerView:(TVPickerView *)tvPickerView titleForIndex:(NSInteger)index;

@end

@protocol TVPickerViewDatasource <NSObject>

@required

/**
 @abstract Called by the picker view when it needs the number of components.
 @return Number of elements that TVPickerView should display.
 */
-(NSInteger)numberOfElementsInTVPickerViewView;

@end
