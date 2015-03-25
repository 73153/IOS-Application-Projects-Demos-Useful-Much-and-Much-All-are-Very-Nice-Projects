# STTimeSlider

A custom component like UISegmentedControl highly customizable.

![STTimeSlider screenshot](https://raw.github.com/SebastienThiebaud/STTimeSlider/master/screenshot.png "STTimeSlider Screenshot")

## Documentation

Please include these 4 files:

- `STTimeSlider.h`
- `STTimeSlider.m`
- `STTimeSliderModeView.h`
- `STTimeSliderModeView.m`

And include `QuartzCore.framework` and `CoreGraphics.framework`.

This plugin is highly customizable. You can customize:

![STTimeSlider doc sizes](http://www.iosjp.com/dev/wp-content/uploads/2013/04/STTimeSlider2.png "STTimeSlider doc sizes")

### Mode
- `STTimeSliderMode mode`: The mode of the slider (multi points or solo)
- `int startIndex`: In mode `STTimeSliderModeMulti`, it's the initial departure point

### Basic
- `float numberOfPoints`: The number of points (more than 1)
- `float radiusPoint`: (1) The radius of the point
- `float heightLine`: (2) The height of the line between two points. The height must be lower than `radiusPoint * 2`;
- `float spaceBetweenPoints`: (3) The space between two points
- `float radiusCircle`: (4) The radius of the point inside the selected circles

### Gradient
- `CGGradientRef gradient`: The gradient of the background bar
- `CGGradientRef gradientForeground`: The gradient of the foreground bar

### Stroke
- `UIColor *strokeColor`: The color of the background bar's stroke.
- `float strokeSize`: The size of the background bar's stroke.
- `UIColor *strokeColorForeground`: The color of the foreground bar's stroke.
- `float strokeSizeForeground`: The size of the foreground bar's stroke.

### Shadow

- `CGSize shadowSize`: The size.
- `float shadowBlur`: The blur.
- `UIColor *shadowColor`: The color.

## Demo

Build and run the project STTimeSliderExample in Xcode to see `STTimeSlider` in action. 

## Example Usage

``` objective-c
    STTimeSlider *timeSlider = [[STTimeSlider alloc] initWithFrame:CGRectMake(5.0, 5.0, 310.0, 110.0)];
    [timeSlider setDelegate:self];
    [self.view addSubview:timeSlider];
```

Don't forget to implement`STTimeSliderDelegate` protocol in your ViewController. Without it, you won't be able to detect when the user will change the index:

``` objective-c
    - (void)timeSlider:(STTimeSlider *)timeSlider didSelectPointAtIndex:(int)index
    {
        NSLog(@"User clicked on TimeSlider %@ at Index %d", timeSlider, index);
    }
```
or when the slider has changed:

``` objective-c
    - (void)timeSlider:(STTimeSlider *)timeSlider didMoveToPointAtIndex:(int)index
    {
        NSLog(@"TimeSlider %@ has changed at Index %d", timeSlider, index);
    }
```

You can change the index of the slider with `- (void)moveToIndex:(int)index;`.

## Contact

Sebastien Thiebaud

- http://github.com/SebastienThiebaud
- http://twitter.com/SebThiebaud

## License

STTimeSlider is available under the MIT license.

