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
    self.view.backgroundColor = [UIColor greenColor];
    [self buildViews];
    // Do any additional setup after loading the view.
}

- (void)buildViews {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];

    [self.view addSubview:self.tableView];
}

# pragma-mark UITableView代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedStr = self.functions[indexPath.section][indexPath.row];
    if ([selectedStr isEqualToString:@"语言基础"]) {
        [LangManager perform:DEFINE];
    } else if([selectedStr isEqualToString:@"UI组件"]) {
        UIComponentsViewController *targetVC = [[UIComponentsViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        
    }
//    cell.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    [cell.contentView addSubview:({
         UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 56)];
        label.text = self.functions[indexPath.section][indexPath.row];
        label.textAlignment = NSTextAlignmentCenter;
         label;
    })];
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

@end
