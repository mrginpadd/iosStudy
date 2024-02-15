//
//  CusActivityIndicatorViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusActivityIndicatorViewController.h"
#import "IntroductionViewController.h"
#import "TipUtil.h"
@interface CusActivityIndicatorViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    vc.delegate = self;
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.introTitleLabel.text = @"UIActivityIndicatorView介绍";
    vc.introContentLabel.text = @" \n \
UIActivityIndicatorView 是 iOS 开发中常用的指示器控件，用于显示一个旋转的活动指示器，表示正在进行某个操作或加载中。  \n \
    它通常用于在用户等待数据加载、网络请求或其他长时间操作时提供反馈。  \n \
         \n \
    ";
    
    vc.attributeContentLabel.text = @"\n \
style：指示器的样式，默认为白色大号（UIActivityIndicatorViewStyleLargeWhite）。 \n \
    \n \
    还可以选择灰色大号（UIActivityIndicatorViewStyleLargeGray）和小号（UIActivityIndicatorViewStyleGray）。  \n \
        \n \
color：指示器的颜色，可以设置为自定义颜色。  \n \
        \n \
hidesWhenStopped：当指示器停止动画时是否隐藏，默认为 true。  \n \
        \n \
isAnimating：指示器的动画状态，true 表示正在播放动画，false 表示停止动画。  \n \
        \n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
数据加载等待：在进行网络请求或其他耗时操作时，使用指示器来告诉用户数据正在加载中，避免用户不必要的等待。  \n \
         \n \
页面转场过渡：在切换页面或加载新视图时，使用指示器来提示用户正在进行过渡操作。  \n \
         \n \
后台任务指示：当应用执行后台任务时，使用指示器来告知用户应用正在处理任务。  \n \
         \n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
      1. 创建实例  UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge]; \n \
      2. 设置指示器颜色 activityIndicatorView.color =  \n \
      3. 将指示器添加到视图中 \n \
      4. 开始动画  [activityIndicatorView startAnimating]; \n \
      5. 停止动画  [activityIndicatorView stopAnimating]; \n \
    ";
    
    [vc setUseStepTipBtns:@[@"效果", @"代码"]];
    
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"效果"]) {
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        [self.view addSubview:activityIndicatorView];
        activityIndicatorView.center = self.view.center;
        [activityIndicatorView startAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [activityIndicatorView stopAnimating];
        });
    } else if([title isEqualToString:@"代码"]) {
        NSString *tip = @" \n \
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView \n alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge]; \n \
        [self.view addSubview:activityIndicatorView]; \n \
        activityIndicatorView.center = self.view.center;\n \
        [activityIndicatorView startAnimating];\n \
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)),\n \
        dispatch_get_main_queue(), ^{\n \
            [activityIndicatorView stopAnimating];\n \
        }); \n \
        ";
        [TipUtil showTip:tip title:@"UIActivityIndicatorView使用" inController:self];
    }
}

@end
