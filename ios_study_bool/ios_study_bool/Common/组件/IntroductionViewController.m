//
//  IntroductionViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/13.
//

#import "IntroductionViewController.h"
#import "TipUtil.h"
#import "Masonry.h"
#import <objc/runtime.h>
@interface IntroductionViewController ()

@end

@implementation IntroductionViewController

- (instancetype)init {
   
    self = [super init];
    if (self) {
      self.introBtns = @[].mutableCopy;
      self.applicationBtns = @[].mutableCopy;
      self.useStepBtns = @[].mutableCopy;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildScrollView];
    [self buildIntroView];
    [self buildIntroTitleLabel];
    [self buildContentLabel];
    
    [self buildAttributeLabel];
    [self buildAttrubuteContentLabel];
    
    [self buildApplicationView];
    [self buildApplicationTitleLabel];
    [self buildApplicationContentLabel];
    
    [self buildUseStepView];
    [self buildUserStepTitleLabel];
    [self buildUserStepContentLabel];
}

- (void)buildScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2*self.view.frame.size.height);
    [self.view addSubview:_scrollView];
}
- (void)buildIntroView {
    _introView = [[UIView alloc] init];
    _introView.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:_introView];
    [_introView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView);
        make.top.equalTo(_scrollView);
        make.width.equalTo(_scrollView);
        make.height.equalTo(@40);
    }];
}
- (void)buildIntroTitleLabel {
    _introTitleLabel = [[UILabel alloc] init];
    _introTitleLabel.textColor = [UIColor whiteColor];
    _introTitleLabel.text = @"xxx介绍";
    [_introView addSubview:_introTitleLabel];
    [_introTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView).offset(5);;
        make.top.equalTo(_scrollView);
        make.height.equalTo(@40);
    }];
}

- (void)buildContentLabel {
    _introContentLabel = [[UILabel alloc] init];
    _introContentLabel.textColor = [UIColor grayColor];
    _introContentLabel.text = @" \n \
    介绍内容文本.............................高度自适应..................... \n \
    ........................................ \n \
    ";
    _introContentLabel.numberOfLines = 0;
    [_scrollView addSubview:_introContentLabel];
    [_introContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView);
        make.top.equalTo(_introTitleLabel.mas_bottom).offset(5);
        make.width.equalTo(_scrollView);
    }];
 
}

- (void)buildAttributeLabel {
    _attributeTitleLabel = [[UILabel alloc] init];
    _attributeTitleLabel.textColor = [UIColor whiteColor];
    _attributeTitleLabel.backgroundColor = [UIColor blackColor];
    _attributeTitleLabel.text = @" 常用属性";
    [_scrollView addSubview:_attributeTitleLabel];
    
    [_attributeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView);
        make.width.equalTo(_scrollView);
        make.top.equalTo(_introContentLabel.mas_bottom).offset(5);
        make.height.equalTo(@40);
    }];
}

- (void)buildAttrubuteContentLabel {
    _attributeContentLabel = [[UILabel alloc] init];
    _attributeContentLabel.textColor = [UIColor grayColor];
    _attributeContentLabel.text = @"...";
    _attributeContentLabel.numberOfLines = 0;
    [_scrollView addSubview:_attributeContentLabel];
    [_attributeContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.left.equalTo(_scrollView);
            make.top.equalTo(_attributeTitleLabel.mas_bottom);
    }];
}

- (void)buildApplicationView {
    _applicationView = [[UIView alloc] init];
    _applicationView.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:_applicationView];
    [_applicationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView);
        make.top.equalTo(_attributeContentLabel.mas_bottom);
        make.width.equalTo(_scrollView);
        make.height.equalTo(@40);
    }];
}

- (void)buildApplicationTitleLabel {
    _applicationTitleLabel = [[UILabel alloc] init];
    _applicationTitleLabel.backgroundColor = [UIColor blackColor];
    _applicationTitleLabel.textColor = [UIColor whiteColor];
    _applicationTitleLabel.text = @"应用场景";
    [_applicationView addSubview:_applicationTitleLabel];
    [_applicationTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_applicationView);
        make.left.equalTo(_applicationView).offset(5);
        make.width.lessThanOrEqualTo(@200);
        make.height.equalTo(@40);
    }];
}

