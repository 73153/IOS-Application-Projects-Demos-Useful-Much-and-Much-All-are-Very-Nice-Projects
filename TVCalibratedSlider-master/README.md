##TVCalibratedSlider

A control used to select a value from a bunch of continuous values. This control is drawn as horizontal bar with scale below it.
 
A slider object requires the TVCalibratedSliderRange object for its range(default is 0 to 1).

![TVCalibratedSlider preview](http://f.cl.ly/items/0Z1O0Z3U1k3i0y0j3g2F/TVCalibratedSlider.png)

##Installation using CocoaPods

CocoaPods is distributed as a ruby gem, installing it is as easy as running the following commands in the terminal:

    $ [sudo] gem install cocoapods
    $ pod setup

Then, Create a textfile and name it Podfile in your XCode project directory.
Then, edit the Podfile and mention your dependencies.
    
    $ edit Podfile
    platform :ios
    pod 'TVCalibratedSlider',     '~> 1.0.0'
    
Now install the dependencies in your project :

    $ pod install
    
Make sure you always open the Xcode workspace instead of the project file.

    $ open App.xcworkspace
    
See the NSScreencast episode about [using CocoaPods](http://nsscreencast.com/episodes/5-cocoapods) for a quick overview on how to get started.
    
##Installation without CocoaPods
    $ git clone git://github.com/taviscaios/TVCalibratedSlider.git.
    
Copy the **TVCalibratedSlider.h**,**TVCalibratedSlider.m**,**TVSlider.m** and **TVSlider.m** files, by dragging these files into your Xcode project, and make sure that you have checked **"Copy items into destination group folder"** and selected the **"created group for any added folders"**.
##Usage
#1. Using Interface builder:
    1. Add a view to .xib file
    2. Set the class to TVCalibratedSlider.
    3. Set the delegate property.

#2. Using Code:
    TVCalibratedSlider *programmaticallyCreatedTVSlider = [[TVCalibratedSlider alloc] initWithFrame:CGRectMake(..,..,..,..) withStyle:TavicsaStyle];
    [programmaticallyCreatedTVSlider setRange:range];
    [programmaticallyCreatedTVSlider setDelegate:self] ;
    [view addSubview:programmaticallyCreatedTVSlider ];
