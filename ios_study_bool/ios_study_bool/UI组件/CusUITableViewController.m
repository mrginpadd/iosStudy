//
//  UITableViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/27.
//

#import "CusUITableViewController.h"
#import "FakeUtil.h"
@interface CusUITableViewController ()<UITableViewDelegate, UITableViewDelegate, CusTableViewCellDelegate>
@property(nonatomic, strong, readwrite) UIScrollView* scrollView;
@property(nonatomic, strong, readwrite) UITableView *tableView1;
@property(nonatomic, strong, readwrite) UITableView *tableView2;
@property(nonatomic, strong, readwrite) NSMutableArray* selectedCellIndex;
@property(nonatomic, strong, readwrite) NSArray* array2;
@end

@implementation CusUITableViewController
- (NSArray*) array2 {
    if (_array2 == nil) {
       _array2 = [FakeUtil generateChineseSentences:10];
    }
    return _array2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self buildViews];
}

- (void)buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildScrollView];
    [self buildIntroLabel];
    [self buildIntroView];
    [self buildApplicationLabel];
    [self buildApplicationView];
    [self buildUseLabel];
    [self buildUseView];
    [self buildTableView1];
    [self buildTableView2];
}

- (void)buildScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 4 * self.view.frame.size.height);
    [self.view addSubview:_scrollView];
}

- (void)buildIntroLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    label.attributedText = [[NSAttributedString alloc] initWithString:@"UITableView介绍" attributes:@{
        NSForegroundColorAttributeName: [UIColor whiteColor]
    }];
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
}

- (void)buildIntroView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 60)];
    label.text = @"UITableView，它可以用于显示列表数据，是显示可滚动的、可复用的多行数据的控件。";
    label.textColor = [UIColor grayColor];
    label.numberOfLines = 0;
    [_scrollView addSubview:label];
}

- (void)buildApplicationLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, self.view.frame.size.width, 40)];
    label.attributedText = [[NSAttributedString alloc] initWithString:@"应用场景" attributes:@{
        NSForegroundColorAttributeName: [UIColor whiteColor]
    }];
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
}

- (void)buildApplicationView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 100)];
    label.numberOfLines = 0;
    label.text = @"展示列表数据，如邮件列表、联系人列表、新闻列表等。\n \
    实现树形结构，如文件目录、分类列表等。\n \
    实现表单输入，如注册表单、设置页面等。";
    label.textColor = [UIColor grayColor];
    [_scrollView addSubview:label];
}
- (void)buildUseLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 265, self.view.frame.size.width, 40)];
    label.text = @"使用步骤";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
}

- (void)buildUseView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 310, self.view.frame.size.width, 350)];
    label.numberOfLines = 0;
    label.textColor = [UIColor grayColor];
    label.text = @" 1.创建UITableView对象 \n \
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, \n  self.view.bounds.size.height) style:UITableViewStylePlain]; \n \ 2.设置代理 \n \
    @interface CusUITableViewController ()<UITableViewDelegate, UITableViewDelegate> \n \
    设置 UITableView 的数据源和代理为当前 ViewController  \n \
    tableView.dataSource = self;  \n \
    tableView.delegate = self; \n 3.实现代理方法  \n \
    必须实现:numberOfRowsInSection  cellForRowAtIndexPath \
    ";
    [_scrollView addSubview:label];
}

- (void)buildTableView1 {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 670, self.view.frame.size.width, 40)];
    label.text = @"自定义单元格、单元格复用机制";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
    
    _selectedCellIndex = [[NSMutableSet alloc] init];
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 720, self.view.frame.size.width, 150)];
    [_tableView1 registerClass:[CusTableViewCell class] forCellReuseIdentifier:@"Cell1"];
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    _tableView1.backgroundColor = [UIColor grayColor];
    _tableView1.layer.borderWidth = 2.0;
    _tableView1.layer.borderColor = [UIColor blueColor].CGColor;
    [_scrollView addSubview:_tableView1];
}

- (void)buildTableView2 {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 880, self.view.frame.size.width, 40)];
    label.text = @"下拉刷新、上拉加载更多";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 930, self.view.frame.size.width, 200)];
    [_tableView2 registerClass:[CusTableViewCell class] forCellReuseIdentifier:@"Cell1"];
    
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    
    _tableView2.backgroundColor = [UIColor grayColor];
    _tableView2.layer.borderWidth = 2.0;
    _tableView2.layer.borderColor = [UIColor blueColor].CGColor;
    
#pragma-mark -下拉刷新
    // 创建 UIRefreshControl 对象
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    // 将 refreshControl 设置为 tableView 的 refreshControl 属性
    _tableView2.refreshControl = refreshControl;
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    headerView.backgroundColor = [UIColor blackColor];
    _tableView2.tableHeaderView = headerView;
    [headerView addSubview:({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
            label.text = @"UITableHeaderView";
        label.textColor = [UIColor whiteColor];
            label;
    })];
    
    [_scrollView addSubview:_tableView2];
}
- (void)refreshData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.array2 = [FakeUtil generateChineseSentences:10];
        [self.tableView2 reloadData];
       [self.tableView2.refreshControl endRefreshing];
    });
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tableView1) {
        return 20;
    } else if (tableView == _tableView2) {
        return self.array2.count;
    } else {
        return 1;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 返回单元格
    CusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CusTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell1"];
     
    }
    cell.delegate = self;
    
    if (tableView == _tableView1) {
        cell.leftImageView.image = [UIImage imageNamed:@"小丑"];
        cell.backgroundColor = [UIColor darkGrayColor];
        cell.titleLabel.text = [NSString stringWithFormat:@"我是单元格 %ld  %@: %@", (long)indexPath.row, @"是否被选中", [_selectedCellIndex containsObject:@(indexPath.row)] ? @"选中" : @"未选中"] ;
     
        cell.titleLabel.adjustsFontSizeToFitWidth = YES;
        cell.titleLabel.minimumScaleFactor = 0.3;
        
        BOOL isSelected = [_selectedCellIndex containsObject:indexPath];
        if (isSelected) {
            [cell.rightButton setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        } else {
            [cell.rightButton setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
        }
    } else if(tableView == _tableView2) {
        cell.leftImageView.image = [UIImage imageNamed:@"小丑"];
        cell.backgroundColor = [UIColor darkGrayColor];
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld %@", (long)indexPath.row, _array2[indexPath.row]];
     
        cell.titleLabel.adjustsFontSizeToFitWidth = YES;
        cell.titleLabel.minimumScaleFactor = 0.3;
        cell.rightButton.hidden = YES;

    }
    return cell;
}

- (void)cell:(CusTableViewCell *)cell{
    NSIndexPath* indexPath = [_tableView1 indexPathForCell:cell];
    
//    [_tableView deselectRowAtIndexPath:indexPath animated:YES];

    if ([self.selectedCellIndex containsObject:indexPath]) {
        [self.selectedCellIndex removeObject:indexPath];
    } else {
        [self.selectedCellIndex addObject:indexPath];
    }

    [_tableView1 reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];


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

@implementation CusTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加左边的图片视图
        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        self.leftImageView.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:self.leftImageView];
        
        // 添加中间的标题标签
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 250, 40)];
        self.titleLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.titleLabel];

        // 添加右边的单选按钮
        self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 15, 30, 30)];
        self.rightButton.backgroundColor = [UIColor redColor];

//        [self.rightButton setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
     
        [self.rightButton addTarget:self action:@selector(tapSelectedBtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.rightButton];
    }
    return self;
}

-(void)tapSelectedBtn {

    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(cell:)]) {
        [self.delegate cell:self];
    }
}
@end
