//
//  ViewController.m
//  UserDefaults App
//
//  Copyright (c) 2012 Sensible Cocoa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    SCUserDefaultsDefinition *userDefaultsDef = [SCUserDefaultsDefinition definitionWithDictionaryKeyNamesString:@"Login Details:(username,password):Will be automatically signed in; Settings:(message, volume, ringtone)"];
    SCPropertyDefinition *passwordDef = [userDefaultsDef propertyDefinitionWithName:@"password"];
    passwordDef.attributes = [SCTextFieldAttributes attributesWithPlaceholder:nil secureTextEntry:YES autocorrectionType:UITextAutocorrectionTypeNo autocapitalizationType:UITextAutocapitalizationTypeNone];
    SCPropertyDefinition *volumeDef = [userDefaultsDef propertyDefinitionWithName:@"volume"];
    volumeDef.type = SCPropertyTypeSlider;
    volumeDef.attributes = [SCSliderAttributes attributesWithMinimumValue:0 maximumValue:100];
    SCPropertyDefinition *ringtoneDef = [userDefaultsDef propertyDefinitionWithName:@"ringtone"];
    ringtoneDef.type = SCPropertyTypeSelection;
    ringtoneDef.attributes = [SCSelectionAttributes attributesWithItems:[NSArray arrayWithObjects:@"Ring 1", @"Ring 2", @"Ring 3", nil] allowMultipleSelection:NO allowNoSelection:YES];
    
    [self.tableViewModel generateSectionsForUserDefaultsDefinition:userDefaultsDef];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
