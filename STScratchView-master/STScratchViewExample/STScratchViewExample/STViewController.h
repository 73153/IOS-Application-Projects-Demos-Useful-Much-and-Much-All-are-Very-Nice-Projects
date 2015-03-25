//
//  STViewController.h
//  STScratchViewExample
//
//  Created by Sebastien Thiebaud on 12/17/12.
//  Copyright (c) 2012 Sebastien Thiebaud. All rights reserved.
//

@class STScratchView;
@interface STViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *dollarsAmount;
@property (nonatomic, strong) IBOutlet STScratchView *scratchView;

@end
