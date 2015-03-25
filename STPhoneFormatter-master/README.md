# STPhoneFormatter

A custom formatter to deal with an international phone number inside a UITextField.

![STPhoneFormatter screenshot](https://raw.github.com/SebastienThiebaud/STPhoneFormatter/master/screenshot.png "STPhoneFormatter Screenshot")

## Documentation

You can install STPhoneFormatter from CocoaPods or manually. If you choose the most annoying method, please include these 3 files:

- `STPhoneFormatter.h`
- `STPhoneFormatter.m`
- `FormatsCountriesPhone.plist`

Two different formats of phone number are available: the formatted one `@property formattedPhoneNumber` and the unformatted one `- (NSString *)internationalPhoneNumber`.

You can access to the country's code and name with the `@property countryCode` and `@property countryName`.

Also, you can customize the format of the phone number by setting the country with the method `- (BOOL)setCountryCode:(NSString *)countryCode;`. The country's code must respect the ISO 3166.

If you want to contribute by adding more country, please submit your own .plist by a pull request.

## Demo

Build and run the project STPhoneFormatterExample in Xcode to see `STPhoneFormatter` in action. 

## Example Usage

The first thing to do is to set the delegate of your UITextField and in the delegate method `(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string` to add this:

``` objective-c
BOOL phoneNumberHasChanged = [[STPhoneFormatter phoneFormatter] phoneNumberMustChangeInRange:range replacementString:string];
        
if (phoneNumberHasChanged) {
	textField.text = [[STPhoneFormatter phoneFormatter] formattedPhoneNumber];
}
        
return NO;
```

IMPORTANT: Don't forget to return the value `NO`.

## Contact

Sebastien Thiebaud

- http://github.com/SebastienThiebaud
- http://twitter.com/SebThiebaud

## License

STPhoneFormatter is available under the MIT license.

