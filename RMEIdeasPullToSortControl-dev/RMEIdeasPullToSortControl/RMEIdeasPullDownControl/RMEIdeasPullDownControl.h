//
//  RMEIdeasPullDownControl.h
//  Back in Touch
//
//  Created by Osagie Zogie-Odigie on 01/06/2013.
//  The MIT License (MIT)
//
//  Copyright (c) 2013 RME-IDEAS Limited
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  If you use this software in a product, an acknowledgment in the product
//  documentation would be appreciated but is not required.
//

#import <UIKit/UIKit.h>


@class RMEIdeasPullDownControl;

@protocol RMEIdeasPullDownControlProtocol <NSObject>
/*
 Informs the delegate that a selection has been made
 */
- (void) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl selectedControlAtIndex:(NSUInteger)controlIndex;


@end

@protocol RMEIdeasPullDownControlDataSource <NSObject>

@required

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl imageForControlAtIndex:(NSUInteger)controlIndex;
- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl selectedImageForControlAtIndex:(NSUInteger)controlIndex;
- (NSString*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl titleForControlAtIndex:(NSUInteger)controlIndex;
- (NSUInteger) numberOfButtonsRequired:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl;


@end

@interface RMEIdeasPullDownControl : UIView
//Tells the control which selection to make.
- (void) selectControlAtIndex:(NSInteger)controlIndex;

//Designated initializer
- (id)initWithDataSource:(id<RMEIdeasPullDownControlDataSource>)dataSource
                delegate:(id<RMEIdeasPullDownControlProtocol>)delegate
        clientScrollView:(UIScrollView*)clientScrollView;

@end
