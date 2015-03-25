/* Copyright (c) 2010 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
// GTMOAuthViewControllerTouch.m
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

#if TARGET_OS_IPHONE

// If you want to shave a few bytes, and you include GTMOAuthViewTouch.xib
// in your project, then you can define this as 0 in your prefix file.
#ifndef GTL_CONSTRUCT_OAUTH_VIEWS_IN_SOURCE_CODE
#define GTL_CONSTRUCT_OAUTH_VIEWS_IN_SOURCE_CODE 1
#endif

#define GTMOAUTHVIEWCONTROLLERTOUCH_DEFINE_GLOBALS 1
#import "GTMOAuthViewControllerTouch.h"

#import "GTMOAuthSignIn.h"
#import "GTMOAuthAuthentication.h"

static NSString * const kGTLOAuthAccountName = @"OAuth";
static GTMOAuthKeychain* sDefaultKeychain = nil;

// If the Interface Builder .xib is compiled in to the app, it overrides this code.
#if GTL_CONSTRUCT_OAUTH_VIEWS_IN_SOURCE_CODE
// Wrappers for calls deprecated in 3.0
@interface UIButton(GTMOAuthViewControllerTouch)
- (void)oauthCompatibilitySetFont:(UIFont *)font;
- (void)oauthCompatibilitySetTitleShadowOffset:(CGSize)offset;
@end


@implementation UIButton(GTMOAuthViewControllerTouch)
- (void)oauthCompatibilitySetFont:(UIFont *)font {
  id label = self;
  if ([self respondsToSelector:@selector(titleLabel)]) {
   label = [self performSelector:@selector(titleLabel)];
  }
  // OK to send to button in 2.0, but prefer sending to label.
  [label setFont:font];
}

- (void)oauthCompatibilitySetTitleShadowOffset:(CGSize)offset {
  id label = self;
  if ([self respondsToSelector:@selector(titleLabel)]) {
    label = [self performSelector:@selector(titleLabel)];
  }
  // OK to send to button in 2.0, but prefer sending to label.
  [label setShadowOffset:offset];
}
@end

#endif // GTL_CONSTRUCT_OAUTH_VIEWS_IN_SOURCE_CODE


@interface GTMOAuthViewControllerTouch()

@property (nonatomic, copy) NSURLRequest *request;

- (void)signIn:(GTMOAuthSignIn *)signIn displayRequest:(NSURLRequest *)request;
- (void)signIn:(GTMOAuthSignIn *)signIn
finishedWithAuth:(GTMOAuthAuthentication *)auth
         error:(NSError *)error;  
- (BOOL)isNavigationBarTranslucent;
- (void)moveWebViewFromUnderNavigationBar;
- (void)popView;
- (void)clearBrowserCookies;
@end

@implementation GTMOAuthViewControllerTouch

@synthesize request = request_;
@synthesize keychainApplicationServiceName = keychainApplicationServiceName_;
@synthesize initialHTMLString = initialHTMLString_;
@synthesize browserCookiesURL = browserCookiesURL_;
@synthesize signIn = signIn_;
@synthesize userData = userData_;
@synthesize webView = webView_;


- (id)initWithScope:(NSString *)scope
           language:(NSString *)language
    requestTokenURL:(NSURL *)requestURL
  authorizeTokenURL:(NSURL *)authorizeURL
     accessTokenURL:(NSURL *)accessURL
     authentication:(GTMOAuthAuthentication *)auth
     appServiceName:(NSString *)keychainAppServiceName
           delegate:(id)delegate
   finishedSelector:(SEL)finishedSelector {

  NSString *nibName = [[self class] authNibName];

  self = [super initWithNibName:nibName bundle:nil];
  if (self != nil) {
    delegate_ = [delegate retain];
    finishedSelector_ = finishedSelector;

    if (auth) {
      [auth setScope:scope];

      // use the supplied auth and OAuth endpoint URLs
      signIn_ = [[GTMOAuthSignIn alloc] initWithAuthentication:auth
                                               requestTokenURL:requestURL
                                             authorizeTokenURL:authorizeURL
                                                accessTokenURL:accessURL
                                                      delegate:self
                                            webRequestSelector:@selector(signIn:displayRequest:)
                                              finishedSelector:@selector(signIn:finishedWithAuth:error:)];
    } else {
      NSAssert(0, @"auth object required");
    }

    // the display name defaults to the bundle's name
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *displayName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if ([displayName length] == 0) {
      displayName = [bundle objectForInfoDictionaryKey:@"CFBundleName"];
      if ([displayName length] == 0) {
        displayName = [[bundle executablePath] lastPathComponent];
      }
    }
    [self setDisplayName:displayName];

    [self setKeychainApplicationServiceName:keychainAppServiceName];
  }
  return self;
}

#if NS_BLOCKS_AVAILABLE
- (id)initWithScope:(NSString *)scope
           language:(NSString *)language
    requestTokenURL:(NSURL *)requestURL
  authorizeTokenURL:(NSURL *)authorizeURL
     accessTokenURL:(NSURL *)accessURL
     authentication:(GTMOAuthAuthentication *)auth
     appServiceName:(NSString *)keychainAppServiceName
  completionHandler:(void (^)(GTMOAuthViewControllerTouch *viewController, GTMOAuthAuthentication *auth, NSError *error))handler {

  // fall back to the non-blocks init
  self = [self initWithScope:scope
                    language:language
             requestTokenURL:requestURL
           authorizeTokenURL:authorizeURL
              accessTokenURL:accessURL
              authentication:auth
              appServiceName:keychainAppServiceName
                    delegate:nil
            finishedSelector:NULL];
  if (self) {
    completionBlock_ = [handler copy];
  }
  return self;
}
#endif

- (void)dealloc {
  [backButton_ release];
  [forwardButton_ release];
  [navButtonsView_ release];
  [rightBarButtonItem_ release];
  [signIn_ setDelegate:nil];
  [signIn_ release];
  [request_ release];
  [delegate_ release];
#if NS_BLOCKS_AVAILABLE
  [completionBlock_ release];
#endif
  [keychainApplicationServiceName_ release];
  [initialHTMLString_ release];
  [userData_ release];
  [webView_ release];
  [super dealloc];
}

+ (NSString *)authNibName {
  // subclasses may override this to specify a custom nib name
  return @"GTMOAuthViewTouch";
}

+ (BOOL)authorizeFromKeychainForName:(NSString *)appServiceName
                      authentication:(GTMOAuthAuthentication *)newAuth {
  [newAuth setToken:nil];
  [newAuth setHasAccessToken:NO];

  BOOL didGetTokens = NO;
  GTMOAuthKeychain *keychain = [GTMOAuthKeychain defaultKeychain];
  NSString *password = [keychain passwordForService:appServiceName
                                            account:kGTLOAuthAccountName
                                              error:nil];
  if (password != nil) {
    [newAuth setKeysForResponseString:password];
    [newAuth setHasAccessToken:YES];
    didGetTokens = YES;
  }
  return didGetTokens;
}

+ (BOOL)removeParamsFromKeychainForName:(NSString *)appServiceName {
  GTMOAuthKeychain *keychain = [GTMOAuthKeychain defaultKeychain];
  return [keychain removePasswordForService:appServiceName
                                    account:kGTLOAuthAccountName
                                      error:nil];
}

+ (BOOL)saveParamsToKeychainForName:(NSString *)appServiceName
                     authentication:(GTMOAuthAuthentication *)auth {
  [self removeParamsFromKeychainForName:appServiceName];
  // don't save unless we have a token that can really authorize requests
  if (![auth hasAccessToken]) return NO;

  // make a response string containing the values we want to save
  NSString *password = [auth persistenceResponseString];
  GTMOAuthKeychain *keychain = [GTMOAuthKeychain defaultKeychain];
  return [keychain setPassword:password
                    forService:appServiceName
                       account:kGTLOAuthAccountName
                         error:nil];
}



- (void)constructView {
// If the Interface Builder .xib is compiled in to the app, it overrides this code.
  CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
  UIView *view = [[[UIView  alloc] initWithFrame:webFrame] autorelease];
  [view setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleBottomMargin];
  webFrame.origin = CGPointZero;
  UIWebView *webView = [[[UIWebView alloc] initWithFrame:webFrame] autorelease];
  [webView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleBottomMargin];
  [self setView:view];
  [view addSubview:webView];
  [self setWebView:webView];
  [webView setDelegate:self];
    

}

- (void)loadView {

    [self constructView];
}


- (void)viewDidLoad {
  // the app may prefer some html other than blank white to be displayed
  // before the sign-in web page loads
  NSString *html = [self initialHTMLString];
  if ([html length] > 0) {
    [[self webView] loadHTMLString:html baseURL:nil];
  }

  [rightBarButtonItem_ setCustomView:navButtonsView_];
  [[self navigationItem] setRightBarButtonItem:rightBarButtonItem_];
}

- (void)popView {
    if (![[self view] isHidden]) {
      // Set the flag to our viewWillDisappear method so it knows
      // this is a disappearance initiated by the sign-in object,
      // not the user cancelling via the navigation controller
      didDismissSelf_ = YES;

      [[self view] setHidden:YES];
  }
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)cancelSigningIn {
  // The application has explicitly asked us to cancel signing in
  // (so no further callback is required)
  hasCalledFinished_ = YES;

  [delegate_ autorelease];
  delegate_ = nil;

#if NS_BLOCKS_AVAILABLE
  [completionBlock_ autorelease];
  completionBlock_ = nil;
#endif

  // The sign-in object's cancel method will close the window
  [signIn_ cancelSigningIn];
  hasDoneFinalRedirect_ = YES;
}

#pragma mark Browser Cookies

- (void)clearBrowserCookies {
  // if browserCookiesURL is non-nil, then get cookies for that URL
  // and delete them from the common application cookie storage
  NSURL *cookiesURL = [self browserCookiesURL];
  if (cookiesURL) {
    NSHTTPCookieStorage *cookieStorage;

    cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies =  [cookieStorage cookiesForURL:cookiesURL];

    for (NSHTTPCookie *cookie in cookies) {
      [cookieStorage deleteCookie:cookie];
    }
  }
}

#pragma mark Accessors

- (void)setDisplayName:(NSString *)displayName {
  GTMOAuthAuthentication *auth = [self authentication];
  [auth setDisplayName:displayName];
}

- (NSString *)displayName {
  return [[self authentication] displayName];
}

- (GTMOAuthAuthentication *)authentication {
  GTMOAuthAuthentication *auth = [signIn_ authentication];
  return auth;
}

- (void)setNetworkLossTimeoutInterval:(NSTimeInterval)val {
  [signIn_ setNetworkLossTimeoutInterval:val];
}

- (NSTimeInterval)networkLossTimeoutInterval {
  return [signIn_ networkLossTimeoutInterval];
}

- (BOOL)shouldUseKeychain {
  BOOL hasName = ([keychainApplicationServiceName_ length] > 0);
  return hasName;
}

#pragma mark SignIn callbacks

- (void)signIn:(GTMOAuthSignIn *)signIn displayRequest:(NSURLRequest *)request {
  // this is the signIn object's webRequest method, telling the controller
  // to either display the request in the webview, or close the window
  //
  // All web requests and all window closing goes through this routine

#if DEBUG
  if ([self navigationController]) {
    if ([[self navigationController] topViewController] != self && request != nil) {
      NSLog(@"Unexpected: Request to show, when already on top. request %@", [request URL]);
    } else if([[self navigationController] topViewController] != self && request == nil) {
      NSLog(@"Unexpected: Request to pop, when not on top. request nil");
    }
  }
#endif

  if (request != nil) {
    const NSTimeInterval kJanuary2011 = 1293840000;
    BOOL isDateValid = ([[NSDate date] timeIntervalSince1970] > kJanuary2011);
    if (isDateValid) {
      // Display the request.
      [self setRequest:request];
      [[self webView] loadRequest:[self request]];
    } else {
      // clock date is invalid, so signing in would fail with an unhelpful error
      // from the server. Warn the user in an html string showing a watch icon,
      // question mark, and the system date and time. Hopefully this will clue
      // in brighter users, or at least give them a clue when they report the
      // problem to developers.
      //
      // Even better is for apps to check the system clock and show some more
      // helpful, localized instructions for users; this is really a fallback.
      NSString *html = @"<html><body><div align=center><font size='7'>"
        "&#x231A; ?<br><i>System Clock Incorrect</i><br>%@"
        "</font></div></body></html>";
      NSString *errHTML = [NSString stringWithFormat:html, [NSDate date]];

      [[self webView] loadHTMLString:errHTML baseURL:nil];
    }
  } else {
    // request was nil.
    [self popView];
  }
}

- (void)signIn:(GTMOAuthSignIn *)signIn
  finishedWithAuth:(GTMOAuthAuthentication *)auth
             error:(NSError *)error {
  if (!hasCalledFinished_) {
    hasCalledFinished_ = YES;

    if (error == nil) {
      BOOL shouldUseKeychain = [self shouldUseKeychain];
      if (shouldUseKeychain) {
        NSString *appServiceName = [self keychainApplicationServiceName];
        if ([auth canAuthorize]) {
          // save the auth params in the keychain
          [[self class] saveParamsToKeychainForName:appServiceName authentication:auth];
        } else {
          // remove the auth params from the keychain
          [[self class] removeParamsFromKeychainForName:appServiceName];
        }
      }
    }

    if (delegate_ && finishedSelector_) {
      SEL sel = finishedSelector_;
      NSMethodSignature *sig = [delegate_ methodSignatureForSelector:sel];
      NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
      [invocation setSelector:sel];
      [invocation setTarget:delegate_];
      [invocation setArgument:&self atIndex:2];
      [invocation setArgument:&auth atIndex:3];
      [invocation setArgument:&error atIndex:4];
      [invocation invoke];
    }

    [delegate_ autorelease];
    delegate_ = nil;

#if NS_BLOCKS_AVAILABLE
    if (completionBlock_) {
      completionBlock_(self, auth, error);

      // release the block here to avoid a retain loop on the controller
      [completionBlock_ autorelease];
      completionBlock_ = nil;
    }
#endif
  }
}

- (void)moveWebViewFromUnderNavigationBar {

}

// isTranslucent is defined in iPhoneOS 3.0 on.
- (BOOL)isNavigationBarTranslucent {
  UINavigationBar *navigationBar = [[self navigationController] navigationBar];
  BOOL isTranslucent =
    ([navigationBar respondsToSelector:@selector(isTranslucent)] &&
     [navigationBar isTranslucent]);
  return isTranslucent;
}

#pragma mark -
#pragma mark Protocol implementations

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if (!isViewShown_) {
    isViewShown_ = YES;
    if ([self isNavigationBarTranslucent]) {
      [self moveWebViewFromUnderNavigationBar];
    }
    if (![signIn_ startSigningIn]) {
      // Can't start signing in. We must pop our view.
      // UIWebview needs time to stabilize. Animations need time to complete.
      // We remove ourself from the view stack after that.
      [self performSelector:@selector(popView)
                 withObject:nil
                 afterDelay:0.5
                    inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
    }
  }
  [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  if (!didDismissSelf_) {
    // We are not popping ourselves, so presumably we are being popped by the
    // navigation controller; tell the sign-in object to close up shop
    //
    // This will indirectly call our signIn:finishedWithAuth:error: method
    // for us
    [signIn_ windowWasClosed];
  }

  // Prevent the next sign-in from showing in the WebView that the user is
  // already signed in
  [self clearBrowserCookies];

  [super viewWillDisappear:animated];
}

- (BOOL)webView:(UIWebView *)webView
  shouldStartLoadWithRequest:(NSURLRequest *)request
              navigationType:(UIWebViewNavigationType)navigationType {

  if (!hasDoneFinalRedirect_) {
    hasDoneFinalRedirect_ = [signIn_ requestRedirectedToRequest:request];
    if (hasDoneFinalRedirect_) {
      // signIn has told the view to close
      return NO;
    }
  }
  return YES;
}


- (void)notifyWithName:(NSString *)name
               webView:(UIWebView *)webView
                  kind:(NSString *)kind {
    BOOL isStarting = [name isEqual:kGTMOAuthWebViewStartedLoading];
    if (hasNotifiedWebViewStartedLoading_ == isStarting) {
        // Duplicate notification
        //
        // UIWebView's delegate methods are so unbalanced that there's little
        // point trying to keep a count, as it could easily end up stuck greater
        // than zero.
        //
        // We don't really have a way to track the starts and stops of
        // subframe loads, too, as the webView in the notification is always
        // for the topmost request.
        return;
    }
    hasNotifiedWebViewStartedLoading_ = isStarting;
    
    // Notification for webview load starting and stopping
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          webView, kGTMOAuthWebViewKey,
                          kind, kGTMOAuthWebViewStopKindKey, // kind may be nil
                          nil];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:name
                      object:self
                    userInfo:dict];
}


- (void)updateUI {
  [backButton_ setEnabled:[[self webView] canGoBack]];
  [forwardButton_ setEnabled:[[self webView] canGoForward]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  [self updateUI];
    
    [self notifyWithName:kGTMOAuthWebViewStartedLoading
                 webView:webView
                    kind:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  [self updateUI];
    
    [self notifyWithName:kGTMOAuthWebViewStoppedLoading
                 webView:webView
                    kind:kGTMOAuthWebViewFinished];

}

@end


#pragma mark Common Code

@implementation GTMOAuthKeychain

+ (GTMOAuthKeychain *)defaultKeychain {
  if (sDefaultKeychain == nil) {
    sDefaultKeychain = [[self alloc] init];
  }
  return sDefaultKeychain;
}


// For unit tests: allow setting a mock object
+ (void)setDefaultKeychain:(GTMOAuthKeychain *)keychain {
  if (sDefaultKeychain != keychain) {
    [sDefaultKeychain release];
    sDefaultKeychain = [keychain retain];
  }
}

- (NSString *)keyForService:(NSString *)service account:(NSString *)account {
  return [NSString stringWithFormat:@"com.google.GTMOAuth.%@%@", service, account];
}

// The Keychain API isn't available on the iPhone simulator in SDKs before 3.0,
// so, on early simulators we use a fake API, that just writes, unencrypted, to
// NSUserDefaults.
#if TARGET_IPHONE_SIMULATOR && __IPHONE_OS_VERSION_MAX_ALLOWED < 30000
#pragma mark Simulator

// Simulator - just simulated, not secure.
- (NSString *)passwordForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
  NSString *result = nil;
  if (0 < [service length] && 0 < [account length]) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [self keyForService:service account:account];
    result = [defaults stringForKey:key];
    if (result == nil && error != NULL) {
      *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                   code:kGTLOAuthKeychainErrorNoPassword
                               userInfo:nil];
    }
  } else if (error != NULL) {
    *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                 code:kGTLOAuthKeychainErrorBadArguments
                             userInfo:nil];
  }
  return result;

}


// Simulator - just simulated, not secure.
- (BOOL)removePasswordForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
  BOOL didSucceed = NO;
  if (0 < [service length] && 0 < [account length]) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [self keyForService:service account:account];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
  } else if (error != NULL) {
    *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                 code:kGTLOAuthKeychainErrorBadArguments
                             userInfo:nil];
  }
  return didSucceed;
}

// Simulator - just simulated, not secure.
- (BOOL)setPassword:(NSString *)password
         forService:(NSString *)service
            account:(NSString *)account
              error:(NSError **)error {
  BOOL didSucceed = NO;
  if (0 < [password length] && 0 < [service length] && 0 < [account length]) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [self keyForService:service account:account];
    [defaults setObject:password forKey:key];
    [defaults synchronize];
    didSucceed = YES;
  } else if (error != NULL) {
    *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                 code:kGTLOAuthKeychainErrorBadArguments
                             userInfo:nil];
  }
  return didSucceed;
}

#else // ! TARGET_IPHONE_SIMULATOR
#pragma mark Device

+ (NSMutableDictionary *)keychainQueryForService:(NSString *)service account:(NSString *)account {
  NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                         (id)kSecClassGenericPassword, (id)kSecClass,
                         @"OAuth", (id)kSecAttrGeneric,
                         account, (id)kSecAttrAccount,
                         service, (id)kSecAttrService,
                         nil];
  return query;
}

- (NSMutableDictionary *)keychainQueryForService:(NSString *)service account:(NSString *)account {
  return [[self class] keychainQueryForService:service account:account];
}



// iPhone
- (NSString *)passwordForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
  OSStatus status = kGTLOAuthKeychainErrorBadArguments;
  NSString *result = nil;
  if (0 < [service length] && 0 < [account length]) {
    CFDataRef passwordData = NULL;
    NSMutableDictionary *keychainQuery = [self keychainQueryForService:service account:account];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];

    status = SecItemCopyMatching((CFDictionaryRef)keychainQuery,
                                       (CFTypeRef *)&passwordData);
    if (status == noErr && 0 < [(NSData *)passwordData length]) {
      result = [[[NSString alloc] initWithData:(NSData *)passwordData
                                      encoding:NSUTF8StringEncoding] autorelease];
    }
    if (passwordData != NULL) {
      CFRelease(passwordData);
    }
  }
  if (status != noErr && error != NULL) {
    *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                 code:status
                             userInfo:nil];
  }
  return result;
}


// iPhone
- (BOOL)removePasswordForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
  OSStatus status = kGTLOAuthKeychainErrorBadArguments;
  if (0 < [service length] && 0 < [account length]) {
    NSMutableDictionary *keychainQuery = [self keychainQueryForService:service account:account];
    status = SecItemDelete((CFDictionaryRef)keychainQuery);
  }
  if (status != noErr && error != NULL) {
    *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                 code:status
                             userInfo:nil];
  }
  return status == noErr;
}

// iPhone
- (BOOL)setPassword:(NSString *)password
         forService:(NSString *)service
            account:(NSString *)account
              error:(NSError **)error {
  OSStatus status = kGTLOAuthKeychainErrorBadArguments;
  if (0 < [service length] && 0 < [account length]) {
    [self removePasswordForService:service account:account error:nil];
    if (0 < [password length]) {
      NSMutableDictionary *keychainQuery = [self keychainQueryForService:service account:account];
      NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
      [keychainQuery setObject:passwordData forKey:(id)kSecValueData];
      status = SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
    }
  }
  if (status != noErr && error != NULL) {
    *error = [NSError errorWithDomain:kGTLOAuthKeychainErrorDomain
                                 code:status
                             userInfo:nil];
  }
  return status == noErr;
}

#endif // ! TARGET_IPHONE_SIMULATOR

@end

#endif // TARGET_OS_IPHONE
