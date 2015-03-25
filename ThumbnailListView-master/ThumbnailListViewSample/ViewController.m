//
//  ViewController.m
//  ThumbnailListViewSample
//
//  Created by katsuhisa.ishii on 2013/01/07.
//  Copyright (c) 2013年 katsuhisa.ishii. All rights reserved.
//

#import "ViewController.h"
#import "ThumbnailListView.h"

@interface ViewController ()
<
ThumbnailListViewDataSource,
ThumbnailListViewDelegate
>
@property(strong,nonatomic) IBOutlet ThumbnailListView* thumbnailListView;
@property(strong,nonatomic) IBOutlet UIImageView* imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _thumbnailListView.dataSource = self;
    _thumbnailListView.delegate = self;
    
    [_thumbnailListView reloadData];
    [_thumbnailListView selectAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//=================================================================================
#pragma mark - ThumbnailListViewDataSource
//=================================================================================
- (NSInteger)numberOfItemsInThumbnailListView:(ThumbnailListView*)thumbnailListView
{
    NSLog(@"%s",__func__);
    return 20;
}

- (UIImage*)thumbnailListView:(ThumbnailListView*)thumbnailListView
				 imageAtIndex:(NSInteger)index
{
    NSLog(@"%s index:%d",__func__,index);
    UIImage* thumbnailImage = [UIImage imageNamed:[NSString stringWithFormat:@"test_%03d",index+1]];
    return thumbnailImage;
}

//=================================================================================
#pragma mark - ThumbnailListViewDelegate
//=================================================================================
- (void)thumbnailListView:(ThumbnailListView*)thumbnailListView
		 didSelectAtIndex:(NSInteger)index
{
    NSLog(@"%s index:%d",__func__,index);
    UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"test_%03d",index+1]];
    _imageView.image = image;
}

//=================================================================================
#pragma mark - UIScrollViewDelegate
//=================================================================================
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%s",__func__);
    if( decelerate == NO ){
        [_thumbnailListView autoAdjustScroll];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
    [_thumbnailListView autoAdjustScroll];
}

@end
