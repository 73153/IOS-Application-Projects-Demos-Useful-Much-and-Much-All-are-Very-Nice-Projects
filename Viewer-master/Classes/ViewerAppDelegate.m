//
//	ViewerAppDelegate.m
//	Viewer v1.1.0
//
//	Created by Julius Oklamcak on 2012-09-01.
//	Copyright © 2011-2013 Julius Oklamcak. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//	of the Software, and to permit persons to whom the Software is furnished to
//	do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "ReaderConstants.h"
#import "ViewerAppDelegate.h"
#import "LibraryViewController.h"
#import "DirectoryWatcher.h"
#import "CoreDataManager.h"
#import "DocumentsUpdate.h"
#import "DocumentFolder.h"

#include <sys/xattr.h>

@interface ViewerAppDelegate () <DirectoryWatcherDelegate>

@end

@implementation ViewerAppDelegate
{
	UIWindow *mainWindow; // Main App Window

	LibraryViewController *rootViewController;

	DirectoryWatcher *directoryWatcher;

	NSTimer *directoryWatcherTimer;
}

#pragma mark Miscellaneous methods

- (void)registerAppDefaults
{
	NSNumber *hideStatusBar = [NSNumber numberWithBool:YES];

	NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];

	NSString *version = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey];

	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults]; // User defaults

	NSDictionary *defaults = [NSDictionary dictionaryWithObject:hideStatusBar forKey:kReaderSettingsHideStatusBar];

	[userDefaults registerDefaults:defaults]; [userDefaults synchronize]; // Save user defaults

	[userDefaults setObject:version forKey:kReaderSettingsAppVersion]; // App version
}

- (void)prePopulateCoreData
{
	NSManagedObjectContext *mainMOC = [[CoreDataManager sharedInstance] mainManagedObjectContext];

	if ([DocumentFolder existsInMOC:mainMOC type:DocumentFolderTypeDefault] == NO) // Add default folder
	{
		NSString *folderName = NSLocalizedString(@"Documents", @"name"); // Localized default folder name

		[DocumentFolder insertInMOC:mainMOC name:folderName type:DocumentFolderTypeDefault]; // Insert it
	}

	if ([DocumentFolder existsInMOC:mainMOC type:DocumentFolderTypeRecent] == NO) // Add recent folder
	{
		NSString *folderName = NSLocalizedString(@"Recent", @"name"); // Localized recent folder name

		[DocumentFolder insertInMOC:mainMOC name:folderName type:DocumentFolderTypeRecent]; // Insert it
	}
}

#pragma mark UIApplicationDelegate methods

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	return [[DocumentsUpdate sharedInstance] handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self registerAppDefaults]; // Register various application settings defaults

	[self prePopulateCoreData]; // Pre-populate Core Data store with various default objects

	if ((launchOptions != nil) && ([launchOptions objectForKey:UIApplicationLaunchOptionsURLKey] != nil))
	{
		[[NSUserDefaults standardUserDefaults] removeObjectForKey:kReaderSettingsCurrentDocument]; // Clear
	}

	NSString *documentsPath = [DocumentsUpdate documentsPath]; // Application Documents path

	u_int8_t value = 1; // Value for iCloud and iTunes 'do not backup' item setxattr() function

	setxattr([documentsPath fileSystemRepresentation], "com.apple.MobileBackup", &value, 1, 0, 0);

	if ([[UIDevice currentDevice].systemVersion floatValue] >= 5.0f) // Only if iOS 5.0 and newer
	{
		directoryWatcher = [DirectoryWatcher watchFolderWithPath:documentsPath delegate:self];
	}

	mainWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]; // Main application window

	mainWindow.backgroundColor = [UIColor grayColor]; // Neutral gray window background color

	rootViewController = [[LibraryViewController alloc] initWithNibName:nil bundle:nil]; // Root

	mainWindow.rootViewController = rootViewController; // Set the root view controller

	[mainWindow makeKeyAndVisible]; // Make it the key window and visible

	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of
	// temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application
	// and it begins the transition to the background state. Use this method to pause ongoing tasks, disable timers,
	// and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

	[[NSUserDefaults standardUserDefaults] synchronize]; // Save user defaults
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough
	// application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of transition from the background to the inactive state: here you can undo many
	// of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive.
	// If the application was previously in the background, optionally refresh the user interface.

	[[DocumentsUpdate sharedInstance] queueDocumentsUpdate]; // Queue a documents update
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate.
	// See also applicationDidEnterBackground:.

	[[NSUserDefaults standardUserDefaults] synchronize]; // Save user defaults
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	// Free up as much memory as possible by purging cached data objects that can be recreated
	// (or reloaded from disk) later.

	NSLog(@"%s", __FUNCTION__);
}

#pragma mark ViewerAppDelegate instance methods

- (void)dealloc
{
	[directoryWatcherTimer invalidate];
}

#pragma mark DirectoryWatcherDelegate methods

- (void)directoryDidChange:(DirectoryWatcher *)folderWatcher
{
	if (directoryWatcherTimer != nil) { [directoryWatcherTimer invalidate]; directoryWatcherTimer = nil; } // Invalidate and release previous timer

	directoryWatcherTimer = [NSTimer scheduledTimerWithTimeInterval:4.8 target:self selector:@selector(watcherTimerFired:) userInfo:nil repeats:NO];
}

- (void)watcherTimerFired:(NSTimer *)timer
{
	[directoryWatcherTimer invalidate]; directoryWatcherTimer = nil; // Invalidate and release timer

	[[DocumentsUpdate sharedInstance] queueDocumentsUpdate]; // Queue a documents update
}

@end
