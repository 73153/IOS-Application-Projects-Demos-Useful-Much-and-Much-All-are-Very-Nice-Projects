//
//  MapCustomizationViewController.h
//  USStatesColorMapDemo
//
//  Created by Andrey Cherkashin on 10.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MapCustomizationViewControllerDelegate <NSObject>

-(void)randomizeStateColors;
-(void)fillMapWithBlackColor;
-(void)fillMapWithRandomColor;

-(void)setBlackColorForStateByCode:(NSString*)stateCode;
-(void)setRandomColorForStateByCode:(NSString*)stateCode;

-(void)setBlackColorForStateByName:(NSString*)stateName;
-(void)setRandomColorForStateByName:(NSString*)stateName;

@end

@interface MapCustomizationViewController : UIViewController

@property (nonatomic, weak) id<MapCustomizationViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *stateCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTextField;

- (IBAction)randomizeColors:(id)sender;
- (IBAction)fillMapWithBlackColor:(id)sender;
- (IBAction)fillWithRandomColor:(id)sender;

- (IBAction)setBlackByStateCode:(id)sender;
- (IBAction)setRandomByStateCode:(id)sender;

- (IBAction)setBlackByStateName:(id)sender;
- (IBAction)setRandomByStateName:(id)sender;

@end
