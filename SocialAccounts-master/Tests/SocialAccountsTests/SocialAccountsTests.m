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

#import "SocialAccountsTests.h"
#import "SocialAccounts.h"

@interface SocialAccountsTests()

@property (nonatomic, strong) SOAccountStore* store;

@end

@implementation SocialAccountsTests

- (void)setUp
{
    [super setUp];
    
    self.store = [[SOAccountStore alloc] init];

}

- (void)tearDown
{
    [self.store clearStore];
    
    [super tearDown];
}

- (void)testCreateInstagramAccount
{
    SOAccountType* type = [self.store accountTypeWithAccountTypeIdentifier:SOAccountTypeIdentifierInstagram];
    
    SOAccount* account = [[SOAccount alloc] initWithAccountType:type];
    
    account.username = @"john";
    SOAccountCredential* credential = [[SOAccountCredential alloc] initWithOAuth2Token:@"2342341.b6fw422.b8f5ffs9sjqljq7a70e788884b67c" refreshToken:nil expiryDate:nil];
    credential.scope = @"relationships";
    account.credential = credential;
    
    [self.store saveAccount:account withCompletionHandler:^(BOOL success, NSError *error) {
    }];
    
    
    SOAccount* fetchedAccount = [self.store accountWithIdentifier:account.identifier];
    STAssertEqualObjects(fetchedAccount.identifier, account.identifier, @"");
    
}



@end
