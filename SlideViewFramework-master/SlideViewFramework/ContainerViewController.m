//
//  ContainerViewController.m
//  Lodge
//
//  Created by Heather Snepenger on 9/17/12.
//
//

#import "ContainerViewController.h"
#import <QuartzCore/QuartzCore.h>

#define DEFAULT_SHADOW_WIDTH -3.0
#define DEFAULT_SHADOW_HEIGHT 0.5
#define DEFAULT_SHADOW_OPACITY 0.5

static NSInteger height;
static CGRect size;

@interface ContainerViewController (){
    NSMutableArray *privateArray;
    
    UIPanGestureRecognizer *firstGesture;
    UIPanGestureRecognizer *secondGesture;
}

@end

@implementation ContainerViewController
@synthesize mainView;
@synthesize firstLayerView;
@synthesize secondLayerView;

@synthesize secondViewIgnoreView;

@synthesize mainViewController = _mainViewController;
@synthesize firstLayerViewController = _firstLayerViewController;
@synthesize secondLayerViewController = _secondLayerViewController;



//Custom init for 3 VCs
- (id)initWithBaseViewController:(UIViewController *)bViewController andFirst:(UIViewController *)fViewController andSecond:(UIViewController *)sViewController
{
    self = [super init];
    if(self){
        [self setMainViewController:bViewController];
        [self setFirstLayerViewController:fViewController];
        [self setSecondLayerViewController:sViewController];
    }
    return self;
}

