//
//  UINavigationViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/11.
//

#import "UINavigationViewController.h"
#import "TipUtil.h"
@interface UINavigationViewController ()
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@end

@implementation UINavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2*self.view.frame.size.height);
    [self.view addSubview:_scrollView];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"UINavigationController介绍";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 350)];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label.text = @"UINavigationController 是 UIKit  \n  \
        框架中的一个视图控制器容器，用于管理层级式导航界面。 \n \  它提供了基于栈结构的导航管理功能，可以用来在应用程序中实现多层级的 页面导航和返回操作。 \n \
特点： \n \
* 层级导航管理： UINavigationController 使用栈结构管理视图控制器，可以方便地实现层级式的页面导航和返回操作。 \n \
* 自带导航栏： 默认情况下，UINavigationController 自带顶部的导航栏，方便显示标题、返回按钮等内容。 \n \
* 支持动画切换： 可以通过 push 和 pop 操作实现视图控制器之间的切换，并支持动画效果。 \n \
        ";
        label;
    })];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 40)];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"应用场景";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 445, self.view.frame.size.width, 250)];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label.text = @" \n \
        1. 导航式页面结构： 适合用于需要展示层级关系的页面结构，例如设置页面、新闻类应用的文章详情页等。 \n \
        2. 实现页面间的导航跳转： 可以用于从一个页面跳转到另一个页面，例如表单提交后跳转到成功页面，或者从列表页跳转到详情页等。 \n \
        3. 统一管理页面导航： 可以统一管理应用中的页面导航，包括返回按钮的样式、状态栏的样式等，提供一致的用户体验。  \n \
        ";
        label;
    })];
    
    [_scrollView addSubview:({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 700, self.view.frame.size.width, 40)];
        view.backgroundColor = [UIColor blackColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        label.textColor = [UIColor whiteColor];
        label.text = @"使用方法";
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(85, 0, 70, 40)];
        [btn1 setTitle:@"Tip1" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(showTip1) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(160, 0, 90, 40)];
        [btn2 setTitle:@"根控制器" forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(showTip2) forControlEvents:UIControlEventTouchUpInside];
        
        
        [view addSubview:label];
        [view addSubview:btn1];
        [view addSubview:btn2];
        view;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 745, self.view.frame.size.width, 850)];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label.text = @" \n \
         1.跳转页面 \n \
        [self.navigationController pushViewController:viewController animated:YES]; \n \
         2.返回页面  \n \
        [self.navigationController popViewControllerAnimated:YES];  \n \
         3.模态弹出页面 \n \
        [self presentViewController:viewController animated:YES completion:nil]; \n \
         4.关闭模态弹出页面： \n \
         [self dismissViewControllerAnimated:YES completion:nil]; \n \
         5.在导航控制器的根视图控制器中设置一个新的视图控制器：\n \
        [self.navigationController setViewControllers:@[viewController] animated:YES]; \n \
         6.在导航控制器的根视图控制器中删除一个视图控制器： \n \
          NSMutableArray *viewControllers = [NSMutableArray  \n \ arrayWithArray:self.navigationController.viewControllers];  \n \
          [viewControllers removeObjectAtIndex:index];  \n \
          [self.navigationController setViewControllers:viewControllers animated:YES];  \n \
         \n \
         7.弹出到指定的视图控制器： \n \
        [self.navigationController popToViewController:specificViewController animated:YES];  \n \
         8.弹出到导航堆栈中的根视图控制器  \n \
        [self.navigationController popToRootViewControllerAnimated:YES]; \n \
        \n \
        ";
        label;
    })];
}


- (void)showTip1 {
    NSString *title = @"setViewControllers";
    NSString *tip = @" \n \
    Tip: \n \ 在导航控制器的根视图控制器中设置一个新的视图控制器实际上是用来替换当前导航堆栈中的所有视图控制器，并显示新设置的视图控制器。这个操作通常用于重置导航堆栈，例如在用户完成某个流程后返回到主页或者跳转到其他特定页面。 \n \
        \n \
        虽然这个操作也会导致页面的切换，但与普通的页面跳转不同，它会直接替换整个导航堆栈，而不是在当前页面之上叠加新的页面。这意味着在设置新的视图控制器后，之前的导航历史将被清除，用户无法通过返回按钮回到之前的页面。  \n \
        \n \
        总的来说，设置一个新的视图控制器在功能上类似于一种特殊的跳转页面操作，但其效果更像是重置导航堆栈，而不是简单的页面切换  \n \
";
    [TipUtil showTip:tip title:title inController:self];
}

- (void)showTip2 {
    NSString *title = @"根 UINavigationController";
    NSString *tip = @" \n \
    Tip: \n \
    在 iOS 应用程序中，通常需要设置一个根 UINavigationController 来管理应用程序的页面导航。\n \
    根 UINavigationController 提供了一个导航堆栈，用于按顺序管理视图控制器的推入（push）和弹出（pop）操作。 \n \
    在应用程序的主入口（通常是 AppDelegate.m 文件中的 application:didFinishLaunchingWithOptions: 方法）， \n \
    你可以创建并设置根 UINavigationController，并将其作为窗口的根视图控制器。例如： \n \
    \n \
    YourViewController *rootViewController = [[YourViewController alloc] initWithNibName:@YourViewController bundle:nil]; \n \
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];  \n \
    self.window.rootViewController = navigationController; \n \
    \n \
    通过设置根 UINavigationController，你可以使用其提供的导航栈来实现页面之间的跳转和管理。 \n \
    可以通过调用导航控制器的 pushViewController:animated: 方法推入新的视图控制器，或者调用 popViewControllerAnimated: 方法从导航堆栈中弹出视图控制器。 \n \
";
    [TipUtil showTip:tip title:title inController:self];
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
