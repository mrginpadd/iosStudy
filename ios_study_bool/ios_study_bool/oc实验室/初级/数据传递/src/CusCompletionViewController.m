//
//  CusCompletionViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/7.
//

#import "CusCompletionViewController.h"
#import "ToastUtil.h"
@interface CusCompletionViewController ()

@end

@implementation CusCompletionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupViews];
}

- (void)setupViews {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"回调";
    vc.introContentLabel.text = @"\n \
      (void(^)(NSString *data))completion \n \
     (无返回值(^)(入参))回调名称 \n \
      (^)标记它是一个block类型 \n \
     (返回值类型(^)(入参))回调名称 \n \
      NSString * (^)(NSString *data))completion \n \
    ";
    
    vc.applicationContentLabel.text = @"适用于两个控制器之间“一对一”数据传递，尤其是当数据是从异步操作中获得时。";
    
    [vc setUseStepTipBtns:@[@"回调"]];
    
    vc.useStepContentLabel.text = @"\n \
- (void)doSomething:(void(^)(NSString* data))completion {\n \
    completion(\@\"回调返回的字符串\");\n \
}\n \
    \n \
[self doSomething:^(NSString *data) {\n \
  得到回调参数data\n \
}];\n \
    ";
    
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"回调"]) {
        
        [self doSomething:^(NSString *data) {
           [ToastUtil showToastCenter:[NSString stringWithFormat:@"得到回调参数: %@", data]];
        }];
    }
}

- (void)doSomething:(void(^)(NSString* data))completion {
    completion(@"回调返回的字符串");
}
@end
