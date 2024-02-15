//
//  CusUITabbarViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/11.
//

#import "CusUITabbarViewController.h"

@interface CusUITabbarViewController ()<UITabBarDelegate, UITabBarControllerDelegate>
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@end

@implementation CusUITabbarViewController

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
        label.text = @"UITabBarController介绍";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 150)];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label.text = @"UITabBarController 是 UIKit 框架中的一个视图控制器，用于实现标签栏界面。 \n \ 它通常用于在应用程序中创建具有多个页面或模块的导航结构。UITabBarController  \n \ 提供了一个标签栏，通过点击不同的标签，可以切换显示不同的视图控制器内容。";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 210, self.view.frame.size.width, 40)];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"应用场景";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 260, self.view.frame.size.width, 150)];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label.text = @"主要用于创建具有多个独立页面/模块的应用程序，例如新闻应用、社交媒体应用、电商应用等。 \n \
        在应用程序的不同功能模块之间进行导航和切换。 \n \
        适用于需要在顶部或底部提供快速导航的应用。";
        label;
    })];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 420, self.view.frame.size.width, 40)];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label.text = @"使用步骤";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 470, self.view.frame.size.width, 300)];
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label.text = @"1.创建 UITabBarController 对象: UITabBarController *tabBarController = [[UITabBarController alloc] init]; \n \
       2. 设置视图控制器数组  tabBarController.viewControllers = @[firstVC, secondVC];  \n \
       3. 将每个视图控制器和对应的标签项关联起来。 \n  \
        UITabBarItem *firstTabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:nil];  \n \
        FirstViewController *firstVC = [[FirstViewController alloc] init];  \n \
      ";
        label;
    })];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view = [[UIView alloc] initWithFrame:[self.view bounds]];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.view.tag = 1;
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view = [[UIView alloc] initWithFrame:[self.view bounds]];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.view.tag = 2;
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view = [[UIView alloc] initWithFrame:[self.view bounds]];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.view.tag = 3;
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view = [[UIView alloc] initWithFrame:[self.view bounds]];
    vc4.view.backgroundColor = [UIColor blueColor];
    vc4.view.tag = 4;
    
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"tab1" image:[UIImage imageNamed:@"size20"] tag:0];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"tab2" image:[UIImage imageNamed:@"size20"] tag:1];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"tab3" image:[UIImage imageNamed:@"size20"] tag:2];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"tab4" image:[UIImage imageNamed:@"size20"] tag:3];

    vc1.tabBarItem = tabBarItem1;
    vc2.tabBarItem = tabBarItem2;
    vc3.tabBarItem = tabBarItem3;
    vc4.tabBarItem = tabBarItem4;
    
    tabBarController.viewControllers = @[vc1, vc2, vc3, vc4];
    tabBarController.tabBar.tintColor = [UIColor blackColor]; //选中状态颜色
    tabBarController.tabBar.unselectedItemTintColor = [UIColor whiteColor]; //未选中状态颜色
    
    // 可以设置 UITabBarController 的 frame 或者约束来调整其位置和大小
    tabBarController.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    self.view.window.rootViewController = tabBarController;
    tabBarController.delegate = self;
    
    // 将 UITabBarController 添加到当前页面的视图层级中
    [_scrollView addSubview:tabBarController.view];
    [self addChildViewController:tabBarController];
    [tabBarController didMoveToParentViewController:self];
//
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController API_AVAILABLE(ios(3.0)) {
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"选择了tabbarController , tag: %d", viewController.view.tag);
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(tvos) {
    NSLog(@"%@", __func__);
}
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(tvos) {
    NSLog(@"%@", __func__);
}
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed API_UNAVAILABLE(tvos) {
    NSLog(@"%@", __func__);
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
