SDCSegmentedViewController
=========================

`SDCSegmentedViewController` is a custom view controller container that uses a segmented control to switch between view controllers. It can be used with iOS 5.0+, though the deployment target for the sample project is set to iOS 6.0.

## Use

`SDCSegmentedViewController` is very easy to use, and can be set up either using a storyboard or programmatically. It sets up a container view controller that switches between its child view controllers with a `UISegmentedControl`. The segmented control can be placed in either the navigation bar or the toolbar of the navigation controller that contains `SDCSegmentedViewController`. This position can be set using the `position` property (for which the options are `SDCSegmentedViewControllerPositionNavigationBar` or `SDCSegmentedViewControllerPositionToolbar`).

### Storyboard

Follow these steps to instantiate `SDCSegmentedViewController` from a storyboard:

 1. Drag out a view controller and set its class to `SDCSegmentedViewController`
 2. Embed the `SDCSegmentedViewController` in a navigation controller
 2. Drag out more view controllers that you want as part of `SDCSegmentedViewController`
 3. Fill in all the view controllers' `title` properties in the storyboard. This is a requirement, as the title attribute is used for setting the segment's title.
 4. Control-drag from the `SDCSegmentedViewController` scene to a view controller that you created in step 2
 5. Choose the **embedded segment** segue. This is a custom segue that's very similar to the embedded segue introduced in iOS 6.
 6. Give the segue an identifier
 7. Repeat steps 4-6 for all the view controllers you added in step 2
 8. Call `-[SDCSegmentedViewController addStoryboardSegments:]` passing in an `NSArray` of `NSString`s that match the segue identifiers

### Programmatically

The code below is a sample use of `SDCSegmentedViewController` in `application:didFinishLaunchingWithOptions:` when created programmatically:

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	MyViewController *myVC1 = [[MyViewController alloc] initWithNibName:@"MyVC1" bundle:nil];
	MyOtherViewController *myVC2 = [[MyViewController alloc] initWithNibName:@"MyVC2" bundle:nil];
	
	SDCSegmentedViewController *segmentedController = [[SDCSegmentedViewController alloc] initWithViewControllers:@[myVC1, myVC2]];
	// Or, we could choose our own titles:
	// SDCSegmentedViewController *segmentedController = [[SDCSegmentedViewController alloc] initWithViewControllers:@[myVC1, myVC2] titles:@[@"Segment 1", @"Segment 2"]];
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:segmentedController];
	
	[self.window makeKeyAndVisible];
}
```

Of course you don't have to use `SDCSegmentedViewController` as the root view controller, you can push it onto a navigation controller, present it modally, or do anything else that you can do with a normal view controller.

## License

The [MIT license] (http://opensource.org/licenses/MIT) applies to the code distributed in this repo.