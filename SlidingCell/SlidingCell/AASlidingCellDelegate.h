//
//  AASlidingCellDelegate.h
//  SlidingCell
//
//  Created by Aakash Sahney on 11-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AASlidingCell;

@protocol AASlidingCellDelegate <NSObject>
@optional
- (void)rightActionSelected:(AASlidingCell *)cell;
- (void)leftActionSelected:(AASlidingCell *)cell;


@end
