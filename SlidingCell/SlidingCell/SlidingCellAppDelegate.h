//
//  SlidingCellAppDelegate.h
//  SlidingCell
//
//  Created by Aakash Sahney on 11-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlidingCellViewController;

@interface SlidingCellAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SlidingCellViewController *viewController;

@end
