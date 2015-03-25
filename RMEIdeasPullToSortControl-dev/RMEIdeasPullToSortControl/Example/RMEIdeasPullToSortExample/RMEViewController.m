//
//  RMEViewController.m
//  RMEIdeasPullToSortExample
//
//  Created by Osagie Zogie-Odigie on 20/07/2013.
//  The MIT License (MIT)
//
//  Copyright (c) 2013 RME-IDEAS Limited
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  If you use this software in a product, an acknowledgment in the product
//  documentation would be appreciated but is not required.
//

#import "RMEViewController.h"
#import "RMECustomCell.h"
#import "RMEIdeasPullDownControl.h"

#define kLastSelected @"kLastSelected"
#define kBrandName @"brandName"
#define kBrandValue @"brandValue"
#define kfoundedDate @"foundedDate"

typedef enum
{
    AtoZ = 0,
    ZtoA,
    HighestToLowest,
    LowestToHighest,
    OldestToNewest,
    NewestToOldest
}
TableSortSortCriteria;

@interface RMEViewController ()<RMEIdeasPullDownControlDataSource, RMEIdeasPullDownControlProtocol>
@property (weak, nonatomic) IBOutlet UITableView *exampleTableView;
@property (strong, nonatomic) RMEIdeasPullDownControl *rmeideasPullDownControl;
@property (strong, nonatomic) NSArray *sortTitlesArray;
@property (strong, nonatomic) NSArray *tableDataArray;
@property (strong, nonatomic) NSArray *mutableTableDataArray;

@end

@implementation RMEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createTableData];
    
    //Create an array of titles to display as different functions are selected by the user.
    self.sortTitlesArray = @[@"Listed from A - Z", @"Listed from Z - A", @"Brand value: HIGHEST - LOWEST", @"Brand value: LOWEST - HIGHEST", @"Founded: OLDEST - NEWEST", @"Founded: NEWEST - OLDEST"];
    
    //Initializing RMEIdeasPullDownControl property using the designated initializer.  
    self.rmeideasPullDownControl = [[RMEIdeasPullDownControl alloc] initWithDataSource:self
                                                                              delegate:self
                                                                      clientScrollView:self.exampleTableView];
    CGRect originalFrame = self.rmeideasPullDownControl.frame;
    self.rmeideasPullDownControl.frame = CGRectMake(0.0, 45.0, originalFrame.size.width, originalFrame.size.height);
    
    //It is recommended that the control is placed behind the client scrollView. Remember to make its background transparent.
    [self.view insertSubview:self.rmeideasPullDownControl belowSubview:self.exampleTableView];
    
    [self.exampleTableView registerNib:[UINib nibWithNibName:@"RMECustomCell" bundle:nil]
                forCellReuseIdentifier:@"RMECustomCell"];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Tell the control what selection to make. In this case we use NSUserDefaults to save and retrieve last selection made.
    [self.rmeideasPullDownControl selectControlAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:kLastSelected]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createTableData
{
    self.tableDataArray = @[@{kBrandName: @"Apple", kBrandValue: @"87 304 000 000", kfoundedDate: @"1976"}, @{kBrandName: @"Samsung Group", kBrandValue: @"58 771 000 000", kfoundedDate: @"1938"}, @{kBrandName: @"Google", kBrandValue: @"52 132 000 000", kfoundedDate: @"1998"}, @{kBrandName: @"Microsoft", kBrandValue: @"45 535 000 000", kfoundedDate: @"1975"}, @{kBrandName: @"Walmart", kBrandValue: @"42 303 000 000", kfoundedDate: @"1962"}, @{kBrandName: @"IBM", kBrandValue: @"37 721 000 000", kfoundedDate: @"1911"}, @{kBrandName: @"General Electric", kBrandValue: @"37 161 000 000", kfoundedDate: @"1892"}, @{kBrandName: @"Amazon", kBrandValue: @"36 788 000 000", kfoundedDate: @"1994"}, @{kBrandName: @"Coca-Cola", kBrandValue: @"34 205 000 000", kfoundedDate: @"1892"}, @{kBrandName: @"Verizon", kBrandValue: @"30 729 000 000", kfoundedDate: @"1983"}];
}

#pragma mark - Tableview datasource and delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RMECustomCell *cell = [self.exampleTableView dequeueReusableCellWithIdentifier:@"RMECustomCell"];
    cell.mainTitleLabel.text = [[self.mutableTableDataArray objectAtIndex:[indexPath row]] objectForKey:kBrandName];
    
    NSString *foundedDate = [[self.mutableTableDataArray objectAtIndex:[indexPath row]] objectForKey:kfoundedDate];
    cell.subTitleOneLabel.text = [NSString stringWithFormat:@"Founded: %@", foundedDate];
    
    NSString *brandValue = [[self.mutableTableDataArray objectAtIndex:[indexPath row]] objectForKey:kBrandValue];
    cell.subTitleTwoLabel.text = [NSString stringWithFormat:@"Brand value: $%@", brandValue];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mutableTableDataArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - RMEIdeasePullDownControl DataSource and Delegate methods
- (void) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
          selectedControlAtIndex:(NSUInteger)controlIndex
{
    NSSortDescriptor *sortDescriptor = nil;
    NSArray *sortDescriptors = nil;
    switch (controlIndex)
    {
        case AtoZ:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kBrandName ascending:YES];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case ZtoA:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kBrandName ascending:NO];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case HighestToLowest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kBrandValue ascending:NO];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case LowestToHighest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kBrandValue ascending:YES];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case OldestToNewest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kfoundedDate ascending:YES];
            sortDescriptors = @[sortDescriptor];
            break;
            
        case NewestToOldest:
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kfoundedDate ascending:NO];
            sortDescriptors = @[sortDescriptor];
            break;
            
        default:
            break;
    }
    self.mutableTableDataArray = [self.tableDataArray sortedArrayUsingDescriptors:sortDescriptors];
    [self.exampleTableView reloadData];
    
}

- (NSUInteger) numberOfButtonsRequired:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
{
    return 6;
}

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl imageForControlAtIndex:(NSUInteger)controlIndex
{
    UIImage *image0 = [UIImage imageNamed:@"SortAZ.png"];
    UIImage *image1 = [UIImage imageNamed:@"SortZA.png"];
    UIImage *image2 = [UIImage imageNamed:@"HighLow.png"];
    UIImage *image3 = [UIImage imageNamed:@"LowHigh.png"];
    UIImage *image4 = [UIImage imageNamed:@"OldNew.png"];
    UIImage *image5 = [UIImage imageNamed:@"NewOld.png"];
    
    NSArray *imagesArray = @[image0, image1, image2, image3, image4, image5];
    return imagesArray[controlIndex];
}

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
      selectedImageForControlAtIndex:(NSUInteger)controlIndex
{
    UIImage *image0 = [UIImage imageNamed:@"SortAZSelected.png"];
    UIImage *image1 = [UIImage imageNamed:@"SortZASelected.png"];
    UIImage *image2 = [UIImage imageNamed:@"HighLowSelected.png"];
    UIImage *image3 = [UIImage imageNamed:@"LowHighSelected.png"];
    UIImage *image4 = [UIImage imageNamed:@"OldNewSelected.png"];
    UIImage *image5 = [UIImage imageNamed:@"NewOldSelected.png"];
    
    NSArray *imagesArray = @[image0, image1, image2, image3, image4, image5];
    return imagesArray[controlIndex];
}

- (NSString*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
               titleForControlAtIndex:(NSUInteger)controlIndex
{
    return self.sortTitlesArray[controlIndex];
}

@end
