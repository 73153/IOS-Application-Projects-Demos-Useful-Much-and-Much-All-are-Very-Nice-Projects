//
// Copyright 2011-2012 Adar Porat (https://github.com/aporat)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import "SocialAccounts.h"


#warning get instagram oauth app to run this example
#define kInstagramClientID @"<FILL IN YOUR CLIENT ID HERE>"
#define kInstagramClientKey @"<FILL IN YOUR CLIENT SECRET HERE>"
#define kInstagramRedirectURI @"http://www.google.com/OAuthCallback"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStyleBordered target:self action:@selector(doLogin)];

    /*
    SOAccountStore* store = [[SOAccountStore alloc] init];

    NSDictionary* instagramSettings = @{SOOAuth2ClientID: kInstagramClientID, SOOAuth2ClientSecret: kInstagramClientKey, SOOAuth2RedirectURI: kInstagramRedirectURI};
    
    SOAccountType* accountType = [store accountTypeWithAccountTypeIdentifier:SOAccountTypeIdentifierInstagram];
    [store requestAccessToAccountsWithType:accountType options:instagramSettings completion:^(BOOL success, NSError *error) {
        
    }];
     */
}

- (GTMOAuth2Authentication *)auth {
    if (_auth==nil) {
        NSURL *tokenURL = [NSURL URLWithString:@"https://api.instagram.com/oauth/access_token"];
        
        _auth = [GTMOAuth2Authentication authenticationWithServiceProvider:SOAccountTypeIdentifierInstagram
                                                                  tokenURL:tokenURL
                                                               redirectURI:kInstagramRedirectURI
                                                                  clientID:kInstagramClientID
                                                              clientSecret:kInstagramClientKey];
        self.auth.scope = @"relationships";
    }
    
    return _auth;
}


- (SOOAuth2ViewController*)loginViewController {
   
    SOOAuth2ViewController* vc = [SOOAuth2ViewController controllerWithAuthentication:self.auth
                                                                                 authorizationURL:[NSURL URLWithString:@"https://instagram.com/oauth/authorize"]
                                                                                 keychainItemName:SOAccountTypeIdentifierInstagram completionHandler:^(GTMOAuth2ViewControllerTouch *viewController, GTMOAuth2Authentication *auth, NSError *error) {
                                                                                     
                                                                                     if (error!=nil) {
                                                                                         NSString* errorMessage = nil;
                                                                                         NSString* errorData = [error.userInfo objectForKey:NSLocalizedRecoverySuggestionErrorKey];
                                                                                         
                                                                                         if (errorData!=nil) {
                                                                                             NSError* error;
                                                                                             NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[errorData dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
                                                                                             if (json!=nil && error==nil) {
                                                                                                 NSDictionary* errorMeta = [json objectForKey:@"meta"];
                                                                                                 if (errorMeta!=nil) {
                                                                                                     errorMessage = [errorMeta objectForKey:@"error_message"];
                                                                                                 }
                                                                                             }
                                                                                         }
                                                                                         
                                                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                                                             [self didLoginFailed:errorMessage];
                                                                                         });
                                                                                         
                                                                                         
                                                                                     } else {
                                                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                                                             [self didLogin];
                                                                                         });
                                                                                     }
                                                                                     
                                                                                 }];
    
    _loginViewController =  vc;

    SOAccountStore* store = [[SOAccountStore alloc] init];
    SOAccountType* accountType = [store accountTypeWithAccountTypeIdentifier:SOAccountTypeIdentifierInstagram];
    vc.accountType = accountType;
    
    __weak id loginController = _loginViewController;
    _loginViewController.popViewBlock = ^{
        [loginController dismissModalViewControllerAnimated:YES];
    };
    
    
    NSString *html = @"<html><body bgcolor=white><div align=center style='font-family:Arial'>Loading sign-in page...</div></body></html>";
    _loginViewController.initialHTMLString = html;
    
    
    return _loginViewController;
}

-(void)doLogin {
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:self.loginViewController];
    [self presentModalViewController:navController animated:YES];
}

- (void)didLogin
{
    SOAccountStore* store = [[SOAccountStore alloc] init];

    [[SOInstagramAPIClient sharedClient] GET:@"users/self" parameters:@{@"access_token" : self.auth.accessToken} success:^(AFHTTPRequestOperation *operation, NSDictionary* response) {
        NSDictionary* profile = [response valueForKeyPath:@"data"];
        
        SOAccountType* accountType = [store accountTypeWithAccountTypeIdentifier:SOAccountTypeIdentifierInstagram];
        SOAccount* account = [[SOAccount alloc] initWithAccountType:accountType];
        account.username = [profile objectForKey:@"username"];
        SOAccountCredential* credential = [[SOAccountCredential alloc] initWithOAuth2Token:self.auth.accessToken refreshToken:nil expiryDate:nil];
        credential.scope = self.auth.scope;
        account.credential = credential;
        
        [store saveAccount:account withCompletionHandler:^(BOOL success, NSError *error) {
            
            self.accountLabel.text = account.identifier;
            NSLog(@"Saved account %@", account.identifier);
   
            
        }];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
    }];

}

- (void)didLoginFailed:(NSString*)error
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
