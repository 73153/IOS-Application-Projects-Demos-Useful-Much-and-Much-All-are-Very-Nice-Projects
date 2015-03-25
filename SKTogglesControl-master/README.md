## Looking for maintainers

### Plz send me an email for more details

# SKTogglesControl

SKTogglesControl is a customizable `UIControl` class that mimics `UISegmentedControl` but that looks like an `UISwitch`.

![SKTogglesControl](http://content.screencast.com/users/zxcvxzcvxcv/folders/Jing/media/b1de187e-36aa-45c8-891b-ab8b9ab89941/00000112.png)

## Installation

### From CocoaPods

Add this to your `Podfile:

```ruby
pod 'SKTogglesControl', :podspec => 'https://raw.github.com/steakknife/SKTogglesControl/master/SKTogglesControl.podspec'
```

### Manually

_**Important note if your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `SKTogglesControl.m` and `SVSegmentedThumb.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `SKTogglesControl/SKTogglesControl ` folder into your project. 
* Add the **QuartzCore** framework to your project.

## Usage

(see sample Xcode project in `/Demo`)

In its simplest form, this is how you create an SKTogglesControl instance:

```objective-c
segmentedControl = [[SKTogglesControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
segmentedControl.changeHandler = ^(NSUInteger newIndex, BOOL newState) {
    // respond to index change
};

[self.view addSubview:segmentedControl];
```

You can position it using either its `frame` or `center` property:

## Customization

SKTogglesControl can be customized with the following properties:

```objective-c
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray *sectionImages;

@property (nonatomic, readwrite) BOOL animateToInitialSelection; // default is NO

@property (nonatomic, readwrite) CGFloat minimumOverlapToChange; // default is 0.66 - Only snap to a new segment if the thumb overlaps it by this fraction
@property (nonatomic, readwrite) UIEdgeInsets touchTargetMargins; // default is UIEdgeInsetsMake(0, 0, 0, 0) - Enlarge touch target of control

@property (nonatomic, strong) UIColor *backgroundTintColor; // default is [UIColor colorWithWhite:0.1 alpha:1]
@property (nonatomic, retain) UIImage *backgroundImage; // default is nil

@property (nonatomic, readwrite) CGFloat height; // default is 32.0
@property (nonatomic, readwrite) UIEdgeInsets thumbEdgeInset; // default is UIEdgeInsetsMake(2, 2, 3, 2)
@property (nonatomic, readwrite) UIEdgeInsets titleEdgeInsets; // default is UIEdgeInsetsMake(0, 10, 0, 10)
@property (nonatomic, readwrite) CGFloat cornerRadius; // default is 4.0

@property (nonatomic, retain) UIFont *font; // default is [UIFont boldSystemFontOfSize:15]
@property (nonatomic, retain) UIColor *textColor; // default is [UIColor grayColor];
@property (nonatomic, strong) UIColor *innerShadowColor; // default is [UIColor colorWithWhite:0 alpha:0.8]
@property (nonatomic, retain) UIColor *textShadowColor;  // default is [UIColor blackColor]
@property (nonatomic, readwrite) CGSize textShadowOffset;  // default is CGSizeMake(0, -1)
```

Its thumb (`SVSegmentedThumb`) can be customized as well: 

```objective-c
@property (nonatomic, retain) UIImage *backgroundImage; // default is nil;
@property (nonatomic, retain) UIImage *highlightedBackgroundImage; // default is nil;

@property (nonatomic, retain) UIColor *tintColor; // default is [UIColor grayColor]
@property (nonatomic, assign) UIColor *textColor; // default is [UIColor whiteColor]
@property (nonatomic, assign) UIColor *textShadowColor; // default is [UIColor blackColor]
@property (nonatomic, readwrite) CGSize textShadowOffset; // default is CGSizeMake(0, -1)
@property (nonatomic, readwrite) BOOL shouldCastShadow; // default is YES (NO when backgroundImage is set)
@property (nonatomic, assign) CGFloat gradientIntensity; // default is 0.15
```

To customize the thumb's appearance, you'll have to set the properties through SKTogglesControl's `thumb` property. For instance, setting the thumb's `tintColor` is done with:

```objective-c
segmentedControl.thumb.tintColor = someColor;
```

## Responding to value changes

You can respond to value changes using a block handler:

```objective-c
segmentedControl.changeHandler = ^(NSUInteger newIndex, BOOL newState) {
    // respond to state change
};
```

If you haven't fallen in love with blocks yet, you can still use the classic UIControl method:

```objective-c
[mySegmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
```

Providing an action method ending with a semicolon, the sender object is therefore made accessible:

```objective-c
- (void)segmentedControlChangedValue:(SKTogglesControl*)segmentedControl {
	NSLog(@"segmentedControl did select index %i state %d", segmentedControl.newIndex, segmentedControl.newState);
}
```

## Credits

SKTogglesControl is brought to you by Barry Allard and original credit to [Sam Vermette](http://samvermette.com) and [contributors to the project](https://github.com/steakknife/SKTogglesControl/contributors).  If you're using SKTogglesControl in your project, attribution would be nice. 


## Wanted (dead or alive)

- Glow effect
- Inset effect
- Outset look (dimmed instead of missing)
- Press animation
- Nice sounds

## Issues

http://github.com/steakknife/SKTogglesControl/issues

