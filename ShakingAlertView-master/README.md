ShakingAlertView
===================

[![Build Status](https://travis-ci.org/lukestringer90/ShakingAlertView.png?branch=master)](https://travis-ci.org/lukestringer90/ShakingAlertView)
![Pod version](http://cocoapod-badges.herokuapp.com/v/ShakingAlertView/badge.png)

ShakingAlertView is a UIAlertView subclass with a password entry textfield. Incorrect password entry causes a "shake" animation similar to the OS X account login screen.

![screen](https://raw.github.com/lukestringer90/ShakingAlertView/master/screens/demo.gif)

## Installation
### Cocoapods
Add to your Podfile: 

```
pod 'ShakingAlertView'
```

### Adding source code manually
Clone the git repo and drag the **"src"** folder into your project. This contains the UI components and cryptographic helpers necessary for hashing passwords.

## Usage
### Plaintext password

Use ShakingAlertView just like UIAlertView. For a checking a plain text password:

```
ShakingAlertView *shakingAlert = nil;
shakingAlert = [[ShakingAlertView alloc] initWithAlertTitle:@"Enter Password"
                                           checkForPassword:@"pass"];

[shakingAlert setOnCorrectPassword:^{
    // Code to execute on correct password entry
}];

[shakingAlert setOnDismissalWithoutPassword:^{
    // Code to execute on alert dismissal without password entry
}];

[shakingAlert show];
```

Rather than using a delegate, pass the instance a completion block to be executed for correct password entry and alert dismissal. ShakingAlertView uses ARC so no need to release your instances.

### Hashed passwords

ShakingAlertView uses the [Common Crypto](https://developer.apple.com/library/mac/documentation/security/Conceptual/cryptoservices/GeneralPurposeCrypto/GeneralPurposeCrypto.html#//apple_ref/doc/uid/TP40011172-CH9-SW4) C API to hash the entered text to SHA1 or MD5. Therefore if you only know the hashed counterpart of a password string you can specify this along with the hashing algorithm type in the constructor. 

```
ShakingAlertView *shakingAlert = nil;
shakingAlert = [[ShakingAlertView alloc] initWithAlertTitle:@"Enter Password"
                                           checkForPassword:@"W6ph5Mm5Pz8GgiULbPgzG37mj9g=" //sha1 hash of 'password'
                                      usingHashingTechnique:HashTechniqueSHA1];
                                      
```

The hashing algorithm to use is defined by an enum and passed into the constructor.
```
typedef enum {
	HashTechniqueNone,
    HashTechniqueSHA1,
    HashTechniqueMD5
} HashTechnique;
```

`HashTechniqueNone` is used if no technique is specified, like in the `initWithAlertTitle:checkForPassword` and `initWithAlertTitle:checkForPassword:onCorrectPassword:onDismissalWithoutPassword` constructors. Here the entered string is compared with the specified plaintext password using a simple `isEqualToString:`  evaluation.

## Running the tests
The ShakingAlertView class is tested using the BDD tool [Kiwi](https://github.com/allending/Kiwi). To run the tests install Kiwi via [Cocoapods](http://cocoapods.org), and the open the workspace: 

```
cd Example\ Project/
pod install
open ExampleProject.xcworkspace/
````

Make sure the **"ShakingAlertView"** scheme is selected then run the tests with **⌘+U**

## Acknowledgements
`NSData+Base64.h/m` and `b64.h/m` from [aqtoolkit](https://github.com/AlanQuatermain/aqtoolkit) by [Jim Dovey](https://github.com/AlanQuatermain)

[Kiwi](https://github.com/allending/Kiwi) testing tool.

## Licence
This code is distributed under the terms and conditions of the MIT license.

Copyright (c) 2012 Luke Stringer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

### Author

Follow me on twitter: [lukestringer90](http://twitter.com/lukestringer90)
