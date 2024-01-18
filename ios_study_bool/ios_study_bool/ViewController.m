//
//  ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/14.
//

#import "ViewController.h"
#import "KeyWordViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *functions;
@end

@implementation ViewController

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
  
# pragma-mark 预定义宏的使用
//    NSLog(@"预定义宏 _FILE_： 当前源文件的文件名%s ", __FILE__);
//    NSLog(@"预定义宏 __LINE__： 当前代码行号%d ", __LINE__);
//    NSLog(@"预定义宏 __FUNCTION__： 当前所在的函数名%s ", __FUNCTION__);
//    NSLog(@"预定义宏 __PRETTY_FUNCTION__： 当前所在的函数名,更详细%s ", __PRETTY_FUNCTION__);
//    NSLog(@"预定义宏 __IPHONE_OS_VERSION_MIN_REQUIRED: 标设备的最低iOS版本 %d ", __IPHONE_OS_VERSION_MIN_REQUIRED);
//    NSLog(@"预定义宏 __IPHONE_OS_VERSION_MAX_ALLOWED: 当前编译环境支持的最高iOS版本%d  ", __IPHONE_OS_VERSION_MAX_ALLOWED);
//    KeyWordViewController *targetVC = [[KeyWordViewController alloc] init];
//    [self.navigationController pushViewController:targetVC animated:YES];

# pragma-mark 字符串、数组、字典基本操作
//    NSString *str = @"a string";
//    //拼接
//    str = [NSString stringWithFormat:@"b string %@", str];
//    NSLog(@"%@", str);
//    //子串
//    NSLog(@"%@", [str substringFromIndex:1]);
//    NSLog(@"%@", [str substringToIndex:5]);
//    NSLog(@"%@", [str substringWithRange:NSMakeRange(1, 4)]);
//    //访问
//    NSLog(@"%c", [str characterAtIndex:0]);
//    //反转
//    //反转要自己实现
//    NSLog(@"%@", [str uppercaseString]);
//    NSLog(@"%@", [@"ABCdef" lowercaseString]);
//    //比较
//    NSLog(@"%@", [@"123" isEqualToString:@"123"] ? @"YES": @"NO");
//
//    //查找
//    NSRange range = [@"123456789" rangeOfString:@"123"];
//    if (range.location != NSNotFound) {
//        NSLog(@"not found");
//    } else {
//        NSLog(@"found");
//    }
//
//    //字符串分割
//    NSArray *a = [@"1,2,3,4" componentsSeparatedByString:@","];
//    for (NSString *str in a) {
//        NSLog(@"%@", str);
//    }
//
//    //字符串替换
//    NSLog(@"%@", [@"12345678" stringByReplacingOccurrencesOfString:@"456" withString:@"AAA"]);
    
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
