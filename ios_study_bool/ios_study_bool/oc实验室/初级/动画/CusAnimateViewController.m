//
//  CusAnimateViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/16.
//

#import "CusAnimateViewController.h"
#import "IntroductionViewController.h"
@interface CusAnimateViewController ()<IntroductionViewControllerDelegate, CAAnimationDelegate>
@property (weak, nonatomic) UIView *viewToRemove;
@end

@implementation CusAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"动画介绍";
    vc.introContentLabel.text = @" \n \
    常用的动画属性包括位置（position）、缩放（scale）、旋转（rotation）、透明度（opacity）等。\n \
    动画是指在一段时间内逐渐改变视图的属性或者状态，从而呈现出流畅的变化效果。  \n \
    在iOS开发中，我们可以使用Core Animation或者UIView动画来创建各种动画效果。 \n \
    ";
    
    
    vc.attributeContentLabel.text = @"\n \
位置（Position）：通过改变视图的位置属性，可以实现平移动画。 \n \
缩放（Scale）：通过改变视图的transform属性的缩放比例，可以实现缩放动画。\n \
旋转（Rotation）：通过改变视图的transform属性的旋转角度，可以实现旋转动画。\n \
透明度（Opacity）：通过改变视图的alpha属性，可以实现透明度动画。\n \
背景色（Background Color）：通过改变视图的backgroundColor属性，可以实现背景色渐变动画。\n \
    ";
    
    vc.applicationContentLabel.text = @"\n \
界面过渡动画：在页面之间切换时使用动画效果，使界面更加流畅和吸引人。\n \
视图动画：对控件的位置、大小、透明度等属性进行动画处理，使界面更加生动。\n \
手势交互动画：响应用户手势操作，如拖拽、缩放、旋转等，增加用户参与感。\n \
加载动画：在数据加载或处理时展示加载动画，提高用户等待时的体验。\n \
特效动画：如粒子效果、倒影效果等，为应用增添活力和趣味性。\n \
    ";
    
    NSString *tip = @"\n \
    UIView动画:  \n \
    简单易用的动画实现方式，可以修改 UIView 的属性来创建动画效果。 \n \
     // 在 1 秒内改变视图的透明度  \n \
    [UIView animateWithDuration:1.0 animations:^{  \n \
        view.alpha = 0.5;  \n \
    }];\n \
    \n \
    \n \
    Core Animation: \n \
    Core Animation 是一种基于图层的动画实现方式，可以创建更加复杂和高级的动画效果。 \n \
    // 创建旋转动画  \n \
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@\"transform.rotation.z\"];  \n \
    rotationAnimation.toValue = @(M_PI * 2); \n \
    rotationAnimation.duration = 1.0; \n \
     \n \
    // 添加动画到视图的 layer 中 \n \
    [view.layer addAnimation:rotationAnimation forKey:@\"rotationAnimation\"]; \n \
     \n \
    \n \
    UIKit Dynamics: \n \
    UIKit Dynamics 是一种基于物理引擎的动画实现方式，可以模拟真实世界中的物理规律来创建动画效果。 \n \
    // 创建边界碰撞行为  \n \
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[view]]; \n \
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES; \n \
     \n \
    // 创建重力行为 \n \
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[view]]; \n \
     \n \
    // 创建动态行为 \n \
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view]; \n \
    [animator addBehavior:collisionBehavior]; \n \
    [animator addBehavior:gravityBehavior]; \n \
     \n \
    ";
    vc.useStepContentLabel.text = tip;
    
    [vc setUseStepTipBtns:@[@"UIView动画", @"Core Animation", @"UIKit Dynamics"]];
    
    
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"UIView动画"]) {
        [self startUIViewAnimation];
    } else if([title isEqualToString:@"Core Animation"]) {
        [self startCoreAnimation];
    } else if([title isEqualToString:@"UIKit Dynamics"]) {
        [self startUIKitDynamics];
    }
}

