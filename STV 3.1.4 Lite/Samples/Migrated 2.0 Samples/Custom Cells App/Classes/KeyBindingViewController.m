//
//  KeyBindingViewController.m
//  Custom Cells App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "KeyBindingViewController.h"


@implementation KeyBindingViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _valuesDictionary = [NSMutableDictionary dictionary];
    
    
    // Create a section to hold the different key-bound cells
	SCTableViewSection *section = [SCTableViewSection section];
	[self.tableViewModel addSection:section];
	
	NSDictionary *contactDataBindings = [NSDictionary 
										 dictionaryWithObjects:[NSArray arrayWithObjects:@"firstName", @"lastName", @"age", @"sex", nil] 
										 forKeys:[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil]]; // 1,2,3,4 are the control tags
	SCCustomCell *contactDataCell = [SCCustomCell cellWithText:nil boundObject:_valuesDictionary objectBindings:contactDataBindings nibName:@"ContactDataCell"];
    contactDataCell.selectionStyle = UITableViewCellSelectionStyleNone;
	[section addCell:contactDataCell];
	
	SCDateCell *dateCell = [SCDateCell cellWithText:@"Birth Date" boundObject:_valuesDictionary datePropertyName:@"birthDate"];
	[dateCell.dateFormatter setDateFormat:@"MMM dd, YYYY"];
	dateCell.datePicker.datePickerMode = UIDatePickerModeDate;
	[section addCell:dateCell];
	
	SCTextViewCell *notesCell = [SCTextViewCell cellWithText:@"Notes" boundObject:_valuesDictionary textViewTextPropertyName:@"notes"];
	[section addCell:notesCell];
    
    section.cellActions.valueChanged = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        NSString *firstName = [_valuesDictionary valueForKey:@"firstName"];
        NSString *lastName = [_valuesDictionary valueForKey:@"lastName"];
        NSNumber *age = [_valuesDictionary valueForKey:@"age"];
        NSNumber *sex = [_valuesDictionary valueForKey:@"sex"];
        NSDate *birthDate = [_valuesDictionary valueForKey:@"birthDate"];
        NSString *notes = [_valuesDictionary valueForKey:@"notes"];
        
        // Log key changes to the console
        NSLog(@"\nFirst Name:%@\nLast Name:%@\nAge:%@\nSex:%@\nBithDate:%@\nNotes:%@", 
              firstName, lastName, age, sex, birthDate, notes);
    };
}





@end

