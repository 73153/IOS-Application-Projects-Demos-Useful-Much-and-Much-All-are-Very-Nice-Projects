/**
     Copyright 2012 Daniel Lupiañez Casares <lupidan@gmail.com>
     
     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at
     
     http://www.apache.org/licenses/LICENSE-2.0
     
     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.
 */

#import <UIKit/UIKit.h>
#import "UIKeyboardCoView.h"

/**
	Nothing important in this view controller.It just has an Outlet and a Action for hiding the keyboard when the background is touched
 */
@interface ViewController : UIViewController <UIKeyboardCoViewDelegate>

/**
	The text field
 */
@property (retain, nonatomic) IBOutlet UITextField *texField;

/**
	The background was touched
	@param sender The UIControl sender of the event
 */
- (IBAction)backgroundTouchDown:(id)sender;


@end