- (void)startUIViewAnimation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 40, 40)];
    view.backgroundColor = [UIColor redColor];
    view.alpha = 0;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:1.0 animations:^{
                view.alpha = 1;
                view.frame = CGRectMake(100, 400, 140, 140);
            } completion:^(BOOL finished) {
                // 第一个动画完成后执行第二个动画
                [UIView animateWithDuration:2.0 animations:^{
                    // 第二个动画
                    view.frame = CGRectMake(300, 400, 140, 140);
                    view.backgroundColor = [UIColor grayColor];
                    view.alpha = 0;
                } completion:^(BOOL finished) {
                    [view removeFromSuperview];
                }];
                
            }];
}

- (void)startCoreAnimation {
//    除了旋转动画（rotationAnimation），Core Animation 还提供了许多其他类型的动画效果，例如平移动画（translationAnimation）、缩放动画（scaleAnimation）、淡入淡出动画（opacityAnimation）等
    
#pragma -mark demo01 CoreAnimation创建动画
    // 创建旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2);
    rotationAnimation.duration = 1.0;

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 40, 40)];
    view1.backgroundColor = [UIColor redColor];
    view1.alpha = 1;
    [self.view addSubview:view1];
    
    // 添加动画到视图的 layer 中
    [view1.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
#pragma -mark demo02 CoreAnimation创建动画 CATransaction监听动画结束
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(60, 350, 40, 40)];
    view2.backgroundColor = [UIColor redColor];
    view2.alpha = 1;
    [self.view addSubview:view2];
    
    // 使用 CATransaction 监听动画结束
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        // 动画结束后执行的操作
        [view2 removeFromSuperview];
    }];
    
    // 创建旋转动画
    CABasicAnimation *rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation2.toValue = @(M_PI * 2);
    rotationAnimation2.duration = 1.0;


    
    // 添加动画到视图的 layer 中
    [view2.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [CATransaction commit];

#pragma -mark demo03 CAAnimationGroup 并监听动画结束
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(120, 350, 40, 40)];
    view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view3];
    
    //创建第一个动画 旋转动画
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.toValue = @(M_PI * 2);
    rotateAnimation.duration = 1.0;
    
    //创建第二个动画 缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0;
    scaleAnimation.toValue = @0.5;
    scaleAnimation.duration = 2.0;
    
    //创建第三个动画 平移动画
    CABasicAnimation *transAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    transAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    transAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    transAnimation.duration = 2.0;
    
    //创建第4个动画 透明度动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1.0;
    opacityAnimation.toValue = @0.5;
    opacityAnimation.duration = 2.0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[rotateAnimation, scaleAnimation, transAnimation, opacityAnimation];
    animationGroup.duration = 2.0;
    

    // 使用 CATransaction 监听动画组的所有动画执行完毕
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        // 动画执行完毕后移除 view
        [view3 removeFromSuperview];
    }];
    //将动画添加到图层上
    [view3.layer addAnimation:animationGroup forKey:nil];
    [CATransaction commit];
}

- (void)startUIKitDynamics {
//    UIKit Dynamics 是 iOS 中的一个强大的物理引擎框架，可以用于实现各种动态和真实感的用户界面效果。它提供了一系列的力、重力、碰撞和附着等行为，可以用来创建交互性强的界面元素。
    
  
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];

    // 创建一个 UIDynamicAnimator 对象
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    // 创建一个 UIGravityBehavior 对象，并将视图添加到重力行为中
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[greenView]];
    [animator addBehavior:gravityBehavior];

    // 创建一个 UICollisionBehavior 对象，并将视图添加到碰撞行为中
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[greenView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES; // 将边界设为参考视图的边界
    [animator addBehavior:collisionBehavior];


    // 创建一个 UIDynamicItemBehavior 对象，并设置红色方块视图的弹性和阻力
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[greenView]];
    itemBehavior.elasticity = 0.6; // 设置弹性系数
    itemBehavior.friction = 0.3; // 设置阻力系数
    [animator addBehavior:itemBehavior];

}
@end
