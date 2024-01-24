//
//  UIComponentsViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/21.
//

#import "UIComponentsViewController.h"
#import "UILabelViewController.h"
#import "CustomTableViewCell.h"
#import "UIButtonViewController.h"
#import "UIImageViewController.h"
#import "UISwitchViewController.h"
#import "UITextFieldViewController.h"
@interface UIComponentsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray* functions;
@end

@implementation UIComponentsViewController
- (NSArray*) functions {
    if (_functions == nil) {
        _functions = @[
        @"UILabel 用于显示静态文本内容",
        @"UIButton 用于触发操作或执行特定的功能",
        @"UIImageView 用于显示图像或图片",
        @"UISwitch 用于切换两种状态之间的开关",
        @"UITextField 用于获取用户输入的文本",
        @"UITextView 用于显示和编辑多行文本内容",
        @"UISlider 用于选择一个数值或调整某个属性的值",
        @"UIProgressView 用于显示任务的进度",
        @"UITableView 用于显示大量数据的列表或表格",
        @"UICollectionView 用于以自定义布局展示多个项目的数据",
        @"UIScrollView 用于显示和滚动超出屏幕范围的内容",
        @"UIPageControl 用于在多个页面之间进行导航或指示当前页面",
        @"UISegmentedControl 用于在多个互斥选项之间进行切换",
        @"UITabBarController 用于管理应用程序的多个主要界面",
        @"UINavigationController 用于管理应用程序的导航栈和界面切换",
        @"UIAlertController 用于显示警告、确认或输入提示",
        @"UIPickerView 用于从多个选项中选择一个或多个值",
        @"UIDatePicker 用于选择日期和时间",
        @"UIActivityIndicatorView （活动指示器）：用于显示加载或处理中的状态",
        @"UIWebView 用于在应用程序中显示网页内容"
        ];
    }
    return _functions;
}

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cellId"];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];

    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    cell.titleLabel.text = self.functions[indexPath.row];


    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functions.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedStr = _functions[indexPath.row];
    if ([selectedStr hasPrefix:@"UILabel"]) {
        UILabelViewController* targetVC = [[UILabelViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"UIButton"]) {
        UIButtonViewController* targetVC = [[UIButtonViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"UIImageView"]) {
        UIImageViewController* targetVC = [[UIImageViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"UISwitch"]) {
        UISwitchViewController* targetVC = [[UISwitchViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr hasPrefix:@"UITextField"]) {
        UITextFieldViewController* targetVC = [[UITextFieldViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
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
