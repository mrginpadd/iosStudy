//
//  Demo01Part1ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/10.
//

#import "Demo01Part1ViewController.h"
#import "Demo01Item.h"
@interface Demo01Part1ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray<Demo01Item*>* items;
@end

@implementation Demo01Part1ViewController

- (void)_loadData {
    NSMutableArray *data = @[].mutableCopy;
    for(int i=0; i<40; i++) {
        Demo01Item *item = [[Demo01Item alloc] initWithName:[NSString stringWithFormat:@"Item %d", i]];
        [data addObject:item];
    }
    self.items = [data copy];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _buildViews];
    [self _commonInit];
    // Do any additional setup after loading the view.
}

- (void)_buildViews {
    self.navigationItem.title = @"不使用ViewModel的列表";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.tableView];
}

- (void)_commonInit {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self _loadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    Demo01Item *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

@end
