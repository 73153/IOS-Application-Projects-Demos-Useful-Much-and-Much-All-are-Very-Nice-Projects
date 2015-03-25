//
//  USStatesColorMap.h
//  USStatesColorMap
//
//  Created by Andrey Cherkashin on 07.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import "USStatesColorMapHeader.h"

typedef void(^UpdatesBlock)();

/** Class used to create USA map from separate states.
 
 Interface provides ability to customize each state separately or fill whole map.
 
 If you want to change color for specific state, for example Alaska, you can use one of methods below:

	[ setColor:color forState:Alaska]; // Alaska = 1
	// or
	[ setColor:color forStateByCode:@"AK"];
	// or
	[ setColor:color forStateByName:@"Alaska"];
 
 If you want to make color changes for more than one state, you need to use performUpdates method to avoid map redraw on each state's color change:
 
	[ performUpdates:^{
		[ setColorForAllStates:unactiveStateColor];
		[ setColor:activeStateColor forState:Alabama];
		[ setColor:activeStateColor forState:Minnesota];
		[ setColor:activeStateColor forState:Nebraska];
		[ setColor:activeStateColor forState:NewMexico];
		// ...
	}];
 */
@interface USStatesColorMap : UIView

/**---------------------------------------------------------------------------------------
 * @name Methods to customize whole map
 * ---------------------------------------------------------------------------------------
 */

/** Used to set color for all states
 
 @param color color.
 */
-(void)setColorForAllStates:(UIColor*)color;

/**---------------------------------------------------------------------------------------
 * @name Methods to customize states separately
 * ---------------------------------------------------------------------------------------
 */

/** Used to set color for specific state by its index
 
 You can USStates enum (from USStatesColorMapHeader.h) to get index of state you needed
 @param color color.
 @param state index of state.
 */
-(void)setColor:(UIColor*)color forState:(enum USStates)state;

/** Used to set color for specific state by its code ("WA","NY" and so on)
 
 @param color color.
 @param stateCode two-letter code of state.
 */
-(void)setColor:(UIColor*)color forStateByCode:(NSString*)stateCode;

/** Used to set color for specific state by its name ("Alabama","District of Columbia" and so on)
 
 @param color color.
 @param stateName name of state.
 */
-(void)setColor:(UIColor*)color forStateByName:(NSString*)stateName;


/**---------------------------------------------------------------------------------------
 * @name Methods to make multiple updates
 * ---------------------------------------------------------------------------------------
 */

/** Used to make multiple updates without calling redraw on each update.
 
 Draw method will not be called for setColorForAllStates, setColor, etc. methods
 @param updatesBlock block with updates
 */
-(void)performUpdates:(UpdatesBlock)updatesBlock;

@end