- (void)loadView{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor greenColor];
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainView = [[UIView alloc] initWithFrame:[self screenSize]];
    self.firstLayerView = [[UIView alloc] initWithFrame:[self screenSize]];
    self.secondLayerView = [[UIView alloc] initWithFrame:[self screenSize]];
    
    [self.view addSubview:mainView];
    [self.view addSubview:firstLayerView];
    [self.view addSubview:secondLayerView];
    
    [self updateMainView];
    [self updateFirstLayerView];
    [self updateSecondLayerView];
    
    firstGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(implementFirstLayerSlide:)];
    [self.firstLayerView addGestureRecognizer:firstGesture];
    
    secondGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(implementSecondLayerSlide:)];
    [self.secondLayerView addGestureRecognizer:secondGesture];
    
    [self enableFirstPaneSlide:YES];
    
    [self slideToMainView];
    
    //If the firstLayerViewController is nil, hide the view from the screen
    if (!self.firstLayerViewController) {
        [firstLayerView setFrame:CGRectMake(320, 0, 320, [self screenHeight])];
    }
    //If the secondLayerViewController is nil, hide the view from the screen
    if (!self.secondLayerViewController) {
        [secondLayerView setFrame:CGRectMake(320, 0, 320, [self screenHeight])];
    }
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self setMainView:nil];
    [self setFirstLayerView:nil];
    [self setSecondLayerView:nil];
    
    [self setMainViewController:nil];
    [self setFirstLayerViewController:nil];
    [self setSecondLayerViewController:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


//Allow the user to remove the swipe
- (void)removeSwipe{
    [self.firstLayerView removeGestureRecognizer:firstGesture];
    [self.secondLayerView removeGestureRecognizer:secondGesture];
}

- (void)enableFirstPaneSlide:(BOOL)enable{
    self.firstSlideEnabled = enable;
}

- (void)updateMainView
{
    _mainViewController.view.frame = mainView.frame;
    
    [mainView addSubview:_mainViewController.view];
}

- (void)setMainViewController:(UIViewController *)mainViewController
{
    _mainViewController = mainViewController;
    
    // handle view controller hierarchy
    if(_mainViewController){
        [self addChildViewController:_mainViewController];
        [_mainViewController didMoveToParentViewController:self];
        
        if ([self isViewLoaded]) {
            [self updateMainView];
        }
    }else{
        [[mainView subviews]
         makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
}

- (void)updateFirstLayerView
{
    _firstLayerViewController.view.frame = CGRectMake(0, 0, 320, [self screenHeight]);//firstLayerView.frame;
    
    [self addDropShadow:self.firstLayerView];
    
    [firstLayerView addSubview:_firstLayerViewController.view];
    [firstLayerView bringSubviewToFront:_firstLayerViewController.view];
    
}

- (void)setFirstLayerViewController:(UIViewController *)firstLayerViewController
{
    _firstLayerViewController = firstLayerViewController;
    
    // handle view controller hierarchy
    if(_firstLayerViewController){
        [self addChildViewController:_firstLayerViewController];
        [_firstLayerViewController didMoveToParentViewController:self];
        
        if ([self isViewLoaded]) {
            [self updateFirstLayerView];
        }
    }else{
        [[firstLayerView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
}

- (void)updateSecondLayerView
{
    _secondLayerViewController.view.frame = CGRectMake(0, 0, 320, [self screenHeight]);//secondLayerView.frame;
    
    //Only add the drop shadow if the second view controller isn't nil
    if (_secondLayerViewController) {
        [self addDropShadow:self.secondLayerView];
        [secondLayerView addSubview:_secondLayerViewController.view];
    }else{
        [self.secondLayerView removeFromSuperview];
        [self.secondLayerView setHidden:YES];
    }
    
}

- (void)setSecondLayerViewController:(UIViewController *)secondLayerViewController
{
    _secondLayerViewController = secondLayerViewController;
    
    // handle view controller hierarchy
    if(_secondLayerViewController){
        [self addChildViewController:_secondLayerViewController];
        [_secondLayerViewController didMoveToParentViewController:self];
        
        if ([self isViewLoaded]) {
            [self updateSecondLayerView];
        }
    }else{
        [[secondLayerView subviews]
         makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) implementFirstLayerSlide:(UIPanGestureRecognizer *)sender
{
    
    if(([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) && self.firstSlideEnabled){
        
        CGPoint translation = [sender translationInView:[self.firstLayerView superview]];
        [self.firstLayerView setCenter:CGPointMake(MAX([self.firstLayerView center].x + translation.x, 160),  [self.firstLayerView center].y)];
        [sender setTranslation:CGPointZero inView:[self.firstLayerView superview]];
        
        if(self.firstLayerView.frame.origin.x > 260){
            [self.secondLayerView setCenter:CGPointMake(MAX([self.secondLayerView center].x + translation.x, 160),  [self.secondLayerView center].y)];
            [sender setTranslation:CGPointZero inView:[self.secondLayerView superview]];
        }
        
    }else if(([sender state] == UIGestureRecognizerStateEnded) && self.firstSlideEnabled){
        CGPoint velocity = [sender velocityInView:self.view];
        if(self.firstLayerView.frame.origin.x < 200){
            
            if(velocity.x > 100){
                if(self.firstLayerView.frame.origin.x < 275){
                    
                    float distance = abs(self.firstLayerView.frame.origin.x - 290);
                    float time = MIN(distance / velocity.x, 0.3);

                    [UIView animateWithDuration:time
                                          delay:0
                                        options:UIViewAnimationOptionCurveEaseOut
                                     animations:^{
                                         self.secondLayerView.frame = CGRectMake(315, 0, 320, [self screenHeight]);
                                         self.firstLayerView.frame = CGRectMake(290, 0, 320, [self screenHeight]);
                                     }
                                     completion:^(BOOL finished){
                                         
                                         [UIView animateWithDuration:0.15
                                                          animations:^{
                                                              self.secondLayerView.frame = CGRectMake(310, 0, 320, [self screenHeight]);
                                                              self.firstLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                                              
                                                          }
                                                          completion:^(BOOL finished){
                                                              self.secondLayerViewController.view.userInteractionEnabled = YES;
                                                              self.isSecondViewHidden = NO;
                                                          }];
                                         
                                     }];
                }else {
                    
                    float distance = abs(self.firstLayerView.frame.origin.x - 275);
                    float time = MIN(distance / velocity.x, 0.3);
                    
                    [UIView animateWithDuration:time
                                          delay:0
                                        options:UIViewAnimationOptionCurveEaseOut
                                     animations:^{
                                         self.secondLayerView.frame = CGRectMake(310, 0, 320, [self screenHeight]);
                                         self.firstLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                         
                                     }
                                     completion:^(BOOL finished){
                                         self.secondLayerViewController.view.userInteractionEnabled = YES;
                                         self.isSecondViewHidden = NO;
                                     }];
                }
            }else{
                                
                float distance = abs(self.firstLayerView.frame.origin.x);
                float time = MIN(distance / velocity.x, 0.3);
                
                [UIView animateWithDuration:time
                                      delay:0
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     self.firstLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                                     self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                 }
                                 completion:^(BOOL finished) {
//                                     self.firstLayerViewController.tableView.scrollEnabled = YES;
                                     self.secondLayerViewController.view.userInteractionEnabled = YES;
//                                     self.firstLayerViewController.tableView.userInteractionEnabled = YES;
                                     self.isSecondViewHidden = NO;
                                 }
                 ];
            }
            
        }else {
            
            if(self.firstLayerView.frame.origin.x < 275){
                
                float distance = abs(self.firstLayerView.frame.origin.x - 290);
                float time = MIN(distance / velocity.x, 0.3);
                
                [UIView animateWithDuration:time
                                      delay:0
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     self.secondLayerView.frame = CGRectMake(315, 0, 320, [self screenHeight]);
                                     self.firstLayerView.frame = CGRectMake(290, 0, 320, [self screenHeight]);
                                 }
                                 completion:^(BOOL finished){
                                     
                                     [UIView animateWithDuration:0.15
                                                           delay:0
                                                         options:UIViewAnimationOptionCurveEaseOut
                                                      animations:^{
                                                          self.secondLayerView.frame = CGRectMake(310, 0, 320, [self screenHeight]);
                                                          self.firstLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                                      }
                                                      completion:^(BOOL finished){
                                                          self.secondLayerViewController.view.userInteractionEnabled = YES;
                                                          self.isSecondViewHidden = NO;
                                                      }];
                                     
                                 }];
            }else {
                
                float distance = abs(self.firstLayerView.frame.origin.x - 275);
                float time = MIN(distance / velocity.x, 0.3);
                
                [UIView animateWithDuration:time
                                      delay:0
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     self.secondLayerView.frame = CGRectMake(310, 0, 320, [self screenHeight]);
                                     self.firstLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                 }
                                 completion:^(BOOL finished){
                                     self.secondLayerViewController.view.userInteractionEnabled = YES;
                                     self.isSecondViewHidden = NO;
                                 }];
            }
            
        }
    }
}

- (void) implementSecondLayerSlide:(UIPanGestureRecognizer *)sender
{
    if(self.firstLayerView.frame.origin.x < 2){
        if([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged){
            
            CGPoint translation = [sender translationInView:[sender.view superview]];
            [sender.view setCenter:CGPointMake(MAX([sender.view center].x + translation.x, 160), [sender.view center].y)];
            [sender setTranslation:CGPointZero inView:[sender.view superview]];
            
        }else if([sender state] == UIGestureRecognizerStateEnded){
            CGPoint velocity = [sender velocityInView:self.view];
            if(self.secondLayerView.frame.origin.x < 200){
                
                if(velocity.x > 100){
                    
                    float distance = abs(self.secondLayerView.frame.origin.x - 290);
                    float time = MIN(distance / velocity.x, 0.3);
                    
                    if(self.secondLayerView.frame.origin.x < 275){
                        [UIView animateWithDuration:time
                                              delay:0
                                            options:UIViewAnimationOptionCurveEaseOut
                                         animations:^{
                                             self.secondLayerView.frame = CGRectMake(290, 0, 320, [self screenHeight]);
                                         }
                                         completion:^(BOOL finished){
                                             
                                             [UIView animateWithDuration:0.15
                                                                   delay:0
                                                                 options:UIViewAnimationOptionCurveEaseOut
                                                              animations:^{
                                                                  self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                                                  
                                                              }
                                                              completion:^(BOOL finished){
                                                                  self.secondLayerViewController.view.userInteractionEnabled = YES;
                                                                  self.secondLayerViewController.navigationItem.leftBarButtonItem.enabled = NO;
                                                                  self.isSecondViewHidden = NO;
                                                              }];
                                             
                                         }];
                    }else {
                        
                        float distance = abs(self.secondLayerView.frame.origin.x - 275);
                        float time = MIN(distance / velocity.x, 0.3);
                        [UIView animateWithDuration:time
                                              delay:0
                                            options:UIViewAnimationOptionCurveEaseOut
                                         animations:^{
                                             self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                             
                                         }
                                         completion:^(BOOL finished){
                                             self.secondLayerViewController.view.userInteractionEnabled = YES;
                                             self.secondLayerViewController.navigationItem.leftBarButtonItem.enabled = NO;
                                             self.isSecondViewHidden = NO;
                                         }];
                    }
                }else{
                    float distance = abs(self.secondLayerView.frame.origin.x);
                    float time = MIN(distance / velocity.x, 0.3);
                    [UIView animateWithDuration:time
                                          delay:0
                                        options:UIViewAnimationOptionCurveEaseOut
                                     animations:^{
                                         self.secondLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                                     }
                                     completion:^(BOOL finished) {
                                         self.secondLayerViewController.view.userInteractionEnabled = YES;
                                         self.secondLayerViewController.navigationItem.leftBarButtonItem.enabled = YES;
                                         self.isSecondViewHidden = NO;
                                     }
                     ];
                }
                
            }else {
                float distance = abs(self.secondLayerView.frame.origin.x - 275);
                float time = MIN(distance / velocity.x, 0.3);
                [UIView animateWithDuration:time
                                      delay:0
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                                 }
                                 completion:^(BOOL finished) {
                                     self.secondLayerViewController.view.userInteractionEnabled = YES;
                                     self.secondLayerViewController.navigationItem.leftBarButtonItem.enabled = NO;
                                     self.isSecondViewHidden = NO;
                                 }
                 ];
            }
        }
    } else {
        [self implementFirstLayerSlide:sender];
    }
}

- (void)slideInMainView
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.secondLayerView.frame = CGRectMake(310, 0, 320, [self screenHeight]);
                         self.firstLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                         self.isSecondViewHidden = NO;
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    
}

- (void)slideToMainView
{
    if(self.firstLayerView.frame.origin.x < 5){
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.secondLayerView.frame = CGRectMake(310, 0, 320, [self screenHeight]);
                             self.firstLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                         }
                         completion:^(BOOL finished){
                             self.secondLayerViewController.view.userInteractionEnabled = YES;
                             self.isSecondViewHidden = NO;
                         }];
    }else {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                             self.firstLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                         }
                         completion:^(BOOL finished){
                             self.secondLayerViewController.view.userInteractionEnabled = YES;
                             self.isSecondViewHidden = NO;
                         }];
    }
    [self.delegate firstDidSlideToMain:self.firstLayerViewController];
    
}

//Make the first layer view the visible one
- (void)slideInFirstLayerView
{
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.firstLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                         self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                     }
                     completion:^(BOOL finished){
                         self.firstLayerViewController.view.userInteractionEnabled = YES;
                         self.secondLayerViewController.view.userInteractionEnabled = YES;
                         self.isSecondViewHidden = NO;
                     }];
}


