//
//  USStatesColorMap.m
//  USStatesColorMap
//
//  Created by Andrey Cherkashin on 07.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "USStatesColorMap.h"

NSString const *statesLettersString = @"ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyI";

@interface USStatesColorMap	(Private)

-(void)initialize;

-(BOOL)isStatelyFontRegistered;
-(void)registerStatelyFont;
-(UIFont*)getStatelyFont;

-(int)indexForStateCode:(NSString*)stateCode;
-(int)indexForStateName:(NSString*)stateName;

-(void)beginUpdates;
-(void)endUpdates;

@end

@implementation USStatesColorMap {
	BOOL _controlInitialized;
	BOOL _updateMode;
	
	UIFont *_statesFont;
	NSMutableArray *_colors;
	
	NSDictionary *_statesNames;
	NSDictionary *_statesCodes;
}

-(id)init {
	if (self = [super init]) {
		[self initialize];
	}
	return self;
}

-(id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self initialize];
	}
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self initialize];
	}
	return self;
}

-(void)setColorForAllStates:(UIColor *)color {
	[_colors removeAllObjects];
	for (int i = 0; i < statesLettersString.length; i++) {
		[_colors addObject:color];
	}
	if (!_updateMode) {
		[self setNeedsDisplay];
	}
}

-(void)setColor:(UIColor*)color forState:(enum USStates)state {
	NSAssert(color != nil, @"Color can't be nil");
	[_colors replaceObjectAtIndex:state withObject:color];
	if (!_updateMode) {
		[self setNeedsDisplay];
	}
}

-(void)setColor:(UIColor*)color forStateByCode:(NSString*)stateCode {
	NSAssert(color != nil, @"Color can't be nil");
	[_colors replaceObjectAtIndex:[self indexForStateCode:stateCode] withObject:color];
	if (!_updateMode) {
		[self setNeedsDisplay];
	}
}

-(void)setColor:(UIColor*)color forStateByName:(NSString*)stateName {
	NSAssert(color != nil, @"Color can't be nil");
	[_colors replaceObjectAtIndex:[self indexForStateName:stateName] withObject:color];
	if (!_updateMode) {
		[self setNeedsDisplay];
	}
}

-(void)performUpdates:(UpdatesBlock)updatesBlock {
	[self beginUpdates];
	updatesBlock();
	[self endUpdates];
}

@end

@implementation USStatesColorMap (Private)

