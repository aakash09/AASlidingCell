//
//  AASlidingCell.m
//  SlidingCell
//
//  Created by Aakash Sahney on 11-09-19.
//  Copyright 2011. All rights reserved.
//

#import "AASlidingCell.h"
#define RIGHT_ICON_X 0.7
#define LEFT_ICON_X 0.3
@interface AASlidingCell (Private)
- (void)animateBackToCenter;
@end

@implementation AASlidingCell
@synthesize arrow;
@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"AASlidingCell" owner:self options:nil] objectAtIndex:0];

    if (self) {
        // Initialization code
        _startPoint = CGPointMake(-1.0f, -1.0f);
        self.arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
        self.arrow.center = CGPointMake(self.frame.size.width / 2, self.arrow.center.y);
        self.arrow.frame = CGRectMake(self.arrow.frame.origin.x, 0, self.arrow.frame.size.width, self.arrow.frame.size.height);
        self.arrow.hidden = YES;
        [self addSubview:self.arrow];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _startPoint = point;
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    self.arrow.hidden = NO;
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPoint targetPoint = self.center;
    CGPoint arrowPoint;
    if(_startPoint.x > -1.0f) {
        targetPoint.x += -(_startPoint.x - point.x);
        targetPoint.y = self.contentView.center.y;
        arrowPoint = targetPoint;
        arrowPoint.y = 0;
        
        if(targetPoint.x >= (RIGHT_ICON_X * self.frame.size.width)) {
            arrowPoint.x = RIGHT_ICON_X * self.frame.size.width;
        } else if (targetPoint.x <= (LEFT_ICON_X * self.frame.size.width)) {
            arrowPoint.x = LEFT_ICON_X * self.frame.size.width;
        } else {
            arrowPoint.x = targetPoint.x;
        }
    } else {
        return;
    }

    
    
    self.contentView.center = targetPoint;
    self.arrow.center = arrowPoint;
    [super touchesMoved:touches withEvent:event];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _startPoint = CGPointMake(-1.0f, -1.0f);
    if(self.arrow.center.x >= RIGHT_ICON_X * self.frame.size.width) {
        if([self.delegate respondsToSelector:@selector(rightActionSelected:)]) {
            [self.delegate rightActionSelected:self];
        }
    } else if(self.arrow.center.x <= LEFT_ICON_X * self.frame.size.width) {
        if([self.delegate respondsToSelector:@selector(leftActionSelected:)]) {
            [self.delegate leftActionSelected:self];
        }
    }
    
    [self animateBackToCenter];
    
    [super touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    _startPoint = CGPointMake(-1.0f, -1.0f);
    [self animateBackToCenter];
    [super touchesCancelled:touches withEvent:event];
    
}

- (void)animateBackToCenter {
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.contentView.center = CGPointMake(self.frame.size.width / 2.0f, self.contentView.center.y);    
        self.arrow.hidden = YES;
    } completion:nil];
}
@end
