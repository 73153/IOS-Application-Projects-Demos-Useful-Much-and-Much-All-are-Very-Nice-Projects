//
//  CustomizationViewController.m
//  Overview App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "CustomizationViewController.h"
#import "Task.h"

@implementation CustomizationViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarType = SCNavigationBarTypeAddLeftEditRight;
    
    // Create Task class definition
	SCClassDefinition *taskClassDef = [SCClassDefinition definitionWithClass:[Task class] propertyNamesString:@"name;description;active;priority;categoryIndex"];
	SCPropertyDefinition *namePropertyDef = [taskClassDef propertyDefinitionWithName:@"name"];
	namePropertyDef.attributes = [SCTextFieldAttributes attributesWithPlaceholder:@"enter name"];
	SCPropertyDefinition *descPropertyDef = [taskClassDef propertyDefinitionWithName:@"description"];
	descPropertyDef.type = SCPropertyTypeTextView;
	descPropertyDef.attributes = [SCTextViewAttributes attributesWithMinimumHeight:-1 maximumHeight:200 
																		autoResize:TRUE editable:TRUE];
	[taskClassDef propertyDefinitionWithName:@"active"].type = SCPropertyTypeSwitch;
	SCPropertyDefinition *priorityPropertyDef = [taskClassDef propertyDefinitionWithName:@"priority"];
	priorityPropertyDef.type = SCPropertyTypeSegmented;
	priorityPropertyDef.attributes = [SCSegmentedAttributes attributesWithSegmentTitlesArray:[NSArray arrayWithObjects:@"High", @"Medium", @"Low", nil]];
	SCPropertyDefinition *categoryPropertyDef = [taskClassDef propertyDefinitionWithName:@"categoryIndex"];
	categoryPropertyDef.type = SCPropertyTypeSelection;
	categoryPropertyDef.attributes = [SCSelectionAttributes attributesWithItems:[NSArray arrayWithObjects:@"Home", @"Work", @"Other", nil] 
														 allowMultipleSelection:NO
															   allowNoSelection:NO];
	categoryPropertyDef.title = @"Category";
    
    taskClassDef.cellActions.willDisplay = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        switch (cell.tag) 
        {
            case 0:		// Name
                cell.backgroundColor = [UIColor orangeColor];
                break;
            case 1:		// Description
                cell.backgroundColor = [UIColor yellowColor];
                break;
            case 2:		// Active
                cell.backgroundColor = [UIColor magentaColor];
                break;
            case 3:		// Priority
                cell.backgroundColor = [UIColor redColor];
                break;
            case 4:		// Category Indexes
                cell.backgroundColor = [UIColor greenColor];
                break;
            default:
                break;
        }
    };
	
    
	// Initialize tasksArray
	Task *myTask1 = [[Task alloc] init];
	myTask1.name = @"My Task 1";
	myTask1.description = @"This is a very long description to test if the SCTextViewCell will auto resize to fit its content.";
	myTask1.dueDate = nil;
	Task *myTask2 = [[Task alloc] init];
	myTask2.name = @"My Task 2";
	Task *myTask3 = [[Task alloc] init];
	myTask3.name = @"My Task 3";
	tasksArray = [NSMutableArray arrayWithObjects:myTask1, myTask2, myTask3, nil];
	[myTask1 release];
	[myTask2 release];
	[myTask3 release];
	
	// Create an array of objects section
	SCArrayOfObjectsSection *tasksSection = [SCArrayOfObjectsSection sectionWithHeaderTitle:@"Tasks Section" items:tasksArray itemsDefinition:taskClassDef];
	tasksSection.addButtonItem = self.navigationItem.leftBarButtonItem;
    tasksSection.sectionActions.detailModelWillPresent = ^(SCTableViewSection *section, SCTableViewModel *detailModel, NSIndexPath *indexPath)
    {
        detailModel.modeledTableView.backgroundView = nil;
        detailModel.modeledTableView.backgroundColor = [UIColor cyanColor];
    };
    tasksSection.cellActions.willConfigure = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        cell.height = 70;
        cell.imageView.image = [UIImage imageNamed:@"task.png"];
    };
	[self.tableViewModel addSection:tasksSection];
}




- (void)dealloc 
{
	[tasksArray release];
    
    [super dealloc];
}


@end
