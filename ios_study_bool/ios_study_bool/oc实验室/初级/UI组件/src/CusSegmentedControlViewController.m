//
//  CusSegmentedControlViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/9.
//

#import "CusSegmentedControlViewController.h"

@interface CusSegmentedControlViewController ()
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@end

@implementation CusSegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 2*self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        label.text = @"UISegmentedControl介绍";
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 100)];
        label.text = @"UISegmentedControl用于显示多个选项，并且只能选择其中一个选项。它通常以水平排列的方式展示，每个选项用一个按钮表示。";
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label;
    })];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 155, self.view.frame.size.width, 40)];
        label.text = @"UISegmentedControl应用场景";
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 205, self.view.frame.size.width, 200)];
        label.text = @"UISegmentedControl的应用场景非常广泛，比如： \n \
        导航栏切换：可以将不同的视图控制器关联到不同的选项，实现导航栏的切换功能。 \n \
        设置选项：可以用来选择应用程序的设置选项，比如夜间模式、字体大小等。 \n \
        选择过滤条件：可以在列表或者表格中使用，用来选择不同的过滤条件，从而实现数据的筛选功能。";
        label.numberOfLines = 0;
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    
    // 创建一个UISegmentedControl对象
    NSArray *segmentItems = @[@"选项一", @"选项二", @"选项三"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentItems];

    // 设置segmentedControl的位置和大小
    segmentedControl.frame = CGRectMake(50, 410, 200, 30);

    // 默认选中第一个选项
    segmentedControl.selectedSegmentIndex = 0;
    // 添加事件处理方法
    [segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];

    // 将segmentedControl添加到视图中
    [_scrollView addSubview:segmentedControl];

}

- (void)segmentedControlValueChanged:(UISegmentedControl*)segControl {
    NSLog(@"选中的index %ld", segControl.selectedSegmentIndex);
}



- (void)categoryChange:(UISegmentedControl*)segControl {
    
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
