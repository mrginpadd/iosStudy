//
//  KeyWordViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/15.
//

#import "KeyWordViewController.h"


@interface KeyWordViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *functions;
@end

@implementation KeyWordViewController

- (NSArray *) functions {
    if (_functions == nil) {
      _functions = @[@"关键词", @"UI组件", @"事件交互", @"路由与导航", @"动画", @"存储"];
    }

    return _functions;
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
    NSLog(@"点击了单元格");
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
        label.text = self.functions[indexPath.row];
        label.textAlignment = NSTextAlignmentCenter;
         label;
    })];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functions.count;
}


@end

