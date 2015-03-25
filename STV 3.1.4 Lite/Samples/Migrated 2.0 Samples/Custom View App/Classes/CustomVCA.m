//
//  CustomVCA.m
//  Custom View App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "CustomVCA.h"


@implementation CustomVCA


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    SCTableViewSection *section = [SCTableViewSection section];
	[self.tableViewModel addSection:section];
	[section addCell:[SCTextFieldCell cellWithText:@"First Name"]];
	[section addCell:[SCTextFieldCell cellWithText:@"Last Name"]];
}


@end

