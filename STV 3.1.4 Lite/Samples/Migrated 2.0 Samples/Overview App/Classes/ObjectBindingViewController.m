//
//  ObjectBindingViewController.m
//  Overview App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "ObjectBindingViewController.h"
#import "Task.h"



@implementation ObjectBindingViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
	
	// Add an Add Button and an Edit Button to the navigation item
	self.navigationBarType = SCNavigationBarTypeAddLeftEditRight;
	
	
	// Create TaskStep class definition
	SCClassDefinition *taskStepClassDef = [SCClassDefinition definitionWithClass:[TaskStep class] propertyNamesString:@"title;description"];
	[taskStepClassDef propertyDefinitionWithName:@"description"].type = SCPropertyTypeTextView;
	
	
	// Create Task class definition
	SCClassDefinition *taskClassDef = [SCClassDefinition definitionWithClass:[Task class] propertyNamesString:@"name;dueDate;active;priority;categoryIndex;steps"];
	[taskClassDef propertyDefinitionWithName:@"name"].required = TRUE;
	[taskClassDef propertyDefinitionWithName:@"description"].type = SCPropertyTypeTextView;
	SCPropertyDefinition *priorityPropertyDef = [taskClassDef propertyDefinitionWithName:@"priority"];
	priorityPropertyDef.type = SCPropertyTypeSegmented;
	priorityPropertyDef.attributes = [SCSegmentedAttributes attributesWithSegmentTitlesArray:[NSArray arrayWithObjects:@"High", @"Medium", @"Low", nil]];
	SCPropertyDefinition *categoryPropertyDef = [taskClassDef propertyDefinitionWithName:@"categoryIndex"];
	categoryPropertyDef.type = SCPropertyTypeSelection;
	categoryPropertyDef.attributes = [SCSelectionAttributes attributesWithItems:[NSArray arrayWithObjects:@"Home", @"Work", @"Other", nil] 
														 allowMultipleSelection:NO
															   allowNoSelection:NO];
	categoryPropertyDef.title = @"Category";
	SCPropertyDefinition *stepsPropertyDef = [taskClassDef propertyDefinitionWithName:@"steps"];
	stepsPropertyDef.type = SCPropertyTypeArrayOfObjects;
	stepsPropertyDef.attributes = [SCArrayOfObjectsAttributes attributesWithObjectDefinition:taskStepClassDef
																				 allowAddingItems:YES
																			   allowDeletingItems:YES
																				 allowMovingItems:YES];
	
	// Initialize tasksArray
	Task *myTask1 = [[Task alloc] init];
	myTask1.name = @"My Task 1";
	myTask1.dueDate = nil;
	TaskStep *myTask1Step = [[TaskStep alloc] init];
	myTask1Step.title = @"Preperation";
	myTask1Step.description = @"Prepare for starting the task.";
	[myTask1.steps addObject:myTask1Step];
	[myTask1Step release];
	Task *myTask2 = [[Task alloc] init];
	myTask2.name = @"My Task 2";
	Task *myTask3 = [[Task alloc] init];
	myTask3.name = @"My Task 3";
	_tasksArray = [NSMutableArray arrayWithObjects:myTask1, myTask2, myTask3, nil];
	[myTask1 release];
	[myTask2 release];
	[myTask3 release];
	
	// Create an array of objects section
	SCArrayOfObjectsSection *tasksSection = [SCArrayOfObjectsSection sectionWithHeaderTitle:@"Tasks Section" items:_tasksArray itemsDefinition:taskClassDef];
	tasksSection.addButtonItem = self.addButton;
	[self.tableViewModel addSection:tasksSection];
}




- (void)dealloc 
{	
    [_tasksArray release];
    
    [super dealloc];
}



@end

