//
//  CusUICollectionViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/28.
//

#import "CusUICollectionViewController.h"


// YourCustomCollectionViewCell.h
@interface CustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel; // 显示标题的Label

@end

// YourCustomCollectionViewCell.m
@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

@end


@interface CusUICollectionViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property(nonatomic, strong, readwrite) UIScrollView* scrollView;
@property(nonatomic, strong, readwrite) NSArray* array1;
@property(nonatomic, strong, readwrite) UICollectionView *collectionView1;
@end

@implementation CusUICollectionViewController

- (NSArray*)array1 {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}
- (void)buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 3*self.view.frame.size.height);
    
    [self.view addSubview:_scrollView];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        label.text = @"UICollectionView介绍";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 120)];
        label.numberOfLines = 0;
        label.text = @"UICollectionView用于在iOS应用程序中展示可滚动的网格布局或自定义布局的内容。它是UITableView的一个更灵活的替代方案，用于展示多列的数据项目。";
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, self.view.frame.size.width, 40)];
        label.text = @"应用场景";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 215, self.view.frame.size.width, 150)];
        label.numberOfLines = 0;
        label.text = @"UICollectionView适用于许多场景，包括但不限于： \n \
        展示网格状的图像或数据列表。 \n \
        创建类似于应用程序主屏幕上的网格式布局。 \n \
        实现水平滚动的横向布局，例如图片轮播、时间轴等。 \n \
        自定义布局，例如瀑布流布局、环形布局等。";
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 370, self.view.frame.size.width, 40)];
        label.text = @"使用步骤";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 415, self.view.frame.size.width, 300)];
        label.numberOfLines = 0;
        label.text = @"  \
        1.初始化布局UICollectionViewFlowLayout *collectionView = [[UICollectionViewFlowLayout alloc] initWithFrame:frame]; \n \
        2.初始化collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout: layout]]; \n \
        3.遵循代理，设置代理, @interface myClass()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource> \n \
          collectionView.delegate = self; \n \
          collectionView.dataSource = self; \n \
        4.实现代理方法 numberOfItemsInSection  cellForItemAtIndexPath \n \
        ";
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
        //步骤1 创建UICollectionViewFLowOut实例
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10; //设置垂直方向上的间距
        layout.minimumInteritemSpacing = 10; //设置水平方向上的间距
        layout.itemSize = CGSizeMake(80, 80); //设置每个item的大小
        
        //2.创建UICollectionView 实例
        _collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 730, self.view.frame.size.width, 150) collectionViewLayout:layout];

        _collectionView1.dataSource = self;
        _collectionView1.delegate = self;
        _collectionView1.backgroundColor = [UIColor redColor];
        _collectionView1;
    })];
    [_collectionView1 registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array1.count;
}
// 注册自定义的UICollectionViewCell类
//   [self.collectionView registerClass:[YourCustomCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CustomCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    }
     // 根据indexPath获取对应的数据
     NSString *dataModel = self.array1[indexPath.item];
     // 配置自定义的UICollectionViewCell
     cell.titleLabel.text = dataModel;
    cell.layer.borderWidth = 1.5;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
     return cell;
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




