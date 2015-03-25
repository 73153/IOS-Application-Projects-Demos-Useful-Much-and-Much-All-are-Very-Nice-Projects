//
//  Contact.h
//  Custom Cells App
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSDate *birthDate;
@property (nonatomic) int age;
@property (nonatomic) int karma;
@property (nonatomic, strong) NSString *notes;

@end
