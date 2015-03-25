//
//  UINavigationController+AllOrientationsiPhone.h
//  USStatesColorMapDemo
//
//  Created by Andrey Cherkashin on 11.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

@implementation UINavigationController (AllOrientationsiPhone)

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskAll;
}

@end
