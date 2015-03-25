//
//  MapCustomizationViewController.m
//  USStatesColorMapDemo
//
//  Created by Andrey Cherkashin on 10.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import "MapCustomizationViewController.h"

@interface MapCustomizationViewController (Private) <UIPickerViewDataSource, UIPickerViewDelegate>

-(void)fillStateCodes;
-(void)fillStateNames;
-(void)createStateCodePicker;
-(void)createStateNamePicker;
-(void)createAccessoryView;

-(void)hideKeyBoard;

@end

@implementation MapCustomizationViewController {
	UIPickerView *_stateCodePickerView;
	UIPickerView *_stateNamePickerView;
	UIView *_inputAccessoryView;
	
	NSArray *_stateCodes;
	NSArray *_stateNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self fillStateCodes];
	[self fillStateNames];
	
	[self createStateCodePicker];
	[self createStateNamePicker];
	[self createAccessoryView];
	
	[_stateCodeTextField setText:_stateCodes[0]];
	[_stateNameTextField setText:_stateNames[0]];
}

- (IBAction)randomizeColors:(id)sender {
	[_delegate randomizeStateColors];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)fillMapWithBlackColor:(id)sender {
	[_delegate fillMapWithBlackColor];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)fillWithRandomColor:(id)sender {
	[_delegate fillMapWithRandomColor];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)setBlackByStateCode:(id)sender {
	[_delegate setBlackColorForStateByCode:_stateCodeTextField.text];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)setRandomByStateCode:(id)sender {
	[_delegate setRandomColorForStateByCode:_stateCodeTextField.text];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)setBlackByStateName:(id)sender {
	[_delegate setBlackColorForStateByName:_stateNameTextField.text];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)setRandomByStateName:(id)sender {
	[_delegate setRandomColorForStateByName:_stateNameTextField.text];
	[self.navigationController popViewControllerAnimated:YES];
}

@end

@implementation MapCustomizationViewController (Private)

-(void)fillStateCodes {
	_stateCodes = @[
		@"AL",
		@"AK",
		@"AR",
		@"AZ",
		@"CA",
		@"CO",
		@"CT",
		@"DE",
		@"FL",
		@"GA",
		@"HI",
		@"ID",
		@"IL",
		@"IN",
		@"IA",
		@"KS",
		@"KY",
		@"LA",
		@"ME",
		@"MD",
		@"MA",
		@"MI",
		@"MN",
		@"MS",
		@"MO",
		@"MT",
		@"NE",
		@"NV",
		@"NH",
		@"NJ",
		@"NM",
		@"NY",
		@"NC",
		@"ND",
		@"OH",
		@"OK",
		@"OR",
		@"PA",
		@"RI",
		@"SC",
		@"SD",
		@"TN",
		@"TX",
		@"UT",
		@"VA",
		@"VT",
		@"WA",
		@"WV",
		@"WI",
		@"WY",
		@"DC"
	];
}

-(void)fillStateNames {
	_stateNames = @[
		@"Alabama",
		@"Alaska",
		@"Arkansas",
		@"Arizona",
		@"California",
		@"Colorado",
		@"Connecticut",
		@"Delaware",
		@"Florida",
		@"Georgia",
		@"Hawaii",
		@"Idaho",
		@"Illinois",
		@"Indiana",
		@"Iowa",
		@"Kansas",
		@"Kentucky",
		@"Louisiana",
		@"Maine",
		@"Maryland",
		@"Massachusetts",
		@"Michigan",
		@"Minnesota",
		@"Mississippi",
		@"Missouri",
		@"Montana",
		@"Nebraska",
		@"Nevada",
		@"New Hampshire",
		@"New Jersey",
		@"New Mexico",
		@"New York",
		@"North Carolina",
		@"North Dakota",
		@"Ohio",
		@"Oklahoma",
		@"Oregon",
		@"Pennsylvania",
		@"Rhode Island",
		@"South Carolina",
		@"South Dakota",
		@"Tennessee",
		@"Texas",
		@"Utah",
		@"Virginia",
		@"Vermont",
		@"Washington",
		@"West Virginia",
		@"Wisconsin",
		@"Wyoming",
		@"District of Columbia"
	];
}

-(void)createStateCodePicker {
	_stateCodePickerView = [[UIPickerView alloc] init];
	_stateCodePickerView.delegate = self;
	_stateCodePickerView.dataSource = self;
	_stateCodePickerView.showsSelectionIndicator = YES;
	
	[_stateCodeTextField setInputView:_stateCodePickerView];
}

-(void)createStateNamePicker {
	_stateNamePickerView = [[UIPickerView alloc] init];
	_stateNamePickerView.delegate = self;
	_stateNamePickerView.dataSource = self;
	_stateNamePickerView.showsSelectionIndicator = YES;
	
	[_stateNameTextField setInputView:_stateNamePickerView];
}

-(void)createAccessoryView {
	_inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
	[_inputAccessoryView setBackgroundColor:[UIColor lightGrayColor]];
	_inputAccessoryView.alpha = 0.8;
	
	UIButton *btnDone = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[btnDone setFrame:CGRectMake(0, 0, 60, 40)];
	[btnDone setTitle:@"Done" forState:UIControlStateNormal];
	[btnDone addTarget:self action:@selector(hideKeyBoard) forControlEvents:UIControlEventTouchUpInside];
	
	[_inputAccessoryView addSubview:btnDone];
	
	[_stateNameTextField setInputAccessoryView:_inputAccessoryView];
	[_stateCodeTextField setInputAccessoryView:_inputAccessoryView];
}

-(void)hideKeyBoard {
	[_stateNameTextField resignFirstResponder];
	[_stateCodeTextField resignFirstResponder];
}

#pragma mark - UIPickerViewDataSource implementation

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return _stateCodes.count;
}

#pragma mark - UIPickerViewDelegate implementation

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if (pickerView == _stateCodePickerView) {
		return _stateCodes[row];
	}
	return _stateNames[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	if (pickerView == _stateCodePickerView) {
		[_stateCodeTextField setText:_stateCodes[row]];
	} else {
		[_stateNameTextField setText:_stateNames[row]];
	}
}

@end
