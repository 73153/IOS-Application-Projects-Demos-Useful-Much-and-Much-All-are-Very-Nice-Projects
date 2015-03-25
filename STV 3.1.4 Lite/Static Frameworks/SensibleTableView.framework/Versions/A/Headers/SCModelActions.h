/*
 *  SCModelActions.h
 *  Sensible TableView
 *  Version: 3.1.4
 *
 *
 *	THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY UNITED STATES 
 *	INTELLECTUAL PROPERTY LAW AND INTERNATIONAL TREATIES. UNAUTHORIZED REPRODUCTION OR 
 *	DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES. YOU SHALL NOT DEVELOP NOR
 *	MAKE AVAILABLE ANY WORK THAT COMPETES WITH A SENSIBLE COCOA PRODUCT DERIVED FROM THIS 
 *	SOURCE CODE. THIS SOURCE CODE MAY NOT BE RESOLD OR REDISTRIBUTED ON A STAND ALONE BASIS.
 *
 *	USAGE OF THIS SOURCE CODE IS BOUND BY THE LICENSE AGREEMENT PROVIDED WITH THE 
 *	DOWNLOADED PRODUCT.
 *
 *  Copyright 2012 Sensible Cocoa. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */


#import <Foundation/Foundation.h>

@class SCTableViewModel;
@class SCArrayOfItemsModel;

typedef void(^SCModelAction_Block)(SCTableViewModel *tableModel);

typedef void(^SCDidFetchModelItemsAction_Block)(SCArrayOfItemsModel *itemsModel, NSMutableArray *items);
typedef NSString*(^SCSectionHeaderTitleForItemAction_Block)(SCArrayOfItemsModel *itemsModel, NSObject *item, NSUInteger itemIndex);


/****************************************************************************************/
/*	class SCModelActions	*/
/****************************************************************************************/ 
/**	
 This class hosts a set of model action blocks. Once an action is set to a desired code block, it will execute the block as soon as the action occurs.
 
 @see SCSectionActions, SCCellActions.
 */

@interface SCModelActions : NSObject



//////////////////////////////////////////////////////////////////////////////////////////
/// @name Actions
//////////////////////////////////////////////////////////////////////////////////////////

/** Action gets called as soon as the model has refreshed its contents after returning from a pull-to-refresh operation.
 
 Example:
    modelActions.didRefresh = ^(SCTableViewModel *tableModel)
    {
        NSLog(@"The model has been refreshed.");
    };
 
 */
@property (nonatomic, copy) SCModelAction_Block didRefresh;

//////////////////////////////////////////////////////////////////////////////////////////
/// @name SCArrayOfItemsModel Actions
//////////////////////////////////////////////////////////////////////////////////////////


/** Action gets called as soon as the model has retrieved its items from their data store.
 
 This action is typically used to customize the 'items' array after it has been fetched from the data store. Items can be added, removed, or rearranged. The added items can either be objects that are suppored by the data store, or normal SCTableViewCell (or subclass) objects.
 
 Example:
    modelActions.didFetchItemsFromStore = ^(SCArrayOfItemsModel *itemsModel, NSMutableArray *items)
    {
        // Add a button cell at the end of the fetched items list
        SCTableViewCell *buttonCell = [SCTableViewCell cellWithText:@"Tap me!" textAlignment:UITextAlignmentCenter];
        buttonCell.cellActions.didSelect = ^(SCTableViewCell *cell, NSIndexPath *indexPath)
        {
            NSLog(@"buttonCell tapped!");
        };
 
        [items addObject:buttonCell];
    };
 
 @note This action is only applicable to SCArrayOfItemsModel subclasses, such as SCArrayOfObjectsModel. 
 
 */
@property (nonatomic, copy) SCDidFetchModelItemsAction_Block didFetchItemsFromStore;


/** Action gets called when SCArrayOfItemsModel requests a section header title for each of its items.
 
 Use this action to control how the automatically generated sections are created. In the following example, a new section will be created for each group of items sharing the same first letter (i.e.: items will be grouped alphabetically).
 
 Example:
    modelActions.sectionHeaderTitleForItem = ^NSString*(SCArrayOfItemsModel *itemsModel, NSObject *item, NSUInteger itemIndex)
    {
        NSString *objectName = (NSString *)[item valueForKey:@"firstName"];
 
        // Return first charcter of objectName
        return [[objectName substringToIndex:1] uppercaseString];
    };
 */
 @property (nonatomic, copy) SCSectionHeaderTitleForItemAction_Block sectionHeaderTitleForItem;



//////////////////////////////////////////////////////////////////////////////////////////
/// @name Miscellaneous
//////////////////////////////////////////////////////////////////////////////////////////

/** The owner table view model of the actions object.
 *
 * @warning This property gets set automatically by the framework, you should never set this property manually */
@property (nonatomic, unsafe_unretained) SCTableViewModel *ownerTableViewModel;

/** Method assigns all the actions of another 'SCModelActions' class to the current one.
 
 @param actions The source 'SCModelActions' class.
 @param override Set to TRUE to override any existing actions, otherwise set to FALSE.
 */
- (void)setActionsTo:(SCModelActions *)actions overrideExisting:(BOOL)override;

@end
