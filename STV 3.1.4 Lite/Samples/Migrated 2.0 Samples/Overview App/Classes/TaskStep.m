//
//  TaskSteps.m
//  Overview App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import "TaskStep.h"


@implementation TaskStep

@synthesize title;
@synthesize description;

- (id)init
{
	title = nil;
	description = nil;
	
	return self;
}

- (void)dealloc
{
	[title release];
	[description release];
	
	[super dealloc];
}

@end
