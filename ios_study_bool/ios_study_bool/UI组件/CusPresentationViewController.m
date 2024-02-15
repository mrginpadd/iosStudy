//
//  CusPresentationViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusPresentationViewController.h"
#import "IntroductionViewController.h"
#import "MyPopupViewController.h"


@interface CusPresentationViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusPresentationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    vc.introTitleLabel.text = @"UIPresentationController介绍";
    vc.introContentLabel.text = @" \n \
    UIPresentationController 是一个用于自定义视图控制器转场动画和呈现样式的类。 \n \
    它是 iOS 8 引入的一个类，用于管理视图控制器之间的呈现和解散过程。 \n \
    ";
    vc.attributeContentLabel.text = @"  \n \
    presentedViewController: 被呈现的视图控制器。   \n \
    presentingViewController: 执行呈现操作的视图控制器。  \n \
    containerView: 呈现过程中的容器视图。  \n \
    presentedView: 被呈现的视图。  \n \
    presentingView: 执行呈现操作的视图。  \n \
    presentationStyle: 呈现样式，可以是 UIModalPresentationStyle 的常量值之一。  \n \
    presentedViewFrameDidChange: 当被呈现的视图的大小发生变化时调用的方法。  \n \
    dismissalTransitionWillBegin: 解散过渡将要开始时调用的方法。  \n \
    dismissalTransitionDidEnd:: 解散过渡结束时调用的方法。  \n \
    presentationTransitionWillBegin: 呈现过渡将要开始时调用的方法。  \n \
    presentationTransitionDidEnd:: 呈现过渡结束时调用的方法。  \n \
      \n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
自定义转场动画效果。 \n \
自定义弹出框样式。 \n \
在呈现过程中添加背景遮罩视图等。 \n \
    ";
    
    [vc setUseStepTipBtns:@[@"ceshi"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"ceshi"]) {
        MyPopupViewController *popupVC = [[MyPopupViewController alloc] init];
        [self presentViewController:popupVC animated:YES completion:nil];
    }
}
@end


