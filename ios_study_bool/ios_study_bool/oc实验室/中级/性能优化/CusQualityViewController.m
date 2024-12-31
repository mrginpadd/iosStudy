//
//  CusQualityViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/13.
//

#import "CusQualityViewController.h"

@interface CusQualityViewController ()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray<NSString*> *datas;
@end

@implementation CusQualityViewController

- (NSArray<NSString*> *) datas{
    if (_datas == nil) {
        _datas = @[
          @"日志"
        ];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];

    for(int i=0; i<10000000; i++) {
        UIImage *image = [UIImage imageNamed:@"animate1.jpg"];
    }
}

- (void)setupViews {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.titleLabel.text = self.datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
@end
