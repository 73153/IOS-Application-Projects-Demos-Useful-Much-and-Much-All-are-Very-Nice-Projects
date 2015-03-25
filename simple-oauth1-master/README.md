simple-oauth1
=============

#### Simple code for authenticating with OAuth 1.0a service providers
Built for iOS 6 with blocks and ARC.

AFNetworking (https://github.com/AFNetworking/AFNetworking) have some awesome methods for handling url parameters, which has been used in the project. Also a nice oauth signature method from OAuthConsumer (http://code.google.com/p/oauthconsumer/) has been used.

Currently URL's are set for LinkedIn API, but has been tested against Twitter and Tumblr.

#### How to configure the sample project
1. Register and app here: https://www.linkedin.com/secure/developer (or other OAuth 1.0a service) 

2. Insert your Client ID and Client Secret in OAuth1Controller.m (and change the authentication-url and token-url if you're not using LinkedIn API)

4. Run the app. Tap the login button and authorize the app

5. After successfull authentication, tap the "API Request" button to test an API get request. Currently it is set (in ViewController.m) to pull your LinkedIn profile or find an appropriate API call on your OAuth1.0a service provider.

#### Integrate in your own project
Copy the classes in the "OAuth1" group of the sample project to your project. Create a new OAuth1Controller object and run the method
```loginWithWebView:completion:``` by providing a UIWebView to handle the authorization part where the user puts in his/her credentials. You have to have a strong reference to your OAuth1Controller object. Example below from the sample project.

``` objective-c
LoginWebViewController *loginWebViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginWebViewController"];
[self presentViewController:loginWebViewController
                   animated:YES
                 completion:^{
                     [self.oauth1Controller loginWithWebView:loginWebViewController.webView completion:^(NSDictionary *oauthTokens, NSError *error) {
                         if (!error) {
                             // Store your tokens for authenticating your later requests, consider storing the tokens in the Keychain
                             NSLog(@"Success: %@", oauthTokens);
                         }
                         else
                         {
                             NSLog(@"Error authenticating: %@", error.localizedDescription);
                         }
                         [self dismissViewControllerAnimated:YES completion: ^{
                             self.oauth1Controller = nil;
                         }];
                     }];
                 }];
```
The files inside Crypto are standard files for creating the signature. 


### Creator

[Christian Hansen](http://github.com/christian-hansen)  
[@chrhansen](https://twitter.com/chrhansen)

## License

Simple-oauth1 is available under the MIT license.