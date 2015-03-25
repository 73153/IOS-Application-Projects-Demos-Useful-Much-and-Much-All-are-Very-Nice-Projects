//
//  RootViewController.m
//  FeedbackDemo
//
//  Created by Andrew Wooster on 3/18/11.
//  Copyright 2011 Apptentive, Inc.. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import "RootViewController.h"
#import "ATConnect.h"
#import "ATAppRatingFlow.h"
#import "ATSurveys.h"
#import "defines.h"

enum kRootTableSections {
	kMessageCenterSection,
	kRatingSection,
	kSurveySection,
	kSectionCount
};

@interface RootViewController ()
- (void)surveyBecameAvailable:(NSNotification *)notification;
- (void)unreadMessageCountChanged:(NSNotification *)notification;
- (void)checkForProperConfiguration;
@end

@implementation RootViewController

- (IBAction)showRating:(id)sender {
	ATAppRatingFlow *flow = [ATAppRatingFlow sharedRatingFlow];
	flow.appID = kApptentiveAppID;
	// Don't do this in production apps.
	if ([flow respondsToSelector:@selector(showEnjoymentDialog:)]) {
		[flow performSelector:@selector(showEnjoymentDialog:) withObject:self];
	}
}

- (void)viewDidLoad {
	ATConnect *connection = [ATConnect sharedConnection];
	connection.apiKey = kApptentiveAPIKey;
	self.navigationItem.title = @"Apptentive Demo";
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"at_logo_info"]];
	imageView.contentMode = UIViewContentModeCenter;
	self.tableView.tableHeaderView = imageView;
	[imageView release], imageView = nil;
	[super viewDidLoad];
    
    tags = [[NSSet alloc] initWithObjects:@"testsurvey", @"testtag", nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(surveyBecameAvailable:) name:ATSurveyNewSurveyAvailableNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(unreadMessageCountChanged:) name:ATMessageCenterUnreadCountChangedNotification object:nil];
}

- (void)surveyBecameAvailable:(NSNotification *)notification {
	[self.tableView reloadData];
}

- (void)unreadMessageCountChanged:(NSNotification *)notification {
	[self.tableView reloadData];
}

- (void)checkForProperConfiguration {
	static BOOL checkedAlready = NO;
	if (checkedAlready) {
		// Don't display more than once.
		return;
	}
	checkedAlready = YES;
	if ([kApptentiveAPIKey isEqualToString:@"<your key here>"]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please Set API Key" message:@"This demo app will not work properly until you set your API key in defines.h" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
		[alert show];
		[alert autorelease];
	} else if ([kApptentiveAppID isEqualToString:@"ExampleAppID"]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please Set App ID" message:@"This demo app won't be able to show your app in the app store until you set your App ID in defines.h" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
		[alert show];
		[alert autorelease];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self checkForProperConfiguration];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == kSurveySection) {
        return 2;
    } else if (section == kMessageCenterSection) {
		return 1;
	}
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    static NSString *SurveyTagsCell = @"SurveyTagsCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryView = nil;
	}
	cell.textLabel.textColor = [UIColor blackColor];
	if (indexPath.section == kRatingSection) {
		cell.textLabel.text = @"Start Rating Flow";
	} else if (indexPath.section == kSurveySection) {
        if (indexPath.row == 0) {
            if ([ATSurveys hasSurveyAvailableWithNoTags]) {
                cell.textLabel.text = @"Show Survey";
                cell.textLabel.textColor = [UIColor blackColor];
            } else {
                cell.textLabel.text = @"No Survey Available";
                cell.textLabel.textColor = [UIColor grayColor];
            }
        } else if (indexPath.row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:SurveyTagsCell];
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SurveyTagsCell] autorelease];
            }
            if ([ATSurveys hasSurveyAvailableWithTags:tags]) {
                cell.textLabel.text = @"Show Survey With Tags";
                cell.textLabel.textColor = [UIColor blackColor];
            } else {
                cell.textLabel.text = @"No Survey Available With Tags";
                cell.textLabel.textColor = [UIColor grayColor];
            }
            NSArray *tagArray = [tags allObjects];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"tags: %@", [tagArray componentsJoinedByString:@", "]];
        }
	} else if (indexPath.section == kMessageCenterSection) {
		if (indexPath.row == 0) {
			cell.textLabel.text = @"Message Center";
			UILabel *unreadLabel = [[UILabel alloc] initWithFrame:CGRectZero];
			unreadLabel.text = [NSString stringWithFormat:@" %d ", [[ATConnect sharedConnection] unreadMessageCount]];
			unreadLabel.backgroundColor = [UIColor grayColor];
			unreadLabel.textColor = [UIColor whiteColor];
			unreadLabel.textAlignment = UITextAlignmentCenter;
			unreadLabel.layer.cornerRadius = 10.0;
			unreadLabel.font = [UIFont boldSystemFontOfSize:17];
			[unreadLabel sizeToFit];
			cell.accessoryView = [unreadLabel autorelease];
		}
	}
    
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == kRatingSection) {
		[self showRating:nil];
	} else if (indexPath.section == kSurveySection) {
        if (indexPath.row == 0) {
            if ([ATSurveys hasSurveyAvailableWithNoTags]) {
                [ATSurveys presentSurveyControllerWithNoTagsFromViewController:self];
            }
        } else if (indexPath.row == 1) {
            if ([ATSurveys hasSurveyAvailableWithTags:tags]) {
                [ATSurveys presentSurveyControllerWithTags:tags fromViewController:self];
            }
        }
	} else if (indexPath.section == kMessageCenterSection) {
		if (indexPath.row == 0) {
			[[ATConnect sharedConnection] presentMessageCenterFromViewController:self];
		}
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *title = nil;
	if (section == kRatingSection) {
		title = @"Ratings";
	} else if (section == kSurveySection) {
		title = @"Surveys";
	}
	return title;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	NSString *title = nil;
	if (section == kRatingSection) {
		title = nil;
	} else if (section == kSurveySection) {
		title = [NSString stringWithFormat:@"ApptentiveConnect v%@", kATConnectVersionString];
	}
	return title;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [tags release], tags = nil;
	[super dealloc];
}
@end
