//
//  Demo02Part2ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/10.
//

#import "Demo01Part2ViewController.h"

@interface Demo01Part2ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) Demo01ListViewModel* listViewModel;
/*
 实现列表时不使用ViewModel适合简单的场景。
 如果复杂了，会导致视图控制器ViewController代码变得臃肿难以维护。
 数据和业务逻辑和UI紧密耦合。且不利于代码复用。
 因为所有逻辑都几种在视图控制器内。
 
 使用ViewModel适用于较复杂的场景
 使得视图控制器ViewController代码更简洁，专注于UI呈现。
 数据管理被放到listViewModel中，使得数据管理和业务逻辑分离，便于维护。
 更好的代码组织和重用性。
 缺点时额外定义了ViewModel类，增加了项目的复杂度。
 
 在大型项目中使用ViewModel去分散ViewController中的数据管理代码是更好的选择
 */
@property(nonatomic, strong) UITableView* tableView;
@end

@implementation Demo01Part2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _buildViews];
    [self _commonInit];
}

- (void)_buildViews {
    self.navigationItem.title = @"使用ViewModel实现列表";
    self.view.backgroundColor = [UIColor blueColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)_commonInit {
    self.listViewModel = [[Demo01ListViewModel alloc] init];
    [self.listViewModel loadData];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listViewModel.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Demo01Item *item = self.listViewModel.items[indexPath.row];
    cell.textLabel.text = item.name;
    
    return cell;
}
@end
