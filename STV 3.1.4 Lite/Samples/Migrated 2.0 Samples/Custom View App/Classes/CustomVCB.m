//
//  CustomVCB.m
//  Custom View App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "CustomVCB.h"


@implementation CustomVCB


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.backgroundColor = [UIColor clearColor];
	
    SCTableViewSection *section = [SCTableViewSection section];
	[self.tableViewModel addSection:section];
	[section addCell:[SCTextFieldCell cellWithText:@"First Name"]];
	[section addCell:[SCTextFieldCell cellWithText:@"Last Name"]];
	
	SCTableViewSection *section02 = [SCTableViewSection section];
	[self.tableViewModel addSection:section02];
	[section02 addCell:[SCTextFieldCell cellWithText:@"Title"]];
	[section02 addCell:[SCTextFieldCell cellWithText:@"Age"]];
	[section02 addCell:[SCTextFieldCell cellWithText:@"Address"]];
}


@end
