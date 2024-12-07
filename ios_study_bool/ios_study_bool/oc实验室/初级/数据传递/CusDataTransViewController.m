//
//  CusDataTransViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/6.
//

#import "CusDataTransViewController.h"
#import "IntroductionViewController.h"
#import "CusDataByDelegateViewController.h"
#import "CusCompletionViewController.h"
#import "CusDataByNotificationViewController.h"
#import "CusDataByKVOViewController.h"
@interface CusDataTransViewController ()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray *sections;
@property(nonatomic, copy) NSArray<NSArray*> *names;
@end

@implementation CusDataTransViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (NSArray*)sections {
    if (_sections == nil) {
        _sections = @[
          @"一对一",
          @"一对多"
        ];
    }
    return _sections;
}


- (NSArray<NSArray*>*)names {
    if (_names == nil) {
        _names = @[
          @[@"委托Delegate", @"回调Completion"],
          @[@"通知Notification", @"KVO"],
        ];
    }
    return _names;
}

- (void)setupViews {
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:NSClassFromString(@"CustomTableViewCell") forCellReuseIdentifier:@"cellId"];

    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names[section].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = self.names[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *clickTitle = _names[indexPath.section][indexPath.row];
    if ([clickTitle isEqualToString:@"委托Delegate"]) {
        CusDataByDelegateViewController *targetVC = [[CusDataByDelegateViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([clickTitle isEqualToString:@"回调Completion"]) {
        CusCompletionViewController *targetVC = [[CusCompletionViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([clickTitle isEqualToString:@"通知Notification"]) {
        CusDataByNotificationViewController *targetVC = [[CusDataByNotificationViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([clickTitle isEqualToString:@"KVO"]) {
        CusDataByKVOViewController *targetVC = [[CusDataByKVOViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}
@end
