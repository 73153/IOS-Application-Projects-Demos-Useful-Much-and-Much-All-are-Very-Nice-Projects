//
//  ValidationViewController.m
//  Overview App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "ValidationViewController.h"


@implementation ValidationViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCClassDefinition *taskClassDef = [SCClassDefinition definitionWithClass:[Task class] propertyNamesString:@"name;dueDate;priority"];
	SCPropertyDefinition *namePropertyDef = [taskClassDef propertyDefinitionWithName:@"name"];
	namePropertyDef.required = TRUE;
	namePropertyDef.cellActions.valueIsValid = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        SCTextFieldCell *textFieldCell = (SCTextFieldCell *)cell;
        
        // Value is valid only if name starts with "my"
        return [textFieldCell.textField.text hasPrefix:@"my"];
    };
    
	[taskClassDef propertyDefinitionWithName:@"dueDate"].required = TRUE;
	SCPropertyDefinition *priorityPropertyDef = [taskClassDef propertyDefinitionWithName:@"priority"];
	priorityPropertyDef.title = @"Priority (1-10)";
	priorityPropertyDef.type = SCPropertyTypeNumericTextField;
	priorityPropertyDef.attributes = [SCNumericTextFieldAttributes attributesWithMinimumValue:[NSNumber numberWithInt:1] 
																				 maximumValue:[NSNumber numberWithInt:10]
																			  allowFloatValue:NO];
	
	myTask = [[Task alloc] init];
	myTask.name = @"myTask";
	
	SCTableViewSection *section = [SCTableViewSection sectionWithHeaderTitle:@"Section Header"];
	[self.tableViewModel addSection:section];
	
	SCObjectCell *objectCell = [SCObjectCell cellWithBoundObject:myTask boundObjectDefinition:taskClassDef];
	[section addCell:objectCell];
}




- (void)dealloc {
	
	[myTask release];
    [super dealloc];
}


@end
