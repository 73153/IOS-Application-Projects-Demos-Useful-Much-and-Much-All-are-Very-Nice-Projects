//
//  ViewViewController.h
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TDRatingView.h"
@interface ViewViewController : UIViewController<TDRatingViewDelegate>

{
    TDRatingView * rating1;
    TDRatingView * rating2;
    TDRatingView * rating3;
    
    
}

@end
