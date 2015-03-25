USStatesColorMap
================

iOS Control for drawing USA states color map using Stately font (http://intridea.github.io/stately/).

Works in iPhone/iPad applications.

![USStatesColorMap Screenshot-iPhone-Example](https://raw.github.com/Eclair/USStatesColorMap/master/Screenshots/screenshot-iPhone_example.png)
![USStatesColorMap Screenshot-iPhone](https://raw.github.com/Eclair/USStatesColorMap/master/Screenshots/screenshot-iPhone.png)
![USStatesColorMap Screenshot-iPad](https://raw.github.com/Eclair/USStatesColorMap/master/Screenshots/screenshot-iPad.png)

Installation
============

You can install this control in two ways:

1. Using CocoaPods: simply add to your podfile

		pod 'USStatesColorMap', '~> 1.0.1'

2. Manually: 

	Download source from this repository and copy USStatesColorMapDemo/USStatesColorMap folder to your project.

	Don't forget to add _*CoreText framework*_ to your project.

How to use
==========

_TIP: To use this control you need to add CoreText Framework to your project._

_TIP: Stately font will be loaded dynamically, so don't add this font to your info.plist file._ 

_TIP: Height of control must be equal to Width, for example: w:320 h:320, w:160 h:160, w:100 h:100, and so on._ 

You can simply add UIView in Interface Builder and change it's class to "USStatesColorMap" (overridden _initWithCoder_ method will be called) or create USStatesColorMap programmatically using _init_ or _initWithFrame_ methods.

USStatesColorMap control's interface provides ability to customize each state separately or fill whole map.
 
If you want to change color for specific state, for example Alaska, you can use one of methods below:

	[self.statesColorMap setColor:color forState:Alaska]; // Alaska = 1
	// or
	[self.statesColorMap setColor:color forStateByCode:@"AK"];
	// or
	[self.statesColorMap setColor:color forStateByName:@"Alaska"];

If you want to fill all states with one color, you can use _setColorForAllStates_ method:

	[self.statesColorMap setColorForAllStates:color];

If you want to make color changes for more than one state, you need to use _performUpdates_ method to avoid map redraw on each state's color change:

	[self.statesColorMap performUpdates:^{
		[self.statesColorMap setColorForAllStates:unactiveStateColor];
		[self.statesColorMap setColor:activeStateColor forState:Alabama];
		[self.statesColorMap setColor:activeStateColor forState:Minnesota];
		[self.statesColorMap setColor:activeStateColor forState:Nebraska];
		[self.statesColorMap setColor:activeStateColor forState:NewMexico];
		// ...
	}];

License (MIT)
=============

Copyright (C) 2013 BeKitzur, Andrey Cherkashin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.