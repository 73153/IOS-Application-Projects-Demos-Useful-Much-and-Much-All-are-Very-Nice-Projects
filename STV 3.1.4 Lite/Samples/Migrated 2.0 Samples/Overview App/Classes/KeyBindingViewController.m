//
//  KeyBindingViewController.m
//  Overview App
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
    [_valuesDictionary setValue:[NSNumber numberWithInt:7] forKey:@"number"];
    [_valuesDictionary setValue:[NSNumber numberWithFloat:0.5f] forKey:@"slider"];
    [_valuesDictionary setValue:[NSNumber numberWithBool:TRUE] forKey:@"switch"];
    
    
	SCTableViewSection *section = [SCTableViewSection sectionWithHeaderTitle:@"Section Header"];
	[self.tableViewModel addSection:section];
	
	SCTextFieldCell *textFieldCell = [SCTextFieldCell cellWithText:@"Text" placeholder:@"enter text" 
													  boundObject:_valuesDictionary textFieldTextPropertyName:@"text"];
	textFieldCell.valueRequired = TRUE;
	[section addCell:textFieldCell];
	SCNumericTextFieldCell *numericCell = [SCNumericTextFieldCell cellWithText:@"Number" placeholder:@"enter integer" 
                                                                   boundObject:_valuesDictionary textFieldTextPropertyName:@"number"];
	numericCell.allowFloatValue = FALSE;
	numericCell.minimumValue = [NSNumber numberWithInt:5];
	numericCell.maximumValue = [NSNumber numberWithInt:10];
	[section addCell:numericCell];
	[section addCell:[SCSliderCell cellWithText:@"Slider" boundObject:_valuesDictionary sliderValuePropertyName:@"slider"]];
	[section addCell:[SCSwitchCell cellWithText:@"Switch" boundObject:_valuesDictionary switchOnPropertyName:@"switch"]];
    
    section.cellActions.valueChanged = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        NSLog(@"\n\n*********** Key Binding Log ***********\n");
        if(self.tableViewModel.valuesAreValid)
            NSLog(@"Data is valid!\n");
        else
            NSLog(@"Data is invalid!\n");
        NSLog(@"Value for text: %@\n", [_valuesDictionary valueForKey:@"text"]);
        NSLog(@"Value for number: %@\n", [_valuesDictionary valueForKey:@"number"]);
        NSLog(@"Value for slider: %@\n", [_valuesDictionary valueForKey:@"slider"]);
        NSLog(@"Value for switch: %@\n", [_valuesDictionary valueForKey:@"switch"]);
    };
}


- (void)dealloc
{
    [_valuesDictionary release];
    
    [super dealloc];
}



@end
