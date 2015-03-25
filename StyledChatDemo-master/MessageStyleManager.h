//
//  MessageStyleManager.h
//  StyledChatDemo
//
//  Created by xiao haibo on 13-2-23.
//  Copyright (c) 2013年 xiao haibo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//


#import <Foundation/Foundation.h>
#import "Message.h"
@interface MessageStyleManager : NSObject{
    NSURL		*baseURL;
	NSString	*headerHTML;
	NSString	*footerHTML;
	NSString	*baseHTML;
	NSString	*contentHTML;
	NSString	*contentInHTML;
	NSString	*nextContentInHTML;
	NSString	*contextInHTML;
	NSString	*nextContextInHTML;
	NSString	*contentOutHTML;
	NSString	*nextContentOutHTML;
	NSString	*contextOutHTML;
	NSString	*nextContextOutHTML;
	NSString	*statusHTML;
	NSString	*fileTransferHTML;
	NSString	*topicHTML;
    NSDictionary *emotions;

}
@property(nonatomic,strong)NSDictionary *emotions;
@property(nonatomic,strong)NSURL *baseURL;
@property(nonatomic,strong)NSString	*baseHTML;
+ (MessageStyleManager*)sharedInstance;
- (void)loadTemplate;
- (NSString *)appendScriptForMessage:(Message *)content;
- (NSString *)scriptForChangingVariant:(NSString *)variant;
- (NSArray *)availableVariants;

@end