- (void)buildApplicationContentLabel {
    _applicationContentLabel = [[UILabel alloc] init];
    _applicationContentLabel.textColor = [UIColor grayColor];
    _applicationContentLabel.numberOfLines = 0;
    _applicationContentLabel.text = @" \n \
    介绍内容文本.............................高度自适应..................... \n \
    ........................................ \n \
    ";
    [_scrollView addSubview:_applicationContentLabel];
    [_applicationContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView);
        make.top.equalTo(_applicationView.mas_bottom).offset(5);
        make.width.equalTo(_scrollView);
    }];
}


- (void)buildUseStepView {
    _useStepView = [[UIView alloc] init];
    _useStepView.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:_useStepView];
    [_useStepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView);
        make.top.equalTo(_applicationContentLabel.mas_bottom);
        make.width.equalTo(_scrollView);
        make.height.equalTo(@40);
    }];
}


- (void)buildUserStepTitleLabel {
    _userStepTitleLabel = [[UILabel alloc] init];
    _userStepTitleLabel.backgroundColor = [UIColor blackColor];
    _userStepTitleLabel.textColor = [UIColor whiteColor];
    _userStepTitleLabel.text = @"使用步骤";
    [_useStepView addSubview:_userStepTitleLabel];
    [_userStepTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_useStepView);
        make.left.equalTo(_useStepView).offset(5);
        make.width.lessThanOrEqualTo(@200);
        make.height.equalTo(@40);
    }];
}


- (void)buildUserStepContentLabel {
    _useStepContentLabel = [[UILabel alloc] init];
    _useStepContentLabel.textColor = [UIColor grayColor];
    _useStepContentLabel.numberOfLines = 0;
    _useStepContentLabel.text = @" \n \
    介绍内容文本.............................高度自适应..................... \n \
    ........................................ \n \
    ";
    [_scrollView addSubview:_useStepContentLabel];
    [_useStepContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView);
        make.top.equalTo(_userStepTitleLabel.mas_bottom).offset(5);
        make.width.equalTo(_scrollView);
    }];
}

- (void)setIntroTipBtns:(NSArray<NSString *> *)tipBtns titles: (NSArray<NSString *> *)tipTitles contents:(NSArray<NSString *> *)tipContents {
    _introView.userInteractionEnabled = YES;
    for(int i=0; i<tipBtns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:tipBtns[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor systemCyanColor];

        [_introBtns addObject:btn];
        
        // 使用关联参数，实现uibutton多个入参
        objc_setAssociatedObject(btn,@"title",tipTitles[i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);//实际上就是KVC
        objc_setAssociatedObject(btn,@"content",tipContents[i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        [btn addTarget:self action:@selector(showTip:) forControlEvents:UIControlEventTouchUpInside];
        
        [_introView addSubview:btn];
        
        if (i == 0) {
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(_introTitleLabel.mas_right).offset(10);
             make.centerY.equalTo(_introView);
             make.width.lessThanOrEqualTo(@200);
             make.height.equalTo(_introView).offset(-8);
          }];
        } else {
          UIButton *preBtn = _introBtns[i-1];
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(preBtn.mas_right).offset(10);
              make.centerY.equalTo(_introView);
              make.width.lessThanOrEqualTo(@200);
              make.height.equalTo(_introView).offset(-8);
          }];
        }
    }
}

- (void)setApplicationTipBtns:(NSArray<NSString *> *)tipBtns titles: (NSArray<NSString *> *)tipTitles contents:(NSArray<NSString *> *)tipContents {
    
    for(int i=0; i<tipBtns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:tipBtns[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor systemCyanColor];

        [_applicationBtns addObject:btn];
        
        // 使用关联参数，实现uibutton多个入参
        objc_setAssociatedObject(btn,@"title",tipTitles[i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);//实际上就是KVC
        objc_setAssociatedObject(btn,@"content",tipContents[i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        [btn addTarget:self action:@selector(showTip:) forControlEvents:UIControlEventTouchUpInside];
        
        [_applicationView addSubview:btn];
        
        if (i == 0) {
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(_applicationTitleLabel.mas_right).offset(10);
             make.centerY.equalTo(_applicationView);
             make.width.lessThanOrEqualTo(@200);
             make.height.equalTo(_applicationView).offset(-8);
          }];
        } else {
          UIButton *preBtn = _applicationBtns[i-1];
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(preBtn.mas_right).offset(10);
              make.centerY.equalTo(_applicationView);
              make.width.lessThanOrEqualTo(@200);
              make.height.equalTo(_applicationView).offset(-8);
          }];
        }
    }
}
- (void)setUseStepTipBtns:(NSArray<NSString *> *)tipBtns titles: (NSArray<NSString *> *)tipTitles contents:(NSArray<NSString *> *)tipContents {
    
    for(int i=0; i<tipBtns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:tipBtns[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor systemCyanColor];

        [_useStepBtns addObject:btn];
        
        // 使用关联参数，实现uibutton多个入参
        objc_setAssociatedObject(btn,@"title",tipTitles[i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);//实际上就是KVC
        objc_setAssociatedObject(btn,@"content",tipContents[i],OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        [btn addTarget:self action:@selector(showTip:) forControlEvents:UIControlEventTouchUpInside];
        
        [_useStepView addSubview:btn];
        
        if (i == 0) {
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(_userStepTitleLabel.mas_right).offset(10);
             make.centerY.equalTo(_useStepView);
             make.width.lessThanOrEqualTo(@200);
             make.height.equalTo(_useStepView).offset(-8);
          }];
        } else {
          UIButton *preBtn = _useStepBtns[i-1];
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(preBtn.mas_right).offset(10);
              make.centerY.equalTo(_useStepView);
              make.width.lessThanOrEqualTo(@200);
              make.height.equalTo(_useStepView).offset(-8);
          }];
        }
    }
}

