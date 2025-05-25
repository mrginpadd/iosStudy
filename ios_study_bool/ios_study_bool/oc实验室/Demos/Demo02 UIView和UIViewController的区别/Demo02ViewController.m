//
//  Demo02ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/11.
//

#import "Demo02ViewController.h"
#import "Demo02View.h"
@interface Demo02ViewController ()
@property(nonatomic, assign) NSInteger count;
@property(nonatomic, strong) Demo02View *demo02View;
@end

@implementation Demo02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _buildViews];
}

- (void)_buildViews {
    self.navigationItem.title = @"UIView和UIViewController的区别";
    self.view.backgroundColor = [UIColor blueColor];
    
    _demo02View = [[Demo02View alloc] initWithTitle:@"UIView"];
    _demo02View.frame = CGRectMake(0, 0, 100, 100);
    _demo02View.center = self.view.center;
    _demo02View.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demo02View];
    
    __weak typeof(self) weakSelf = self;
    _demo02View.onTap = ^{
        typeof(self) strongSelf = weakSelf;
        if (!strongSelf) return;
        strongSelf.count++;
        // 安全获取当前标题
        NSString *currentTitle = @"UIView";
        strongSelf.demo02View.title = [NSString stringWithFormat:@"%@: %ld", currentTitle, strongSelf.count];
    };
}

@end
