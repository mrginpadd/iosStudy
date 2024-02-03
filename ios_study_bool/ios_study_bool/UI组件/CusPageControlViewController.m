//
//  CusPageControlViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/3.
//

#import "CusPageControlViewController.h"

@interface CusPageControlViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@property(nonatomic, strong, readwrite) UIScrollView *scrollView1;
@property(nonatomic, strong, readwrite) UIPageControl *pageControl1;
@property(nonatomic, strong, readwrite) NSTimer *timer;
@property(nonatomic, assign, readwrite) int currentPage;
@end

@implementation CusPageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 2)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 3);
    [self.view addSubview:_scrollView];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        label.text = @"UIPageControl介绍";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    })];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 80)];
        label.text = @"UIPageControl用于展示当前页面的位置和总页面数。它通常与UIScrollView等滚动视图组件配合使用，可以帮助用户了解当前所处的页面位置。";
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
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
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 215, self.view.frame.size.width, 240)];
        label.text = @"图片浏览器：当用户浏览多张图片时，UIPageControl可以显示当前图片的位置和总图片数量。 \n \
        引导页：当应用程序第一次启动时，可以使用UIPageControl来展示应用的特性和功能。  \n \
        滑动菜单：当用户切换不同的菜单选项时，UIPageControl可以显示当前菜单的位置和总菜单数量。";
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label;
    })];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 460, self.view.frame.size.width, 40)];
        label.text = @"使用步骤";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    })];
    
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 510, self.view.frame.size.width, 320)];
        label.text = @"1.初始化 [[UIPageControl alloc] initWithFrame:frame]] n\ \
        2.设置总页数  self.pageControl.numberOfPages = 3; \n \
        3.设置当前页数 self.pageControl.currentPage = 0;  \n \
        4.设置未选中指示器的颜色 self.pageControl.pageIndicatorTintColor = [UIColor grayColor];  \n \
        5.设置选中指示器的颜色 self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor]; // 设置选中页面的颜色 \
";
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 840, self.view.frame.size.width, 40)];
        label.text = @"图片浏览器指示器";
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 890, self.view.frame.size.width , 150)];
    view1.layer.borderColor = [UIColor blackColor].CGColor;
    view1.layer.borderWidth = 2.0;
    [view1 addSubview:({
        _scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , 150)];
        
        _scrollView1.backgroundColor = [UIColor grayColor];
        _scrollView1.contentSize = CGSizeMake(self.view.frame.size.width * 10, 150);
        _scrollView1.pagingEnabled = YES;
        _scrollView1.delegate = self;
        // 在UIScrollView中添加三个UIImageView
        for (int i = 0; i < 10; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, 70)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"animate%d", i + 1]];
            [_scrollView1 addSubview:imageView];
        }
        _scrollView1;
    })];
    [view1 addSubview:({
        _pageControl1 = [[UIPageControl alloc] initWithFrame:CGRectMake((view1.frame.size.width - 200)/2, view1.frame.size.height - 30, 200, 30)];
        _pageControl1.numberOfPages = 10;
        _pageControl1.currentPage = 0;
        _pageControl1.pageIndicatorTintColor = [UIColor blackColor];
        _pageControl1.currentPageIndicatorTintColor = [UIColor blueColor];
        _pageControl1.backgroundColor = [UIColor redColor];
        _pageControl1;
    })];
   
    [self startTimer];
    
    [_scrollView addSubview:view1];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl1.currentPage = currentPage; // 更新当前页面位置
    _currentPage = currentPage;
}

- (void)scrollToNextPage {
    _currentPage = (1+_currentPage) % 10;
    CGFloat offsetX = _currentPage * _scrollView1.frame.size.width;
    [_scrollView1 setContentOffset:CGPointMake(offsetX, 0)];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) { //滚动停止且没有减速效果
        [self startTimer];
    }
}
//滚动停止且有减速效果
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self startTimer];
}

- (void)startTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.f target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
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
