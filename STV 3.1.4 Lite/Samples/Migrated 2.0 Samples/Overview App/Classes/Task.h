//
//  Task.h
//   


#import <Foundation/Foundation.h>
#import "TaskStep.h"


@interface Task : NSObject 

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSDate *dueDate;
@property (nonatomic, assign) BOOL active;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) NSInteger categoryIndex;
@property (nonatomic, readonly) NSMutableArray *steps;

- (void)logTask;

@end
