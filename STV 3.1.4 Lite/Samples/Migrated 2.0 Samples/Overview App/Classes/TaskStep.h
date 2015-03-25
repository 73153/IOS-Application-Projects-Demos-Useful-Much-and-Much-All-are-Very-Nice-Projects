//
//  TaskSteps.h
//  Overview App
//
//  Copyright Sensible Cocoa 2010. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TaskStep : NSObject {

	NSString *title;
	NSString *description;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;

@end
