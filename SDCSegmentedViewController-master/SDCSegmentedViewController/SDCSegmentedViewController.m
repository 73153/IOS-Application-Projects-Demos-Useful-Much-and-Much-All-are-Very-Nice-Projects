//
//  SDCSegmentedViewController.m
//  SDCSegmentedViewController
//
//  Created by Scott Berrevoets on 3/15/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import "SDCSegmentedViewController.h"

NSInteger const DefaultSegmentIndex = 0;

@interface SDCSegmentedViewController ()

@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic) NSInteger currentSelectedIndex;

@property (nonatomic) BOOL hasAppeared;

@end

@implementation SDCSegmentedViewController

#pragma mark - Custom Getters

- (NSMutableArray *)viewControllers {
	if (!_viewControllers)
		_viewControllers = [NSMutableArray array];
    
	return _viewControllers;
}

- (NSMutableArray *)titles {
	if (!_titles)
		_titles = [NSMutableArray array];
    
	return _titles;
}

- (UISegmentedControl *)segmentedControl {
	if (!_segmentedControl) {
		_segmentedControl = [[UISegmentedControl alloc] initWithItems:self.titles];
		_segmentedControl.selectedSegmentIndex = DefaultSegmentIndex;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
		_segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
#endif

		[_segmentedControl addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventValueChanged];
	}
    
	return _segmentedControl;
}

#pragma mark - Custom Setter

- (void)setPosition:(SDCSegmentedViewControllerControlPosition)position {
	_position = position;
	[self moveControlToPosition:position];
}

#pragma mark - Initializers

- (instancetype)initWithViewControllers:(NSArray *)viewControllers {
	return [self initWithViewControllers:viewControllers titles:[viewControllers valueForKeyPath:@"@unionOfObjects.title"]];
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles {
	self = [super init];

	if (self) {
		
		_viewControllers = [NSMutableArray array];
		_titles = [NSMutableArray array];
		
		[viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
			if ([obj isKindOfClass:[UIViewController class]] && index < [titles count]) {
				UIViewController *viewController = obj;

				[_viewControllers addObject:viewController];
				[_titles addObject:titles[index]];
				[self addChildViewController:viewController];
			}
		}];

		if ([_viewControllers count] == 0 || [_viewControllers count] != [_titles count]) {
			self = nil;
			NSLog(@"%@: Invalid configuration of view controllers and titles.", NSStringFromClass([self class]));
		}
	}

	return self;
}

#pragma mark - View Controller Lifecycle

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    
	if ([self.viewControllers count] == 0)
		[NSException raise:@"SDCSegmentedViewControllerException" format:@"SDCSegmentedViewController has no view controllers that it can display."];
	
	if (self.segmentedControl.selectedSegmentIndex == UISegmentedControlNoSegment) {
		self.segmentedControl.selectedSegmentIndex = DefaultSegmentIndex;
		self.currentSelectedIndex = DefaultSegmentIndex;
	}
	
	[self observeViewController:self.viewControllers[self.currentSelectedIndex]];
	
	if (!self.hasAppeared) {
        self.hasAppeared = YES;
        UIViewController *currentViewController = self.viewControllers[self.currentSelectedIndex];

        currentViewController.view.frame = self.view.frame;
        [self.view addSubview:currentViewController.view];

        [currentViewController didMoveToParentViewController:self];

		[self updateBarsForViewController:currentViewController];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[self stopObservingViewController:self.viewControllers[self.currentSelectedIndex]];
}

#pragma mark - Content Management

- (void)addStoryboardSegments:(NSArray *)segments {
	[segments enumerateObjectsUsingBlock:^(NSString *segment, NSUInteger idx, BOOL *stop) {
		[self performSegueWithIdentifier:segment sender:self];
	}];
}

- (void)addViewController:(UIViewController *)viewController {
	if (viewController && viewController.title)
		[self addViewController:viewController withTitle:viewController.title];
	else
		NSLog(@"%@: Can't add view controller (%@) because no title was specified!", NSStringFromClass([self class]), viewController);
}

- (void)addViewController:(UIViewController *)viewController withTitle:(NSString *)title {
	[self.viewControllers addObject:viewController];
	[self.titles addObject:title];
	[self addChildViewController:viewController];
	
	// If the segmented control has not been instantiated yet, lazy instantiation will take care of inserting the first view controller, so no need to do it manually.
	if (_segmentedControl)
		[self.segmentedControl insertSegmentWithTitle:title atIndex:[self.titles indexOfObject:title] animated:YES];
	
	[self.segmentedControl sizeToFit];
}

#pragma mark - View Controller Containment

- (void)moveControlToPosition:(SDCSegmentedViewControllerControlPosition)newPosition {

	switch (newPosition) {
		case SDCSegmentedViewControllerControlPositionNavigationBar:
			self.navigationItem.titleView = self.segmentedControl;
			break;
		case SDCSegmentedViewControllerControlPositionToolbar: {
			UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																					  target:nil
																					  action:nil];
			UIBarButtonItem *control = [[UIBarButtonItem alloc] initWithCustomView:self.segmentedControl];

			self.toolbarItems = @[flexible, control, flexible];

			break;
		}
	}

	if ([self.viewControllers count] > 0) {
		UIViewController *currentViewController = self.viewControllers[self.segmentedControl.selectedSegmentIndex];
		[self updateBarsForViewController:currentViewController];
	}
}

- (void)changeViewController:(UISegmentedControl *)segmentedControl {

	UIViewController *oldViewController = self.viewControllers[self.currentSelectedIndex];
	[oldViewController willMoveToParentViewController:nil];
	[self stopObservingViewController:oldViewController];

	UIViewController *newViewController = self.viewControllers[segmentedControl.selectedSegmentIndex];
	newViewController.view.frame = self.view.frame;

	[self transitionFromViewController:oldViewController
					  toViewController:newViewController
							  duration:0
							   options:UIViewAnimationOptionTransitionNone
							animations:nil
							completion:^(BOOL finished) {
								if (finished) {
									[newViewController didMoveToParentViewController:self];

									[self updateBarsForViewController:newViewController];
									[self observeViewController:newViewController];

									self.currentSelectedIndex = segmentedControl.selectedSegmentIndex;
								}
							}];
}

- (void)updateBarsForViewController:(UIViewController *)viewController {
	if (self.position == SDCSegmentedViewControllerControlPositionToolbar)
		self.title = viewController.title;
	else if (self.position == SDCSegmentedViewControllerControlPositionNavigationBar)
		self.toolbarItems = viewController.toolbarItems;
}

#pragma mark - KVO

- (void)observeViewController:(UIViewController *)viewController {
	[viewController addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
	[viewController addObserver:self forKeyPath:@"toolbarItems" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)stopObservingViewController:(UIViewController *)viewController {
	[self.viewControllers[self.currentSelectedIndex] removeObserver:self forKeyPath:@"title"];
	[self.viewControllers[self.currentSelectedIndex] removeObserver:self forKeyPath:@"toolbarItems"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	[self updateBarsForViewController:object];
}

@end
