//
//  Task.m
//  Sensible App01
//
//  Created by Tarek Sakr on 09/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Task.h"


@implementation Task

@synthesize name;
@synthesize description;
@synthesize dueDate;
@synthesize active;
@synthesize priority;
@synthesize categoryIndex;
@synthesize steps;


- (id)init
{
	name = nil;
	description = nil;
	dueDate = nil;
	active = FALSE;
	priority = 0;
	categoryIndex = 0;
	
	steps = [[NSMutableArray alloc] initWithCapacity:1];
	TaskStep *step1 = [[TaskStep alloc] init];
	step1.title = @"Step placeholder";
	step1.description = @"Placeholder for a task step";
	[steps addObject:step1];
	[step1 release];
	
	return self;
}

- (void)dealloc
{
	[name release];
	[description release];
	[dueDate release];
	
	[steps release];
	
	[super dealloc];
}

- (void)logTask
{
	NSLog(@"\n\nname:%@, description:%@, dueDate:%@, active:%i, priority:%i, categoryIndex:%i",
		  name, description, dueDate, active, priority, categoryIndex);
}

@end
