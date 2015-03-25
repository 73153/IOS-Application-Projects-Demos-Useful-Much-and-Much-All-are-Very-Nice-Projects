//
//  ThumbnailListView.h
//  ThumbnailListViewSample
//
//  Created by katsuhisa.ishii on 2013/01/07.
//  Copyright (c) 2013年 katsuhisa.ishii. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThumbnailListView;

//=================================================================================
#pragma mark - ThumbnailListViewDataSource
//=================================================================================
@protocol ThumbnailListViewDataSource <NSObject>

@required

- (NSInteger)numberOfItemsInThumbnailListView:(ThumbnailListView*)thumbnailListView;

- (UIImage*)thumbnailListView:(ThumbnailListView*)thumbnailListView
				 imageAtIndex:(NSInteger)index;

@end

//=================================================================================
#pragma mark - ThumbnailListViewDelegate
//=================================================================================
@protocol ThumbnailListViewDelegate <NSObject, UIScrollViewDelegate>

@optional

- (CGSize)thumbnailListView:(ThumbnailListView *)tableView
		sizeForImageAtIndex:(NSInteger)index;

- (void)thumbnailListView:(ThumbnailListView*)thumbnailListView
		 didSelectAtIndex:(NSInteger)index;

@end

//=================================================================================
#pragma mark - ThumbnailListView
//=================================================================================
@interface ThumbnailListView : UIScrollView

@property (assign, nonatomic) id<ThumbnailListViewDataSource>	dataSource;
@property (assign, nonatomic) id<ThumbnailListViewDelegate>	delegate;

- (void)reloadData;					// 内容リロード
- (void)reloadThumbnailImage;		// サムネイルイメージのみリロード

- (void)selectAtIndex:(NSInteger)index;

- (void)autoAdjustScroll;

@end


//=================================================================================
#pragma mark - ThumbnailView
//=================================================================================
@interface ThumbnailView : UIView

@property (strong, readonly, nonatomic) UIImageView*	imageView;
@property (assign, nonatomic) BOOL						selected;

- (id)initWithFrame:(CGRect)frame
		  imageSize:(CGSize)imageSize;

@end
