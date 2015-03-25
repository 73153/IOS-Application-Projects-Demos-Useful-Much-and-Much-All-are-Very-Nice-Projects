//
//  ViewController.m
//  USStatesColorMapDemo
//
//  Created by Andrey Cherkashin on 07.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import "ViewController.h"
#import "USStatesColorMap.h"
#import "MapCustomizationViewController.h"

NSInteger const NumOfStates = 51;

@interface ViewController (Private) <MapCustomizationViewControllerDelegate>

-(UIColor*)randomColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)customizeMap:(id)sender {
	MapCustomizationViewController *mapCustomizationViewController;
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    mapCustomizationViewController = [[MapCustomizationViewController alloc] initWithNibName:@"MapCustomizationViewController_iPhone" bundle:nil];
	} else {
	    mapCustomizationViewController = [[MapCustomizationViewController alloc] initWithNibName:@"MapCustomizationViewController_iPad" bundle:nil];
	}
	
	mapCustomizationViewController.delegate = self;
	
	[self.navigationController pushViewController:mapCustomizationViewController animated:YES];
}

@end

@implementation ViewController (Private)

-(UIColor*)randomColor {
	float R = (float)(rand() % 255)/255,
		G = (float)(rand() % 255)/255,
		B = (float)(rand() % 255)/255;
	return [UIColor colorWithRed:R green:G blue:B alpha:1.0];
}

#pragma mark - MapCustomizationViewControllerDelegate implementation

-(void)randomizeStateColors {
	__weak ViewController *safeSelf = self;
	[_statesMap performUpdates:^{
		for (long i = 0; i < NumOfStates; i++) {
			[_statesMap setColor:[safeSelf randomColor] forState:i];
		}
	}];
}

-(void)fillMapWithBlackColor {
	[_statesMap setColorForAllStates:[UIColor blackColor]];
}

-(void)fillMapWithRandomColor {
	[_statesMap setColorForAllStates:[self randomColor]];
}

-(void)setBlackColorForStateByCode:(NSString*)stateCode {
	[_statesMap setColor:[UIColor blackColor] forStateByCode:stateCode];
}

-(void)setRandomColorForStateByCode:(NSString*)stateCode {
	[_statesMap setColor:[self randomColor] forStateByCode:stateCode];
}

-(void)setBlackColorForStateByName:(NSString*)stateName {
	[_statesMap setColor:[UIColor blackColor] forStateByName:stateName];
}

-(void)setRandomColorForStateByName:(NSString*)stateName {
	[_statesMap setColor:[self randomColor] forStateByName:stateName];
}

@end