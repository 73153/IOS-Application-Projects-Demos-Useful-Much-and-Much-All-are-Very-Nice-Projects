//
//  STPhoneFormatter.h
//  STPhoneFormatterExample
//
//  Created by Sebastien Thiebaud on 7/30/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STPhoneFormatter : NSObject

@property (strong, readonly) NSMutableString *formattedPhoneNumber;
@property (strong, readonly) NSString *countryCode;
@property (strong, readonly) NSString *countryName;

+ (STPhoneFormatter *)phoneFormatter;

- (NSArray *)listOfCountrySupported;
- (NSString *)internationalPhoneNumber;
- (BOOL)setCountryCode:(NSString *)countryCode;
- (BOOL)phoneNumberMustChangeInRange:(NSRange)range replacementString:(NSString *)string;
- (void)resetPhoneNumber;
- (void)setPhoneNumber:(NSString *)phoneNumber;
- (BOOL)isValid;

@end