- (void) slideToFirstLayerView
{
    //If the second layer is covering the first layer, slide it out of view
    if(self.secondLayerView.frame.origin.x < 5){
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.secondLayerView.frame = CGRectMake(275, 0, 320, [self screenHeight]);
                         }
                         completion:^(BOOL finished) {
                             self.firstLayerViewController.view.userInteractionEnabled = YES;
                             self.secondLayerViewController.view.userInteractionEnabled = YES;
                             self.isSecondViewHidden = NO;
                         }
         ];
    //Otherwise slide the second layer view over the first one
    }else{
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.secondLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                         }
                         completion:^(BOOL finished) {
                             self.secondLayerViewController.view.userInteractionEnabled = YES;
                             self.isSecondViewHidden = NO;
                         }
         ];
    }
}

- (void) slideInSecondLayerView
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.firstLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                         self.secondLayerView.frame = CGRectMake(0, 0, 320, [self screenHeight]);
                     }
                     completion:^(BOOL finished) {
                         self.secondLayerView.userInteractionEnabled = YES;
                         self.isSecondViewHidden = NO;
                     }
     ];
}

- (void) handleSlideFirstView{
    if (self.firstLayerView.frame.origin.x == 0) {
        [self slideToMainView];
    }else{
        [self slideInFirstLayerView];
    }
}

