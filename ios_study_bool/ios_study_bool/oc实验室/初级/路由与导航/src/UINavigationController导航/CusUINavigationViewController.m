//
//  CusUINavigationViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusUINavigationViewController.h"
#import "IntroductionViewController.h"
@interface CusUINavigationViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusUINavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"UINavigationController介绍";
    vc.introContentLabel.text = @" \n \
    UINavigationController 是一个容器视图控制器，用于管理多个视图控制器的导航堆栈。 \n \
    通过 UINavigationController 可以实现页面之间的导航和跳转，  \n \
    并提供了一些方便的方法和属性来管理导航栈、导航栏等。 \n \
    ";
    
    vc.attributeContentLabel.text = @"  \n \
    viewControllers: 一个包含当前导航栈中所有视图控制器的数组。 \n \
    topViewController: 当前导航栈顶部的视图控制器。 \n \
    visibleViewController: 当前可见的视图控制器。 \n \
    navigationBar: 导航栏对象，用于自定义导航栏的外观和行为。 \n \
    delegate: 导航控制器的代理对象，可以监听导航栈的变化并执行相应的操作。 \n \
    ";
    
    vc.applicationContentLabel.text = @"\n \
导航栈的管理和切换：通过 pushViewController(_:animated:) 和 popViewController(animated:) 等方法实现视图控制器的推入和弹出，实现导航栈的管理和切换。  \n \
导航栏的自定义：使用 navigationBar 属性可以自定义导航栏的外观和行为，比如修改背景颜色、添加自定义按钮等。  \n \
   导航栏的隐藏和显示：通过设置 navigationBarHidden 属性来隐藏或显示导航栏。 \n \
   导航控制器的代理操作：使用 delegate \n \ 属性来监听导航栈的变化，并执行相应的操作，比如在视图控制器切换前执行一些逻辑或动画。 \n \
    ";
    
    
    vc.useStepContentLabel.text = @"\n \
    [self.navigationController pushViewController:secondViewController animated:YES]; \n \
    [self.navigationController popViewControllerAnimated:YES]; \n \
     添加一个按钮，点击后返回上一个页面  \n \
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@\"Back\"  \n \ style:UIBarButtonItemStylePlain target:self action:@selector(backButtonTapped)];  \n \
    self.navigationItem.leftBarButtonItem = backButton;  \n \
    ";
    
    
    [vc setUseStepTipBtns:@[@"跳转页面", @"回退页面", @"设置导航栏"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"跳转页面"]) {
        UIViewController *targetVC = [[UIViewController alloc] init];
        targetVC.title = @"新页面";
        [self.navigationController pushViewController:targetVC animated:YES];
        
    } else if([title isEqualToString:@"回退页面"]) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if([title isEqualToString:@"设置导航栏"]) {
        //左侧按钮
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左侧" style:UIBarButtonItemStylePlain target:self action:nil];
        
        // 创建系统默认返回按钮
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        self.navigationItem.leftBarButtonItems = @[backButton, leftButton];
        //设置导航栏标题
        self.navigationItem.title = @"Title";
        //设置导航栏右侧按钮
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右侧" style:UIBarButtonItemStylePlain target:self action:nil];
        self.navigationItem.rightBarButtonItem = rightButton;
    }
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
