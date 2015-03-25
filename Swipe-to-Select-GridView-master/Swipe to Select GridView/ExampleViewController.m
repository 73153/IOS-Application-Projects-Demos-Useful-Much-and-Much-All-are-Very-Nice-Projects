//
//  ExampleViewController.m
//  Swipe to Select GridView
//
//  Created by Philip Yu on 4/18/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "ExampleViewController.h"
#import "UIView+Positioning.h"

#define selectedTag 100
#define cellSize 72
#define textLabelHeight 20
#define cellAAcitve 1.0
#define cellADeactive 0.3
#define cellAHidden 0.0
#define defaultFontSize 10.0

#define numOfimg 20

@interface ExampleViewController ()
{
    NSIndexPath *lastAccessed;
}

@end

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    selectedIdx = [[NSMutableDictionary alloc] init];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView setAllowsMultipleSelection:YES];
    
    UIBarButtonItem *btnReset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(resetSelectedCells)];
    self.navigationItem.rightBarButtonItem = btnReset;
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gestureRecognizer];
    [gestureRecognizer setMinimumNumberOfTouches:1];
    [gestureRecognizer setMaximumNumberOfTouches:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return numOfimg * 4;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    return reusableview;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (![cell viewWithTag:selectedTag])
    {
        UILabel *selected = [[UILabel alloc] initWithFrame:CGRectMake(0, cellSize - textLabelHeight, cellSize, textLabelHeight)];
        selected.backgroundColor = [UIColor darkGrayColor];
        selected.textColor = [UIColor whiteColor];
        selected.text = @"SELECTED";
        selected.textAlignment = NSTextAlignmentCenter;
        selected.font = [UIFont systemFontOfSize:defaultFontSize];
        selected.tag = selectedTag;
        selected.alpha = cellAHidden;
        
        [cell.contentView addSubview:selected];
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", [indexPath row] % numOfimg]]];
    [[cell viewWithTag:selectedTag] setAlpha:cellAHidden];
    cell.backgroundView.alpha = cellADeactive;
    
    // You supposed to highlight the selected cell in here; This is an example
    bool cellSelected = [selectedIdx objectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
    [self setCellSelection:cell selected:cellSelected];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(cellSize, cellSize);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [self setCellSelection:cell selected:YES];
    
    [selectedIdx setValue:@"1" forKey:[NSString stringWithFormat:@"%d", indexPath.row]];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [self setCellSelection:cell selected:NO];
    
    [selectedIdx removeObjectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
}

- (void) setCellSelection:(UICollectionViewCell *)cell selected:(bool)selected
{
    cell.backgroundView.alpha = selected ? cellAAcitve : cellADeactive;
    [cell viewWithTag:selectedTag].alpha = selected ? cellAAcitve : cellAHidden;
}

- (void) resetSelectedCells
{
    for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
        [self deselectCellForCollectionView:self.collectionView atIndexPath:[self.collectionView indexPathForCell:cell]];
    }
}

- (void) handleGesture:(UIPanGestureRecognizer *)gestureRecognizer
{    
    float pointerX = [gestureRecognizer locationInView:self.collectionView].x;
    float pointerY = [gestureRecognizer locationInView:self.collectionView].y;

    for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
        float cellSX = cell.frame.origin.x;
        float cellEX = cell.frame.origin.x + cell.frame.size.width;
        float cellSY = cell.frame.origin.y;
        float cellEY = cell.frame.origin.y + cell.frame.size.height;
        
        if (pointerX >= cellSX && pointerX <= cellEX && pointerY >= cellSY && pointerY <= cellEY)
        {
            NSIndexPath *touchOver = [self.collectionView indexPathForCell:cell];
            
            if (lastAccessed != touchOver)
            {
                if (cell.selected)
                    [self deselectCellForCollectionView:self.collectionView atIndexPath:touchOver];
                else
                    [self selectCellForCollectionView:self.collectionView atIndexPath:touchOver];
            }
            
            lastAccessed = touchOver;
        }
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        lastAccessed = nil;
        self.collectionView.scrollEnabled = YES;
    }
    
    
}

- (void) selectCellForCollectionView:(UICollectionView *)collection atIndexPath:(NSIndexPath *)indexPath
{
    [collection selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    [self collectionView:collection didSelectItemAtIndexPath:indexPath];
}

- (void) deselectCellForCollectionView:(UICollectionView *)collection atIndexPath:(NSIndexPath *)indexPath
{
    [collection deselectItemAtIndexPath:indexPath animated:YES];
    [self collectionView:collection didDeselectItemAtIndexPath:indexPath];
}

@end
