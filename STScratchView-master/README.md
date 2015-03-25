# STScratchView

A UIView which allows a manual and automatic scratching behavior.

![STScratchView screenshot](https://raw.github.com/SebastienThiebaud/STScratchView/master/screenshot.png "STScratchView Screenshot")

## Installation

I love CocoaPods and you will. Add a new line on your Podfile with 'STScratchView'.

## Documentation

You need only 2 files:

- `STScratchView.h`
- `STScratchView.m`

You need to create an UIView (or child UIView: UIImageView for example) and give this view to the STScratchView object via the `-[STScratchView setHideView:(UIView *)hideView]` method.

You can also define a `UIBezierPath` to create an automatic scratch with `-[STScratchView setAutomaticScratchCurve:(UIBezierPath *)curvePath duration:(float)duration]`.

## Demo

Build and run the project STScratchViewExample in Xcode to see `STScratchView` in action. 

## Example Usage

``` objective-c
    STScratchView *scratchView = [[STScratchView alloc] initWithFrame:CGRectMake(20.0, 60.0, 280.0, 200.0)];
    [self.view addSubview:scratchView];

    UIView *hideView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 280.0, 200.0)];
    [hideView setBackgroundColor:[UIColor redColor]];

    [scratchView setHideView:hideView];
```

It's easy!

## Contact

Sebastien Thiebaud

- http://github.com/SebastienThiebaud
- http://twitter.com/SebThiebaud

## License

STScratchView is available under the MIT license.

