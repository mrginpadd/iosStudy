//
//  UILabelViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import "UILabelViewController.h"
#import "ScreenUtil.h"
@interface UILabelViewController ()
@property(nonatomic, strong, readwrite) UILabel *label6;
@property(nonatomic, strong, readwrite) UIButton *btn;
@property(nonatomic, assign, readwrite) NSInteger currentLineBreakModeVal;
@end

@implementation UILabelViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        _currentLineBreakModeVal = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"UILabel";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10 + TOPHEIGHT, SCREEN_WIDTH, 30)];
    label.text = @"textColor: 颜色";
    label.textColor = [UIColor redColor];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 40 + TOPHEIGHT, SCREEN_WIDTH, 30)];
    label2.text = @"font: 字号和字体";
    label2.font = [UIFont systemFontOfSize:23];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70 + TOPHEIGHT, self.view.frame.size.width, 30)];
    label3.text = @"textAlignment: 文本对齐方式";
    label3.textAlignment = NSTextAlignmentRight;
    label3.backgroundColor = [UIColor yellowColor];

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100 + TOPHEIGHT, self.view.frame.size.width, 60)];
    label4.text = @"shadowColor: 阴影颜色 shadowOffset:(x,y)偏移量";
    label4.shadowColor = [UIColor greenColor];
    label4.shadowOffset = CGSizeMake(3, 3);
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 170 + TOPHEIGHT, self.view.frame.size.width, 80)];
    label5.text = @"numberOfLines： 支持显示行数， 0 表示无限换行，直到文字结束，或者到达uilabel最底端。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。";
    label5.numberOfLines = 0;
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 260 + TOPHEIGHT, self.view.frame.size.width, 30)];
 
    [_btn setTitle:[NSString stringWithFormat:@"切换换行模式: %@", [self stringForLineBreakMode:(NSLineBreakMode)self.currentLineBreakModeVal]] forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _btn.backgroundColor = [UIColor yellowColor];
    [_btn addTarget:self action:@selector(switchLineBreakMode) forControlEvents:UIControlEventTouchUpInside];
    
    _label6 = [[UILabel alloc] initWithFrame:CGRectMake(0, 290 + TOPHEIGHT, self.view.frame.size.width, 140)];
    _label6.text = @"lineBreakMode: 文字换行截断模式 NSLineBreakByWordWrapping 以单词为标准换行 \
    NSLineBreakByCharWrapping    // 以字符为标准换行 \
    NSLineBreakByClipping //超出部分裁剪 \
    NSLineBreakByTruncatingHead  // 头部截断 \
    NSLineBreakByTruncatingTail  // 尾部截断 \
    NSLineBreakByTruncatingMiddle// 中间截断  there is a word to show the line break mode and jieduan";
    _label6.backgroundColor = [UIColor redColor];
    _label6.numberOfLines = 0;
    _label6.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self.view addSubview:label];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    [self.view addSubview:label5];
    [self.view addSubview:_btn];
    [self.view addSubview:_label6];
    
}

- (void)switchLineBreakMode {
    self.currentLineBreakModeVal = (self.currentLineBreakModeVal + 1) % 6;
    _label6.lineBreakMode = _currentLineBreakModeVal;
    [_btn setTitle:[NSString stringWithFormat:@"切换换行模式: %@", [self stringForLineBreakMode:(NSLineBreakMode)_currentLineBreakModeVal]] forState:UIControlStateNormal];
 
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)stringForLineBreakMode:(NSLineBreakMode)lineBreakMode {
    switch (lineBreakMode) {
        case NSLineBreakByWordWrapping:
            return @"NSLineBreakByWordWrapping";
        case NSLineBreakByCharWrapping:
            return @"NSLineBreakByCharWrapping";
        case NSLineBreakByClipping:
            return @"NSLineBreakByClipping";
        case NSLineBreakByTruncatingHead:
            return @"NSLineBreakByTruncatingHead";
        case NSLineBreakByTruncatingTail:
            return @"NSLineBreakByTruncatingTail";
        case NSLineBreakByTruncatingMiddle:
            return @"NSLineBreakByTruncatingMiddle";
        default:
            return @"Unknown";
    }
}

@end
