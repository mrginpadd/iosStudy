//
//  ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/14.
//

#import "ViewController.h"
#import "KeyWordViewController.h"
#import "LangManager.h"
#import "UIComponentsViewController.h"
#import "CustomTableViewCell.h"
#import "CusEventViewController.h"
#import <WebKit/WebKit.h>
#import "CusRouteViewController.h"
#import "CusAnimateViewController.h"
#import "CusStorageViewController.h"
#import "CusDataTransViewController.h"
#import "CusNetWorkViewController.h"
#import "CusThreadAsyncViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray<NSArray*> *functions;
@property(nonatomic, strong, readwrite) NSArray *sections;
@end

@implementation ViewController

- (NSArray *) functions {
    if (_functions == nil) {
      _functions = @[
          @[@"语言基础", @"UI组件", @"事件交互", @"路由与导航", @"动画", @"存储", @"数据传递", @"网络与Json"],
          @[@"多线程和异步", @"事件循环机制", @"性能优化", @"常用第三方库", @"Extensions"],
          @[@"Jekins", @"自动化编译", @"Xcode配置"]
      ];
    }

    return _functions;
}

- (NSArray *) sections {
    if (_sections == nil) {
       _sections = @[@"初级", @"中级", @"高级"];
    }

    return _sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self buildViews];
    // Do any additional setup after loading the view.
}

- (void)buildViews {
    
    [self buildNaviBarView];
    
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;


    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - navigationBarHeight) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cellId"];

    [self.view addSubview:self.tableView];
}

- (void)buildNaviBarView {
    // 创建一个UIImageView对象，用于显示头像
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    avatarImageView.image = [UIImage imageNamed:@"size20"];
    avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2;
    avatarImageView.clipsToBounds = YES;
    avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
    avatarImageView.backgroundColor = [UIColor grayColor];

    // 创建一个UIBarButtonItem对象，并将它设置为UIImageView对象
    UIBarButtonItem *avatarBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:avatarImageView];
    self.navigationItem.leftBarButtonItem = avatarBarButtonItem;
    

    self.navigationItem.title = @"徐さんの実験室";
    // 创建一个字典，用于设置导航栏标题的样式
    NSDictionary *titleAttributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor], // 设置标题颜色为红色
        NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0] // 设置标题字体大小和粗细
    };
    // 将标题样式应用到导航栏标题
    self.navigationController.navigationBar.titleTextAttributes = titleAttributes;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // 创建两个UIBarButtonItem对象，用于展示不同的选项
    UIBarButtonItem *option1BarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"TODO" style:UIBarButtonItemStylePlain target:self action:@selector(option1ButtonPressed)];
    UIBarButtonItem *option2BarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"网站" style:UIBarButtonItemStylePlain target:self action:@selector(option2ButtonPressed)];
    NSArray *rightBarButtonItems = @[option1BarButtonItem, option2BarButtonItem];
    
    // 将UIBarButtonItem对象设置为导航栏的右侧按钮
    self.navigationItem.rightBarButtonItems = rightBarButtonItems;
}

# pragma-mark UITableView代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedStr = self.functions[indexPath.section][indexPath.row];
    if ([selectedStr isEqualToString:@"语言基础"]) {
        [LangManager perform:STR];
    } else if([selectedStr isEqualToString:@"UI组件"]) {
        UIComponentsViewController *targetVC = [[UIComponentsViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr isEqualToString:@"事件交互"]) {
        CusEventViewController *targetVC = [[CusEventViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"路由与导航"]) {
        CusRouteViewController *targetVC = [[CusRouteViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"动画"]) {
        CusAnimateViewController *targetVC = [[CusAnimateViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"存储"]) {
        CusStorageViewController *targetVC = [[CusStorageViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"数据传递"]) {
        CusDataTransViewController *targetVC = [[CusDataTransViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"网络与Json"]) {
        CusNetWorkViewController *targetVC = [[CusNetWorkViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"多线程和异步"]) {
        CusThreadAsyncViewController *targetVC = [[CusThreadAsyncViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }

    cell.titleLabel.text = self.functions[indexPath.section][indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functions[section].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section];
}

- (void)option2ButtonPressed{
    UIViewController *vc = [[UIViewController alloc] init];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[self.view bounds]];
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.bazi-test.com/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    vc.navigationItem.title = @"我的个人网站";
    [vc.view addSubview:webView];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
