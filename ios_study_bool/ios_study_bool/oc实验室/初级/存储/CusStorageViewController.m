//
//  CusStorageViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/17.
//

#import "CusStorageViewController.h"
#import "CustomTableViewCell.h"
#import "CusUserDefaultViewController.h"
@interface CusStorageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray* names;
@end

@implementation CusStorageViewController
- (NSArray<NSString*>*)names {
    if (_names == nil) {
        _names = @[
         @"UserDefaults少量数据",
         @"NSFileManager文件存储",
         @"Property List 配置信息",
         @"NSKeyedArchiver序列化与反序列化",
         @"SQLite数据库",
         @"Keychain 敏感数据"
        ];
    }
    return _names;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cellId"];
    
    [self.view addSubview:_tableView];
}

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
    if ([_names[indexPath.row] isEqualToString:@"UserDefaults少量数据"]) {
        CusUserDefaultViewController *targetVC = [[CusUserDefaultViewController alloc] init];
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
