//
//  SamlpeViewController.h
//  UIMonthYearPickerSample
//
//  Created by Evgeny Yagrushkin on 2012-09-18.
//  Copyright (c) 2012 Evgeny Yagrushkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIMonthYearPicker.h"

@class UIMonthYearPicker;

@interface SamlpeViewController : UIViewController<UIMonthYearPickerDelegate>{
    NSDateFormatter *dateFormatter;
}

@property (weak, nonatomic) IBOutlet UIMonthYearPicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
