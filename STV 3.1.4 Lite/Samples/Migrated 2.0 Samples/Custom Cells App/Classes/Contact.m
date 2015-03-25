//
//  Contact.m
//  Custom Cells App
//

#import "Contact.h"

@implementation Contact

- (id)init
{
    self = [super init];
    if(self)
    {
        _firstName = nil;
        _lastName = nil;
        _title = nil;
        _sex = nil;
        _age = 0;
        _karma = 0;
        _notes = nil;
    }
    
    return self;
}

@end
