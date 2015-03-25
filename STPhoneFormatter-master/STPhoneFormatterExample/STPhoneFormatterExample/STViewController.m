//
//  STViewController.m
//  STPhoneFormatterExample
//
//  Created by Sebastien Thiebaud on 7/30/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import "STViewController.h"
#import "STPhoneFormatter.h"

@interface STViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong) IBOutlet UITextField *phoneTextField;
@property (strong) IBOutlet UIPickerView *countryPickerView;
@property (strong) IBOutlet UILabel *phoneLabel;

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Some code to display the good country into the picker view
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(code == %@)", [[STPhoneFormatter phoneFormatter] countryCode]];
    NSArray *result = [[[STPhoneFormatter phoneFormatter] listOfCountrySupported] filteredArrayUsingPredicate:predicate];
    NSInteger index = [[[STPhoneFormatter phoneFormatter] listOfCountrySupported] indexOfObject:[result lastObject]];
    [_countryPickerView selectRow:index inComponent:0 animated:NO];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if(touch.phase == UITouchPhaseBegan) {
        [_phoneTextField resignFirstResponder];
    }
}

#pragma mark - 
#pragma mark UITextField Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _phoneTextField) {
       BOOL phoneNumberHasChanged = [[STPhoneFormatter phoneFormatter] phoneNumberMustChangeInRange:range replacementString:string];
        
        if (phoneNumberHasChanged) {
            textField.text = [[STPhoneFormatter phoneFormatter] formattedPhoneNumber];
            _phoneLabel.text = [[STPhoneFormatter phoneFormatter] internationalPhoneNumber];
        }
        
        return NO;
    }
    
    return YES;
}

#pragma mark -
#pragma mark UIPickerView DataSource & Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[[STPhoneFormatter phoneFormatter] listOfCountrySupported] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[[STPhoneFormatter phoneFormatter] listOfCountrySupported] objectAtIndex:row] objectForKey:@"country"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *code = [[[[STPhoneFormatter phoneFormatter] listOfCountrySupported] objectAtIndex:row] objectForKey:@"code"];
    [[STPhoneFormatter phoneFormatter] setCountryCode:code];
    _phoneTextField.text = [[STPhoneFormatter phoneFormatter] formattedPhoneNumber];
    _phoneLabel.text = [[STPhoneFormatter phoneFormatter] internationalPhoneNumber];
}

@end
