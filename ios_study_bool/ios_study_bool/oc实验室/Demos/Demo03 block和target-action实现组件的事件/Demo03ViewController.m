//
//  Demo03ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/11.
//

#import "Demo03ViewController.h"
#import "Demo03Part1.h"
@interface Demo03ViewController ()
@property(nonatomic, strong) Demo03Part1* demo03View;
@end

@implementation Demo03ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    _demo03View = [[Demo03Part1 alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    _demo03View.backgroundColor = [UIColor redColor];
    _demo03View.center = self.view.center;
    [self.view addSubview:_demo03View];
    _demo03View.onTap = ^{
       NSLog(@"block模式实现点击回调");
    };
    // 添加双击手势
     UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap)];
     doubleTap.numberOfTapsRequired = 2;
     [_demo03View addGestureRecognizer:doubleTap];

}
//Target-Action模式点击
- (void)handleDoubleTap {
    NSLog(@"Target-Action模式实现双击");
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
