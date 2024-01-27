//
//  UIProgressViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/26.
//

#import "UIProgressViewController.h"

@interface UIProgressViewController ()
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@property(nonatomic, strong, readwrite) UIProgressView *progressView1;
@property(nonatomic, strong, readwrite) UIProgressView *progressView2;
@end

@implementation UIProgressViewController

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
    [self buildDemo1];
    [self buildDemo2];
    [self startTimer];

}
- (void)buildScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1.5 * self.view.frame.size.height);
    [self.view addSubview:_scrollView];
}

- (void)buildIntroLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:@"UIProgressView介绍" attributes:@{
        NSForegroundColorAttributeName: [UIColor whiteColor]
    }];
    label.attributedText = astr;
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
}

- (void)buildIntroView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 120)];
    label.numberOfLines = 0;
    label.textColor = [UIColor grayColor];
    label.text = @"UIProgressView是UIKit框架中的一个界面控件，用于显示进度条，通常用于表示某个任务的进度。 \n  它提供了一个可以动态改变的进度条，可以在完成任务时以动画效果将其填满。";
    [_scrollView addSubview:label];
}

- (void)buildApplicationLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, self.view.frame.size.width, 40)];
    NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:@"应用场景"];
    [astr setAttributes:@{
            NSForegroundColorAttributeName: [UIColor whiteColor],
    } range:NSMakeRange(0, 4)];
    label.attributedText = astr;
    label.backgroundColor = [UIColor blackColor];
    [_scrollView addSubview:label];
}

- (void)buildApplicationView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 225, self.view.frame.size.width, 120)];
    label.numberOfLines = 0;
    label.textColor = [UIColor grayColor];
    label.text = @"UIProgressView通常用于表示某个任务的进度。 \n 例如，在下载某个文件时，可以使用UIProgressView来显示下载进度；\n 在上传文件到云端时，也可以使用UIProgressView来显示上传进度。";
    [_scrollView addSubview:label];
}

- (void)buildDemo1 {
    _progressView1 = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 350, self.view.frame.size.width - 90, 30)];
    //进度条颜色
    _progressView1.progressTintColor = [UIColor blueColor];
    //进度条轨道颜色
    _progressView1.trackTintColor = [UIColor grayColor];
    [_scrollView addSubview:_progressView1];
    //更新进度条进度
    _progressView1.progress = 0.2;
    
    UIButton *delBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 90, 350, 40, 30)];
    [delBtn setTitle:@"减" forState:UIControlStateNormal];
    [delBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [delBtn addTarget:self action:@selector(delDemo1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 55, 350, 40, 30)];
    [addBtn setTitle:@"加" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addDemo1) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_scrollView addSubview:_progressView1];
    [_scrollView addSubview:delBtn];
    [_scrollView addSubview:addBtn];
}

- (void)delDemo1 {
    if (_progressView1.progress > 0) {
        _progressView1.progress = _progressView1.progress - 0.1;
    }
}

- (void)addDemo1 {
    if (_progressView1.progress < 1) {
        _progressView1.progress = _progressView1.progress + 0.1;
    }
}

- (void)buildDemo2 {
    _progressView2 = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 390, self.view.frame.size.width - 90, 30)];
    //进度条颜色
    _progressView2.progressTintColor = [UIColor blueColor];
    //进度条轨道颜色
    _progressView2.trackTintColor = [UIColor grayColor];
    //更新进度条进度
    _progressView2.progress = 0;
    
    [_scrollView addSubview:_progressView2];
}

- (void)startTimer {
    //创建一个定时器，每秒钟触发一次
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFired:) userInfo:nil repeats:YES];
    //设置定时器运行时间
    NSTimeInterval duration = 15.0;
    [self performSelector:@selector(stopTimer:) withObject:timer afterDelay:duration];
    
}

-(void)timeFired:(NSTimer*)timer  {
    _progressView2.progress += 0.1;
    if (_progressView2.progress >= 1) {
        [self buildDoneView];
        [timer invalidate];
    }
}

-(void)stopTimer:(NSTimer*)timer {
    //停止定时器
    if (timer != nil) {
        [timer invalidate];
    }
}

-(void)buildDoneView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 430, self.view.frame.size.width, 80)];
    label.text = @"加载完成";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    [_scrollView addSubview:label];
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
