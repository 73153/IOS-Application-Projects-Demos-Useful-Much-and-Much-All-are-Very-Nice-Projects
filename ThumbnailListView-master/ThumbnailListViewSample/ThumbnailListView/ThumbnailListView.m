//
//  ThumbnailListView.m
//  ThumbnailListViewSample
//
//  Created by katsuhisa.ishii on 2013/01/07.
//  Copyright (c) 2013年 katsuhisa.ishii. All rights reserved.
//

#import "ThumbnailListView.h"
#import "UIView+ThumbnailListView.h"
#import <QuartzCore/QuartzCore.h>

//=================================================================================
#pragma mark - PDThumbnailListView
//=================================================================================
@implementation ThumbnailListView

//---------------------------------------------------------------------------------
#pragma mark - Init
//---------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
	
    return self;
}

//---------------------------------------------------------------------------------
#pragma mark - Private
//---------------------------------------------------------------------------------
#pragma mark === UI ===
- (void)setSelectThumbnailView:(ThumbnailView*)thumbnailView
			isCallbackDelegate:(BOOL)isCallbackDelegate
{
	for( UIView* view in self.subviews ){
		if( [view isKindOfClass:[ThumbnailView class]] ){
			BOOL	selected = NO;
			
			if( view == thumbnailView ){
				selected = YES;
				
				if( isCallbackDelegate ){
					// デリゲータに選択インデックスをコールバック(@optional)
					if( self.delegate ){
						if( [self.delegate respondsToSelector:@selector(thumbnailListView:didSelectAtIndex:)] ){
							[self.delegate thumbnailListView:self didSelectAtIndex:[self indexOfSubview:view]];
						}
					}
				}
			}
			((ThumbnailView*)view).selected = selected;
		}
	}
}

#pragma mark === Gesture ===
//---------------------------------------------------------------------------------
- (void)handleTapGesture:(UITapGestureRecognizer*)sender
{
	[self setSelectThumbnailView:(ThumbnailView*)sender.view
			  isCallbackDelegate:YES];
	
	[self autoAdjustScroll];
}

//---------------------------------------------------------------------------------
#pragma mark - Public
//---------------------------------------------------------------------------------
- (void)reloadData
{
	NSInteger	itemCount = [_dataSource numberOfItemsInThumbnailListView:self];	// アイテム個数をデータソースデリゲータから取得
	CGFloat		itemWidth = self.height;
	CGRect		itemFrame = CGRectMake(0.0, 0.0, itemWidth, itemWidth);
	CGSize		contentSize = CGSizeMake(0.0, self.height);
	
	// 一旦すべてのサムネイルビューを削除
	[self removeAllSubviews];
	
	// サムネイルをx方向に配置していく
	for( NSInteger i=0; i<itemCount; i++ ){
		itemFrame.origin.x = itemWidth * i;
		
		CGSize	imageSize = CGSizeZero;
		if( [self.delegate respondsToSelector:@selector(thumbnailListView:sizeForImageAtIndex:)] ){
			imageSize = [self.delegate thumbnailListView:self sizeForImageAtIndex:i];
		}
		ThumbnailView*	thumbnailView = [[ThumbnailView alloc] initWithFrame:itemFrame
																	  imageSize:imageSize];
		[self addSubview:thumbnailView];
		
		// サムネイルビューにタップジェスチャを仕込む
		UITapGestureRecognizer*	tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
		[thumbnailView addGestureRecognizer:tapGesture];
		
		contentSize.width = CGRectGetMaxX(itemFrame);
	}
	
	self.contentSize = contentSize;		// contentSize更新
	self.contentOffset = CGPointZero;	// スクロール状態初期化
	
	// サムネイル画像更新
	[self reloadThumbnailImage];
}

- (void)reloadThumbnailImage
{
	NSInteger	itemCount = [_dataSource numberOfItemsInThumbnailListView:self];	// アイテム個数をデータソースデリゲータから取得
	
	for( NSInteger i=0; i<itemCount; i++ ){
		ThumbnailView*	thumbnailView = (ThumbnailView*)[self subviewAtIndex:i];
		
		// サムネイル画像をデータソースデリゲータから取得して設定
		thumbnailView.imageView.image = [_dataSource thumbnailListView:self
														  imageAtIndex:i];
	}
}

- (void)selectAtIndex:(NSInteger)index
{
	[self setSelectThumbnailView:(ThumbnailView*)[self subviewAtIndex:index]
			  isCallbackDelegate:NO];
}

- (void)autoAdjustScroll
{
	CGFloat	w = self.width / 3;
	CGFloat	offsetX = ((NSInteger)self.contentOffset.x / (NSInteger)w) * w;
	
	if( w/2 < self.contentOffset.x - offsetX ){
		offsetX += w;
	}
	
	[self setContentOffset:CGPointMake(offsetX, 0.0) animated:YES];
}

@end


//=================================================================================
#pragma mark - PDThumbnailView
//=================================================================================
@interface ThumbnailView ()
@property (strong, nonatomic) UIView*	contentView;
@end

@implementation ThumbnailView

//---------------------------------------------------------------------------------
#pragma mark - Init
//---------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
		  imageSize:(CGSize)imageSize
{
    self = [super initWithFrame:frame];
    if (self) {
		frame.origin = CGPointZero;
		
		UIView*	contentView = [[UIView alloc] initWithFrame:frame];
        //		contentView.exclusiveTouch = YES;
		contentView.backgroundColor = [UIColor darkGrayColor];
		contentView.width *= 0.9;
		contentView.height *= 0.9;
		[self addSubview:contentView];
		[contentView centering];
		_contentView = contentView;
		
		if( CGSizeEqualToSize( imageSize, CGSizeZero) ){
			imageSize = CGSizeMake(contentView.width, contentView.height);
		}
		frame.size = imageSize;
		UIImageView*	imageView = [[UIImageView alloc] initWithFrame:frame];
        //		imageView.exclusiveTouch = YES;
		imageView.backgroundColor = [UIColor clearColor];
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		[_contentView addSubview:imageView];
		[imageView centering];
		_imageView = imageView;
    }
	
    return self;
}

//---------------------------------------------------------------------------------
#pragma mark - Public
//---------------------------------------------------------------------------------
- (void)setSelected:(BOOL)selected
{
	UIColor*	backgroundColor = [UIColor darkGrayColor];
	UIColor*	borderColor = nil;
	CGFloat		borderWidth = 0.0;
	
	if( selected ){
		backgroundColor = [UIColor lightGrayColor];
		borderColor = [UIColor whiteColor];
		borderWidth = 2.0;
	}
	_contentView.backgroundColor = backgroundColor;

    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:0.0f] forKey:kCATransactionAnimationDuration];
    
	_contentView.layer.borderColor = borderColor.CGColor;
	_contentView.layer.borderWidth = borderWidth;
	
    [CATransaction commit];
	
	_selected = selected;
}

@end
