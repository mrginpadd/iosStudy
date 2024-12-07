//
//  CusDataByDelegateViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/6.
//

#import "CusDataByDelegateViewController.h"

@protocol CusChildViewDelegate <NSObject>

- (void)didReceiveData:(NSString *)data;

@end


@interface CusChildView : UIButton
@property(nonatomic, weak) id<CusChildViewDelegate> delegate;
@end

@implementation CusChildView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@"代理发送" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(sendData) forControlEvents:UIControlEventTouchUpInside];


    }
    return self;
}

- (void)sendData {
//    if ([self.delegate respondsToSelector:@selector(didReceiveData:)]) {
        [self.delegate didReceiveData:@"委托方发送给代理方的数据"];
//    }
}
@end


@interface CusDataByDelegateViewController ()<CusChildViewDelegate>
@end


@implementation CusDataByDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
  
}

- (void)setupViews {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.introTitleLabel.text = @"Delegate传递数据";
    vc.introContentLabel.text = @"常用在父视图控制器和子视图控制器之间的单向数据传递，父控制器可以通过子控制器将数据传回。";
 
    vc.useStepContentLabel.text = @"\n \
    1.子视图定义代理 \n \
    2.子视图触发事件时用代理区调用代理方法 \n \
    3.父视图遵循子视图代理并设置代理为self  \n \
    4.触发子视图代理事件时，将子视图数据通过代理方法的参数传入  \n \
    ";
    
    CusChildView *childView = [[CusChildView alloc] initWithFrame:CGRectMake(120, 150, 100, 40)];
    childView.backgroundColor = [UIColor greenColor];
    childView.delegate = self;
    [vc.view addSubview:childView];
}

- (void)didReceiveData:(NSString *)data {
    [ToastUtil showToastCenter:[NSString stringWithFormat:@"代理方通过delegate收到委托方数据: %@ ", data]];
}
@end



