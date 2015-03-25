//
//  TAVIPickerViewController.m
//
//  Created by TaviscaIOS on 9/12/12.
//  Copyright (c) 2012 Tavisca. All rights reserved.
//

#import "TVPickerViewController.h"
#import "TVPickerView.h"

#define kProgramaticallyAddedTvPickerViewTag 10

@interface TVPickerViewController () <TVPickerViewDelegate,TVPickerViewDatasource> {
    NSArray *_array;
}
@property (weak, nonatomic) IBOutlet TVPickerView *tvPickerView;
@property (weak, nonatomic) IBOutlet UILabel *programaticallyAddedTvPickerViewValue;
@property (weak, nonatomic) IBOutlet UILabel *ibTvPickerViewValue;

- (IBAction)getData:(id)sender;
@end

@implementation TVPickerViewController
@synthesize tvPickerView = _tvPickerView;
@synthesize programaticallyAddedTvPickerViewValue = _programaticallyAddedTvPickerViewValue, ibTvPickerViewValue = _ibTvPickerViewValue;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _array = [[NSArray alloc] initWithObjects: @"< 1",@"1",@"2",@"3",@"4",@"5",@"6",nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tvPickerView setDelegate:self];
    [_tvPickerView setDatasource:self];
    [_tvPickerView setContentTextFont:[UIFont boldSystemFontOfSize:20]];
    
    TVPickerView *programaticallyCreatedTvPickerView = [[TVPickerView alloc] initWithFrame:CGRectMake(67, 100, 186, 40)];
    [programaticallyCreatedTvPickerView setDatasource:self];
    [programaticallyCreatedTvPickerView setContentTextColor:[UIColor blueColor]];
    [programaticallyCreatedTvPickerView setIncrementDecrementTextColor:[UIColor redColor]];
    [programaticallyCreatedTvPickerView setContentTextColor:[UIColor blueColor]];
    [programaticallyCreatedTvPickerView setTag:kProgramaticallyAddedTvPickerViewTag];
    [self.view addSubview:programaticallyCreatedTvPickerView];

    programaticallyCreatedTvPickerView.block = ^(int index){
        return [_array objectAtIndex:index];
    };
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}

- (NSString*) tvPickerView:(TVPickerView *)tvPickerView titleForIndex:(NSInteger)index {
    return [_array objectAtIndex:index];    
}

- (NSInteger)numberOfElementsInTVPickerViewView {
    return [_array count];
}

- (IBAction)getData:(id)sender {
    TVPickerView *programaticallyCreatedTvPickerView = (TVPickerView*)[self.view viewWithTag:kProgramaticallyAddedTvPickerViewTag];
    
    _ibTvPickerViewValue.text = [_array objectAtIndex:[_tvPickerView selectedIndex]];
    
    _programaticallyAddedTvPickerViewValue.text = [_array objectAtIndex:[programaticallyCreatedTvPickerView selectedIndex]];
}
@end
