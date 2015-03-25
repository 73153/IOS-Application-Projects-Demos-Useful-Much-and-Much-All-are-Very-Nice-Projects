//
//
//  Created by Evgeny Yagrushkin on 2012-08-15.
//  Copyright (c) 2012 Evgeny Yagrushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIMonthYearPickerDelegate

@optional
- (void)pickerView:(UIPickerView *)pickerView didChangeDate:(NSDate*)newDate;
@end

@interface UIMonthYearPicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id _delegate;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *minimumDate;
@property (nonatomic, strong) NSDate *maximumDate;

- (void)selectToday;

@end
