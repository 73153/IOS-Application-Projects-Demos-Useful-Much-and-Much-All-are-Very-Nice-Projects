# SocialAccounts

![](http://cocoapod-badges.herokuapp.com/v/SocialAccounts/badge.png) &nbsp; ![](http://cocoapod-badges.herokuapp.com/p/SocialAccounts/badge.png)


SocialAccounts is an iOS framework that provides an easy way to manage social network accounts

## Requirements
* Xcode 4.5 or higher
* Apple LLVM compiler
* iOS 5.0 or higher
* ARC


## Demo

Build and run the `SocialAccountsExample` project in Xcode to see `SocialAccounts` in action.

If you don't have CocoaPods installed, check section "Installation" below.

## Installation

The recommended approach for installing SocialAccounts is via the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation.

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Edit your Podfile and add `SocialAccounts`:

``` bash
$ edit Podfile
platform :ios, '5.0'
pod 'SocialAccounts', :head
```

Install into your Xcode project:

``` bash
$ pod install
```

Add `#include "SocialAccounts.h"` to the top of classes that will use it.


## Example Usage

### Saving & Loading Accounts from the Account Store


``` objective-c

    SOAccountStore* store = [[SOAccountStore alloc] init];
    
    SOAccountType* type = [store accountTypeWithAccountTypeIdentifier:SOAccountTypeIdentifierInstagram];
    
    SOAccount* account = [[SOAccount alloc] initWithAccountType:type];
    
    account.username = @"john";
    SOAccountCredential* credential = [[SOAccountCredential alloc] initWithOAuth2Token:@"2342341.b6fw422.b8f5ffs9sjqljq7a70e788884b67c" refreshToken:nil expiryDate:nil];
    credential.scope = @"relationships";
    account.credential = credential;
    
    [store saveAccount:account withCompletionHandler:^(BOOL success, NSError *error) {
        NSLog(@"Saved Account");
        NSLog(@"%@", [account description]);
    }];
    
    
    for (SOAccount* account in store.accounts) {
        NSLog(@"loaded account %@", account.credential.oauthToken);
    }


```
