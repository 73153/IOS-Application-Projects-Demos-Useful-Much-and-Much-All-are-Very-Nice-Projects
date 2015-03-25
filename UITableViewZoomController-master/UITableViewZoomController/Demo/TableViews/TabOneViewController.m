//
//  TabTwoViewController.m
//  UITableViewZoomController
//
//  Created by Thomas Thorpe on 25/02/2013.
//  Copyright (c) 2013 Thomas Thorpe. All rights reserved.
//

#import "TabOneViewController.h"

@implementation TabOneViewController

/**
 This example uses all the default values of the properties for the table view zoom controller, and doesn't change anything. It uses a custom cell view "FancyCellView" to display an image in each cell rather than text.
 */
-(void)viewDidLoad{
    [self.tableView registerNib:[UINib nibWithNibName:@"FancyCellView" bundle:nil]
         forCellReuseIdentifier:@"FancyCellView"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 204;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FancyCellView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}



@end