- (void)showTip:(UIButton *)btn{
    NSString *title = objc_getAssociatedObject(btn,@"title");//取参
    NSString *content = objc_getAssociatedObject(btn, @"content");
    [TipUtil showTip:content title:title inController:self];
}


- (void)setIntroTipBtns:(NSArray<NSString *> *)tipBtns {
    NSMutableArray *btns = @[].mutableCopy;
    
    for(int i=0; i<tipBtns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:tipBtns[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor systemCyanColor];

        [btns addObject:btn];

        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_introView addSubview:btn];
        
        if (i == 0) {
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(_introTitleLabel.mas_right).offset(10);
             make.centerY.equalTo(_introView);
             make.width.lessThanOrEqualTo(@200);
             make.height.equalTo(_introView).offset(-8);
          }];
        } else {
          UIButton *preBtn = btns[i-1];
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(preBtn.mas_right).offset(10);
              make.centerY.equalTo(_introView);
              make.width.lessThanOrEqualTo(@200);
              make.height.equalTo(_introView).offset(-8);
          }];
        }
    }
}

- (void)setApplicationTipBtns:(NSArray<NSString *> *)tipBtns {
    NSMutableArray *btns = @[].mutableCopy;
    
    for(int i=0; i<tipBtns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:tipBtns[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor systemCyanColor];

        [btns addObject:btn];


        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_applicationView addSubview:btn];
        
        if (i == 0) {
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(_applicationTitleLabel.mas_right).offset(10);
             make.centerY.equalTo(_applicationView);
             make.width.lessThanOrEqualTo(@200);
             make.height.equalTo(_applicationView).offset(-8);
          }];
        } else {
          UIButton *preBtn = btns[i-1];
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(preBtn.mas_right).offset(10);
              make.centerY.equalTo(_applicationView);
              make.width.lessThanOrEqualTo(@200);
              make.height.equalTo(_applicationView).offset(-8);
          }];
        }
    }
}

- (void)setUseStepTipBtns:(NSArray<NSString *> *)tipBtns {
    NSMutableArray *btns = @[].mutableCopy;
    for(int i=0; i<tipBtns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:tipBtns[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor systemCyanColor];

        [btns addObject:btn];

        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_useStepView addSubview:btn];
        
        if (i == 0) {
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(_userStepTitleLabel.mas_right).offset(10);
             make.centerY.equalTo(_useStepView);
             make.width.lessThanOrEqualTo(@200);
             make.height.equalTo(_useStepView).offset(-8);
          }];
        } else {
          UIButton *preBtn = btns[i-1];
          [btn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(preBtn.mas_right).offset(10);
              make.centerY.equalTo(_useStepView);
              make.width.lessThanOrEqualTo(@200);
              make.height.equalTo(_useStepView).offset(-8);
          }];
        }
    }
}

- (void)buttonClicked:(UIButton *)sender {
    // 当按钮被点击时触发相应的方法
    NSString *title = sender.titleLabel.text; // 获取按钮的标题
    
    // 通过代理将按钮的点击事件传递给 self
    if ([self.delegate respondsToSelector:@selector(buttonClickedWithTitle:)]) {
        [self.delegate buttonClickedWithTitle:title];
    }
}
@end