- (void) handleSlideSecondView{
    if (self.secondLayerView.frame.origin.x == 0) {
        [self slideToFirstLayerView];
    }else{
        [self slideInSecondLayerView];
    }
}

- (void) hideSecondView{
    self.secondLayerView.frame = CGRectMake(320, 0, 320, [self screenHeight]);
    self.isSecondViewHidden = YES;
}

- (void) addDropShadow:(UIView *)mView
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:mView.bounds];
    mView.layer.masksToBounds = NO;
    mView.layer.shadowColor = [UIColor blackColor].CGColor;
    if(self.shadowOffset.width == 0 && self.shadowOffset.height == 0)
        mView.layer.shadowOffset = CGSizeMake(DEFAULT_SHADOW_WIDTH, DEFAULT_SHADOW_HEIGHT);
    else mView.layer.shadowOffset = self.shadowOffset;
    if (self.shadowOpacity == 0)
        mView.layer.shadowOpacity = DEFAULT_SHADOW_OPACITY;
    else mView.layer.shadowOpacity = self.shadowOpacity;
    
    mView.layer.shadowPath = shadowPath.CGPath;
}

#pragma mark -
#pragma mark Replacement Methods
- (void)replaceFirstLayerViewControllerWithViewController:(UIViewController *)newViewController{
    [self setFirstLayerViewController:newViewController];
    self.shadowOpacity = 0.2;
    
//    [self updateFirstLayerView];
}

- (void)replaceSecondLayerViewControllerWithViewController:(UIViewController *)newViewController{
    [self setSecondLayerViewController:newViewController];
//    [self updateSecondLayerView];
}


#pragma mark -
#pragma mark Screen Util
- (NSInteger) screenHeight
{
    if (!height) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        height = (int)screenHeight;
    }
    return height;
}

- (CGRect) screenSize
{
    if(size.size.width == 0)
        size = [[UIScreen mainScreen] bounds];
    return size;
}
@end
