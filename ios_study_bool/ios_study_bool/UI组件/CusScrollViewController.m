//
//  CusScrollViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/3.
//

#import "CusScrollViewController.h"

@interface CusScrollViewController () <UIScrollViewDelegate>
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@property(nonatomic, strong, readwrite) UIScrollView *scrollView2;
@property(nonatomic, strong, readwrite) UIScrollView *scrollView3;
@property(nonatomic, strong, readwrite) UIImageView *imgView;
@end

@implementation CusScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self buildViews];
}

- (void)buildViews {
    [self.view addSubview:({
        _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2*self.view.frame.size.height);
        _scrollView;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        label.text = @"UIScrollView介绍";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 80)];
        label.text = @"UIScrollView 是一个可滚动的视图容器，可以在其中添加子视图，并且可以水平或者垂直滚动。";
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
        label.text = @"下面是一些UIScrollView的应用场景：  \n \
        显示长文本或照片列表：UIScrollView可以很好地滚动长文本和照片列表，用户可以通过滑动屏幕来查看全部内容。  \n \
        实现缩放功能：UIScrollView可以实现对子视图的缩放，例如图片、地图等。  \n \
        实现分页功能：UIScrollView可以实现分页滚动效果，比如类似于iPhone桌面的分页效果。  \n \
        实现横向滚动效果：如果想要实现横向滚动效果，可以将UIScrollView的contentSize设置为横向内容的宽度。";
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
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 510, self.view.frame.size.width, 120)];
        label.text = @"1.初始化UIScroll *scrollView = [[UIScrollView alloc] initWithFrame:frame] \n \
        2.设置scrollView.contentSize = CGSizeMake(w,h) \
";
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 640, self.view.frame.size.width, 40)];
        label.text = @"显示长文本";
        label.textColor = [UIColor grayColor];
        label;
    })];
    [_scrollView addSubview:({
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 690, self.view.frame.size.width, 80)];
        scrollView.contentSize = CGSizeMake(200, 100);
        scrollView.backgroundColor = [UIColor yellowColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        label.text = @"这是一段很长的文本...............................................\n \
        ......................................................................";
        label.numberOfLines = 0;
        label.textColor = [UIColor blueColor];
        [scrollView addSubview:label];
        scrollView;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 780, self.view.frame.size.width, 40)];
        label.text = @"实现子视图缩放功能";
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
        _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 830, self.view.frame.size.width, 300)];
        _scrollView2.contentSize = CGSizeMake(200, 100);
        _scrollView2.backgroundColor = [UIColor yellowColor];
        
        
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"小丑"]];
        [_scrollView2 addSubview:_imgView];
        
        // 开启缩放功能
        _scrollView2.minimumZoomScale = 0.5; // 最小缩放比例
        _scrollView2.maximumZoomScale = 2.0; // 最大缩放比例
        _scrollView2.delegate = self;
        _scrollView2;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 1140, self.view.frame.size.width, 40)];
        label.text = @"实现分页功能横向滚动";
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
        _scrollView3 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1190, self.view.frame.size.width, 300)];
        _scrollView3.contentSize = CGSizeMake(self.view.frame.size.width * 4, 300);
        _scrollView3.backgroundColor = [UIColor yellowColor];
        _scrollView3.pagingEnabled = YES;
        _scrollView3.userInteractionEnabled = YES;
        
        UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        view1.backgroundColor = [UIColor redColor];
        [_scrollView3 addSubview:view1];
        
        UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0,  self.view.frame.size.width, 300)];
        view2.backgroundColor = [UIColor greenColor];
        [_scrollView3 addSubview:view2];
        
        UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, 300)];
        view3.backgroundColor = [UIColor blueColor];
        [_scrollView3 addSubview:view3];

        _scrollView3;
    })];

}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    //返回要缩放的视图
    return self.imgView;
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
