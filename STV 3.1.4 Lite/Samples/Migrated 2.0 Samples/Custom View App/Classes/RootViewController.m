//
//  RootViewController.m
//  Custom View App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "RootViewController.h"
#import "CustomVCA.h"
#import "CustomVCB.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCArrayOfStringsSection *section = [SCArrayOfStringsSection sectionWithHeaderTitle:nil items:[NSMutableArray arrayWithObjects:@"CustomVC A", @"CustomVC B", nil]];
	section.allowDeletingItems = FALSE;
	[self.tableViewModel addSection:section];
    
    section.cellActions.didSelect = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        switch (indexPath.row) 
        {
            case 0:
            {
                CustomVCA *customVCA = [[CustomVCA alloc] initWithStyle:UITableViewStyleGrouped];
                [self.navigationController pushViewController:customVCA animated:YES];
                [customVCA release];
            }
                break;
            case 1:
            {
                CustomVCB *customVCB = [[CustomVCB alloc] initWithNibName:@"CustomVCB" bundle:nil];
                [self.navigationController pushViewController:customVCB animated:YES];
                [customVCB release];
            }
                break;
        }
    };
}


@end

