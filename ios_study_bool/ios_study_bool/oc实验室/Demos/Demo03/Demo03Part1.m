//
//  Demo03Part1.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/11.
//

#import "Demo03Part1.h"

@implementation Demo03Part1

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpTapGesture];
    }
    return self;
}

- (void)setUpTapGesture {
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    tapGes.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGes];
}

- (void)handleTap {
    if (self.onTap) {
        self.onTap();
    }
}

@end
