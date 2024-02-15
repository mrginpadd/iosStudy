//
//  CusEventViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusEventViewController.h"
#import "CustomTableViewCell.h"
#import "CusDelegationViewController.h"
@interface CusEventViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) NSArray* names;
@property(nonatomic, strong, readwrite) UITableView *tableView;
@end

@implementation CusEventViewController

- (NSArray*)names {
    if (_names == nil) {
        _names =     @[
            @"委托代理 protocol - delegate",
            @"通知 notification",
            @"目标-动作 target - action",
            @"手势识别器 Gesture Recognizers"
           ];
    }
    return _names;

}
- (instancetype)init {
    self = [super init];
    if (self) {
        [_tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTableView];
    // Do any additional setup after loading the view.
}

- (void)buildTableView {
    _tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

#pragma mark - UITableViewDelagate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([_names[indexPath.row] hasPrefix:@"委托代理"]) {
        CusDelegationViewController *targetVC = [[CusDelegationViewController alloc] init];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if([_names[indexPath.row] hasPrefix:@"通知"]) {
        
    } else if([_names[indexPath.row] hasPrefix:@"目标-动作"]) {
        
    } else if([_names[indexPath.row] hasPrefix:@"手势识别器"]) {
        
    }
}

@end
