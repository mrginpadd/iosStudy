#import "MyPopupViewController.h"

@interface MyPopupPresentationController : UIPresentationController

@end

@implementation MyPopupPresentationController

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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [dimmingView addGestureRecognizer:tapGesture];
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        dimmingView.alpha = 1.0;
    } completion:nil];
}
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
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

@end


@implementation MyPopupViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // 创建弹窗的UI界面
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    label.text = @"底部弹窗内容";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    MyPopupPresentationController *presentationController = [[MyPopupPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
    return presentationController;
}

@end
