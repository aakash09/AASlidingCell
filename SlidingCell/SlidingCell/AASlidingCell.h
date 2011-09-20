//
//  AASlidingCell.h
//  SlidingCell
//
//  Created by Aakash Sahney on 11-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASlidingCellDelegate.h"

@interface AASlidingCell : UITableViewCell {
    CGPoint _startPoint;
}

@property (nonatomic, retain) IBOutlet UIImageView *arrow;
@property (nonatomic, retain) id <AASlidingCellDelegate> delegate;
@end
