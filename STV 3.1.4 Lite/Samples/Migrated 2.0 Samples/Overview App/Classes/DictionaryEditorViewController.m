//
//  DictionaryEditorViewController.h
//  Overview App
//
//  Copyright 2010-2011 Sensible Cocoa. All rights reserved.
//

#import "DictionaryEditorViewController.h"


@implementation DictionaryEditorViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarType = SCNavigationBarTypeAddLeftEditRight;
    

	SCDictionaryDefinition *dictionaryDef = [SCDictionaryDefinition definitionWithDictionaryKeyNamesString:@"key1;key2;key3"];
	[dictionaryDef propertyDefinitionWithName:@"key2"].type = SCPropertyTypeSwitch;
	[dictionaryDef propertyDefinitionWithName:@"key3"].type = SCPropertyTypeTextView;
	
	_arrayOfDictionaries = [[NSMutableArray alloc] init];
	// Add some dictionaries to the array
	[_arrayOfDictionaries addObject:[NSMutableDictionary dictionary]];
	[_arrayOfDictionaries addObject:[NSMutableDictionary dictionary]];
	[_arrayOfDictionaries addObject:[NSMutableDictionary dictionary]];
	
	
	SCArrayOfObjectsSection *objectsSection = [SCArrayOfObjectsSection sectionWithHeaderTitle:nil items:_arrayOfDictionaries itemsDefinition:dictionaryDef];
	objectsSection.addButtonItem = self.addButton;
    objectsSection.cellActions.willDisplay = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"Dictionary %i", indexPath.row+1];
    };
	[self.tableViewModel addSection:objectsSection];
}

- (void)dealloc {
	
	[_arrayOfDictionaries release];
    [super dealloc];
}


@end

