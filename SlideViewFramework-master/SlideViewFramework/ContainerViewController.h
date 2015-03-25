//
//  ContainerViewController.h
//  Lodge
//
//  Created by Heather Snepenger on 9/17/12.
//
// 

#import <UIKit/UIKit.h>

@class ContainerViewController;

@protocol ContainerViewDelegate

-(void)firstDidSlideToMain:(UIViewController *)firstViewController;

@end

@interface ContainerViewController : UIViewController

- (id) initWithBaseViewController:(UIViewController *)bViewController andFirst:(UIViewController *)fViewController andSecond:(UIViewController *)sViewController;

@property (strong) UIView *mainView;
@property (strong) UIView *firstLayerView;
@property (strong) UIView *secondLayerView;

@property (strong) UIView *secondViewIgnoreView;

@property (assign) CGFloat shadowOpacity;
@property (assign) CGSize shadowOffset;

@property (retain, nonatomic) UIViewController *mainViewController;
@property (retain, nonatomic) UIViewController *firstLayerViewController;
@property (retain, nonatomic) UIViewController *secondLayerViewController;

@property (assign) BOOL isSecondViewHidden;

- (void)slideInFirstLayerView;
- (void)slideInMainView;
- (void)slideToMainView;
- (void)slideToFirstLayerView;
- (void)slideInSecondLayerView;

- (void)hideSecondView;

- (void)handleSlideFirstView;
- (void)handleSlideSecondView;

- (void)removeSwipe;

@property (assign) BOOL firstSlideEnabled;

- (void)enableFirstPaneSlide:(BOOL)enable;

- (void)replaceFirstLayerViewControllerWithViewController:(UIViewController *)newViewController;
- (void)replaceSecondLayerViewControllerWithViewController:(UIViewController *)newViewController;

// define delegate property
@property (nonatomic, assign) id <ContainerViewDelegate>  delegate;

@end
