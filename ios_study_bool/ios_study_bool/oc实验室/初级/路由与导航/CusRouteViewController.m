//
//  CusRouteViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusRouteViewController.h"
#import "CustomTableViewCell.h"
#import "CusUINavigationViewController.h"
#import "CusRouteCaseViewController.h"
#import "CTMediator.h"
@interface CusRouteViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray<NSArray*> *names;
@property(nonatomic, strong, readwrite) NSArray* sections;
@end

@implementation CusRouteViewController
- (NSArray<NSArray*>*)names {
    if (_names == nil) {
       _names = @[
          @[@"UINavigationController"],
          @[@"URL注册方案",
            @"Protocol-Class方案",
            @"Target-Action方案"]
       ];
    }
    return _names;
}

- (NSArray*)sections {
    if (_sections == nil) {
        _sections = @[
          @"导航控制器",
          @"组件化路由"
       ];
    }
    return _sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];

    [_tableView registerClass:NSClassFromString(@"CustomTableViewCell") forCellReuseIdentifier:@"cellId"];

    [self.view addSubview:_tableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.names[section].count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = _names[indexPath.section][indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedStr = _names[indexPath.section][indexPath.row];
    if ([selectedStr isEqualToString:@"UINavigationController"]) {
        CusUINavigationViewController *targetVC = [[CusUINavigationViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr isEqualToString:@"URL注册方案"]) {
        CusRouteCaseViewController *targetVC = [[CusRouteCaseViewController alloc]  init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr isEqualToString:@"Protocol-Class方案"]) {
        CusRouteCaseViewController *targetVC = [[CusRouteCaseViewController alloc]  init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([selectedStr isEqualToString:@"Target-Action方案"]) {
        CusRouteCaseViewController *targetVC = [[CusRouteCaseViewController alloc]  init];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}

@end
