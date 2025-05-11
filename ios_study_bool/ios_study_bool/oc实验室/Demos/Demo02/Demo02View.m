//
//  Demo02View.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/11.
//

#import "Demo02View.h"

@implementation Demo02View {
    UILabel *titleLabel;
}

-(instancetype)initWithTitle:(NSString*)title {
    self = [super init];
    if (self) {
      self.title = title;
     [self _buildViews];
      
    }
    return self;
}

-(void)_buildViews {
    [self setUpTapGesture];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    titleLabel.text = self.title;
    titleLabel.textColor = [UIColor yellowColor];
    titleLabel.backgroundColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:titleLabel];
}

//确保设置了frame后居中显示
- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat labelWidth = 100;
    CGFloat labelHeight = 50;
    titleLabel.frame = CGRectMake((self.bounds.size.width - labelWidth) / 2,
                                     (self.bounds.size.height - labelHeight) / 2,
                                     labelWidth,
                                     labelHeight);
}

// 👇 关键点：重写 setTitle: 方法，更新 label 内容
- (void)setTitle:(NSString *)title {
    _title = title;
    if (titleLabel) {
      titleLabel.text = title;
    }
}

-(void)setUpTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}

-(void)handleTap {
    if (self.onTap) {
        self.onTap();
    }
}
@end