-(void)initialize {
	_colors = [NSMutableArray array];
	for (int i = 0; i < statesLettersString.length; i++) {
		[_colors addObject:[UIColor blackColor]];
	}
	
	if (![self isStatelyFontRegistered]) {
		[self registerStatelyFont];
	}
	
	_statesNames = @{
		@"Alabama": @(Alabama),
		@"Alaska": @(Alaska),
		@"Arkansas": @(Arkansas),
		@"Arizona": @(Arizona),
		@"California": @(California),
		@"Colorado": @(Colorado),
		@"Connecticut": @(Connecticut),
		@"Delaware": @(Delaware),
		@"Florida": @(Florida),
		@"Georgia": @(Georgia),
		@"Hawaii": @(Hawaii),
		@"Idaho": @(Idaho),
		@"Illinois": @(Illinois),
		@"Indiana": @(Indiana),
		@"Iowa": @(Iowa),
		@"Kansas": @(Kansas),
		@"Kentucky": @(Kentucky),
		@"Louisiana": @(Louisiana),
		@"Maine": @(Maine),
		@"Maryland": @(Maryland),
		@"Massachusetts": @(Massachusetts),
		@"Michigan": @(Michigan),
		@"Minnesota": @(Minnesota),
		@"Mississippi": @(Mississippi),
		@"Missouri": @(Missouri),
		@"Montana": @(Montana),
		@"Nebraska": @(Nebraska),
		@"Nevada": @(Nevada),
		@"New Hampshire": @(NewHampshire),
		@"New Jersey": @(NewJersey),
		@"New Mexico": @(NewMexico),
		@"New York": @(NewYork),
		@"North Carolina": @(NorthCarolina),
		@"North Dakota": @(NorthDakota),
		@"Ohio": @(Ohio),
		@"Oklahoma": @(Oklahoma),
		@"Oregon": @(Oregon),
		@"Pennsylvania": @(Pennsylvania),
		@"Rhode Island": @(RhodeIsland),
		@"South Carolina": @(SouthCarolina),
		@"South Dakota": @(SouthDakota),
		@"Tennessee": @(Tennessee),
		@"Texas": @(Texas),
		@"Utah": @(Utah),
		@"Virginia": @(Virginia),
		@"Vermont": @(Vermont),
		@"Washington": @(Washington),
		@"West Virginia": @(WestVirginia),
		@"Wisconsin": @(Wisconsin),
		@"Wyoming": @(Wyoming),
		@"District of Columbia": @(DistrictOfColumbia)
	};
	
	_statesCodes = @{
		@"AL": @(Alabama),
		@"AK": @(Alaska),
		@"AR": @(Arkansas),
		@"AZ": @(Arizona),
		@"CA": @(California),
		@"CO": @(Colorado),
		@"CT": @(Connecticut),
		@"DE": @(Delaware),
		@"FL": @(Florida),
		@"GA": @(Georgia),
		@"HI": @(Hawaii),
		@"ID": @(Idaho),
		@"IL": @(Illinois),
		@"IN": @(Indiana),
		@"IA": @(Iowa),
		@"KS": @(Kansas),
		@"KY": @(Kentucky),
		@"LA": @(Louisiana),
		@"ME": @(Maine),
		@"MD": @(Maryland),
		@"MA": @(Massachusetts),
		@"MI": @(Michigan),
		@"MN": @(Minnesota),
		@"MS": @(Mississippi),
		@"MO": @(Missouri),
		@"MT": @(Montana),
		@"NE": @(Nebraska),
		@"NV": @(Nevada),
		@"NH": @(NewHampshire),
		@"NJ": @(NewJersey),
		@"NM": @(NewMexico),
		@"NY": @(NewYork),
		@"NC": @(NorthCarolina),
		@"ND": @(NorthDakota),
		@"OH": @(Ohio),
		@"OK": @(Oklahoma),
		@"OR": @(Oregon),
		@"PA": @(Pennsylvania),
		@"RI": @(RhodeIsland),
		@"SC": @(SouthCarolina),
		@"SD": @(SouthDakota),
		@"TN": @(Tennessee),
		@"TX": @(Texas),
		@"UT": @(Utah),
		@"VA": @(Virginia),
		@"VT": @(Vermont),
		@"WA": @(Washington),
		@"WV": @(WestVirginia),
		@"WI": @(Wisconsin),
		@"WY": @(Wyoming),
		@"DC": @(DistrictOfColumbia)
	};
	
	_controlInitialized = YES;
	
	[self setNeedsDisplay];
}

-(BOOL)isStatelyFontRegistered {
	for (NSString* font in [UIFont fontNamesForFamilyName:@"Stately"]) {
		if ([font isEqualToString:@"font3933"]) {
			return YES;
		}
	}
	return NO;
}

-(void)registerStatelyFont {
	CGDataProviderRef fontDataProvider = CGDataProviderCreateWithFilename([[[NSBundle mainBundle] pathForResource:@"stately" ofType:@"ttf"] UTF8String]);
	
	CGFontRef statelyFontRef =  CGFontCreateWithDataProvider(fontDataProvider);
	CGDataProviderRelease(fontDataProvider);
	
	CFErrorRef error = nil;
	CTFontManagerRegisterGraphicsFont(statelyFontRef, &error);
	
	CGFontRelease(statelyFontRef);
	
	if (error != nil) {
		NSError* err = (__bridge NSError*)error;
		NSLog(@"error code %d desc: %@", err.code, [err description]);
	}
}

-(UIFont*)getStatelyFont {
	return [UIFont fontWithName:@"font3933" size:self.bounds.size.width];
}

-(int)indexForStateCode:(NSString*)stateCode {
	stateCode = [stateCode uppercaseString];
	NSNumber* stateIndex = [_statesCodes objectForKey:stateCode];
	NSAssert(stateIndex != nil, @"Invalid state code: \"%@\"", stateCode);
	return [stateIndex intValue];
}

-(int)indexForStateName:(NSString*)stateName {
	NSNumber* stateIndex = [_statesNames objectForKey:stateName];
	NSAssert(stateIndex != nil, @"Invalid state name: \"%@\"", stateName);
	return [stateIndex intValue];
}

-(void)beginUpdates {
	_updateMode = YES;
}

-(void)endUpdates {
	_updateMode = NO;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	if (_statesFont == nil) {
		_statesFont = [self getStatelyFont];
	}
	
	if (_controlInitialized) {
		CGContextRef context = UIGraphicsGetCurrentContext();
		for (int i = 0; i < statesLettersString.length; i++) {
			CGContextSetFillColorWithColor(context, [_colors[i] CGColor]);
			[[statesLettersString substringWithRange:NSMakeRange(i, 1)] drawAtPoint:CGPointZero withFont:_statesFont];
		}
	}
}

@end
