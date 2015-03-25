//
//  STPhoneFormatter.m
//  STPhoneFormatterExample
//
//  Created by Sebastien Thiebaud on 7/30/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import "STPhoneFormatter.h"

@interface STPhoneFormatter ()

- (void)formatPhoneNumber;
- (NSString *)unformatNumber:(NSString *)phoneNumber;

@end

@implementation STPhoneFormatter
{
    NSArray *_countries;
    NSString *_callingCode;
    NSString *_format;
    int _numberOfDigits;
}

static STPhoneFormatter *_sharedInstance = nil;

+ (STPhoneFormatter *)phoneFormatter
{
    @synchronized(self) {
        if (_sharedInstance == nil) {
            _sharedInstance = [[STPhoneFormatter alloc] init];
        }
    }
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"FormatsCountriesPhone" ofType:@"plist"];
        _countries = [[NSArray alloc] initWithContentsOfFile:path];
                
        _formattedPhoneNumber = [[NSMutableString alloc] init];
        [self setCountryCode:[[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]];
    }
    
    return self;
}

- (void)resetPhoneNumber {
    [_formattedPhoneNumber setString:@""];
}

- (NSArray *)listOfCountrySupported
{
    return _countries;
}

- (BOOL)setCountryCode:(NSString *)countryCode
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(code == %@)", countryCode];
    NSArray *result = [_countries filteredArrayUsingPredicate:predicate];

    if ([result count] == 1) {
        _countryCode = countryCode;
        _countryName = [[result lastObject] objectForKey:@"country"];
        _callingCode = [[result lastObject] objectForKey:@"callcode"];
        _format = [[result lastObject] objectForKey:@"format"];
        _numberOfDigits = [[_format componentsSeparatedByString:@"X"] count] - 1;

        [self formatPhoneNumber];
        
        return YES;
    }
    
    return NO;
}

- (BOOL)phoneNumberMustChangeInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL mustChange = YES;
    
    if (_formattedPhoneNumber.length >= _format.length)
        mustChange = NO;
    
    if (![[NSCharacterSet decimalDigitCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:string]])
        mustChange = NO;
    
    if (range.length == 1)
        mustChange = YES;
    
    if (mustChange == YES) {
        [_formattedPhoneNumber replaceCharactersInRange:range withString:string];
        [self formatPhoneNumber];
    }
    
    return mustChange;
}

- (NSString *)internationalPhoneNumber
{
    return [NSString stringWithFormat:@"+%@%@", _callingCode, [self unformatNumber:_formattedPhoneNumber]];
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
    if (phoneNumber == nil) {
        _formattedPhoneNumber = [NSMutableString new];
    } else {
        _formattedPhoneNumber = [phoneNumber mutableCopy];
    }
    
    [self formatPhoneNumber];
}

- (BOOL)isValid
{
    [self formatPhoneNumber];
    
    if (_formattedPhoneNumber.length == _format.length) {
        return YES;
    }
    
    return NO;
}

- (void)formatPhoneNumber
{
    NSMutableString *formattedNumber = [[NSMutableString alloc] init];
    NSString *number = [self unformatNumber:_formattedPhoneNumber];
    
    int k = 0;
    
    for (int i = 0; i < [_format length]; i++) {
        
        if (k >= [number length])
            break;
            
        NSString *character = [_format substringWithRange:NSMakeRange(i, 1)];
        
        if ([character isEqualToString:@"X"]) {
            [formattedNumber appendString:[number substringWithRange:NSMakeRange(k, 1)]];
            k++;
        } else {
            [formattedNumber appendString:character];
        }
    }
    
    _formattedPhoneNumber = formattedNumber;
}

- (NSString *)unformatNumber:(NSString *)phoneNumber
{
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    return phoneNumber;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"STPhoneFormatter for %@ (%@) with calling code +%@", _countryName, _countryCode, _callingCode];
}

@end
