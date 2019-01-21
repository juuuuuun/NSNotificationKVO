//
//  CustomView.m
//  NSNotificationKVO
//
//  Created by Jun Oh on 2019-01-20.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(whitePanned:)];
        [self addGestureRecognizer:panGesture];
    }
    return self;
}

- (void) whitePanned:(UIPanGestureRecognizer *)gesture {
    self.point = [gesture translationInView:self];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
