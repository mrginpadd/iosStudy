//
//  CusPopUpViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusPopUpViewController.h"

@interface CusPopUpViewController ()

@end

@implementation CusPopUpViewController

- (CGRect)frameOfPresentedViewInContainerView {
    CGRect containerBounds = self.containerView.bounds;
    CGFloat height = containerBounds.size.height * 0.6; // 弹窗高度为容器视图高度的60%
    CGRect presentedViewFrame = CGRectMake(0, containerBounds.size.height - height, containerBounds.size.width, height);
    return presentedViewFrame;
}

- (void)presentationTransitionWillBegin {
    UIView *dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    dimmingView.alpha = 0.0;
    [self.containerView addSubview:dimmingView];
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        dimmingView.alpha = 1.0;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin {
    UIView *dimmingView = self.containerView.subviews.lastObject;
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        dimmingView.alpha = 0.0;
    } completion:nil];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        UIView *dimmingView = self.containerView.subviews.lastObject;
        [dimmingView removeFromSuperview];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
