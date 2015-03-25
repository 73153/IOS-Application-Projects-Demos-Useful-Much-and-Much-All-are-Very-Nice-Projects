##TVPickerView

TVPickerView with increment decrement operators. 

This View is a picker view which allows user to pick a value from values provided by a datasource.
Navigation among values is done via increment and decrement buttons on the side.
 
A picker object requires the delegate for showing value of an element and a data source for providing 
the numbers of elements. 

##Installation using CocoaPods

CocoaPods is distributed as a ruby gem, installing it is as easy as running the following commands in the terminal:

    $ [sudo] gem install cocoapods
    $ pod setup

Then, Create a textfile and name it Podfile in your XCode project directory.
Then, edit the Podfile and mention your dependencies.
    
    $ edit Podfile
    platform : ios
    pod 'TVPickerView',     '~> 1.0.0'
    
Now install the dependencies in your project :

    $ pod install
    
Make sure you always open the Xcode workspace instead of the project file.

    $ open App.xcworkspace
    
See the NSScreencast episode about [using CocoaPods](http://nsscreencast.com/episodes/5-cocoapods) for a quick overview on how to get started.
    
##Installation without CocoaPods
    $ git clone git@github.com:taviscaios/TVPickerView.git.
    
Copy the **TVPickerView.h** and **TVPickerView.m** files, by dragging these files into your Xcode project, and make sure that you have checked **"Copy items into destination group folder"** and selected the **"created group for any added folders"**.
##Usage
#1. Using Interface builder:
    1. Add a view to .xib file
    2. Set the class to TVPickerView.
    3. Set the datasource and delegate property.

#2. Using Code:
    TVPickerView *programaticallyCreatedTvPickerView = [[TVPickerView alloc] initWithFrame:CGRectMake(67, 100, 186, 40)];
    [programaticallyCreatedTvPickerView setDatasource:...];
    [programaticallyCreatedTvPickerView setDelegate:...];
    [view addSubview:programaticallyCreatedTvPickerView ];