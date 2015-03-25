//
//  SamlpeViewController.m
//  UIMonthYearPickerSample
//
//  Created by Evgeny Yagrushkin on 2012-09-18.
//  Copyright (c) 2012 Evgeny Yagrushkin. All rights reserved.
//


#import "SamlpeViewController.h"

@interface SamlpeViewController ()

@end

@implementation SamlpeViewController
@synthesize datePicker;
@synthesize dateLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];

    datePicker._delegate = self;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    dateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
}

- (void)viewDidUnload
{
    [self setDatePicker:nil];
    [self setDateLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsPortrait(interfaceOrientation));
}

#pragma mark - UIMonthYearPickerDelegate
- (void) pickerView:(UIPickerView *)pickerView didChangeDate:(NSDate *)newDate{
    dateLabel.text = [dateFormatter stringFromDate:newDate];
}

@end
