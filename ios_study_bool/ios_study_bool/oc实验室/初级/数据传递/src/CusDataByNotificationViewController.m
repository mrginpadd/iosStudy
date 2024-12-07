//
//  CusNotificationViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/7.
//

#import "CusDataByNotificationViewController.h"
#import "ToastUtil.h"
@interface CusDataByNotificationViewController ()

@end

@implementation CusDataByNotificationViewController

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
    
    vc.introTitleLabel.text = @"通知Notification";
    vc.introContentLabel.text = @"多个对象之间的松耦合数据传递，适用于一个发送者向多个接收者传递相同的数据。";
    
    [vc setUseStepTipBtns:@[@"发送通知", @"注册监听器A", @"注册监听器B", @"注册监听器C", @"取消所有监听器"]];
    vc.useStepContentLabel.text = @" \n \
    注册通知  \n \
    [[NSNotificationCenter defaultCenter] addObserver:self  \n \
                                                 selector:@selector(handleNotification:)  \n \
                                                     name:@\"MyNotification\"  \n \
                                                   object:nil];  \n \
    取消监听  \n \
    [[NSNotificationCenter defaultCenter] removeObserver:self];  \n \
    \n \
    发送通知  \n \
    [[NSNotificationCenter defaultCenter] postNotificationName:@\"通知名称A\" object:nil userInfo:@{@\"data\": @\"1122344\"}]; \n \
    ";
}
- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"发送通知"]) {
        [self sendNotification];
    } else if([title isEqualToString:@"注册监听器A"]) {
        [self addNotificationObserverA];
    } else if([title isEqualToString:@"注册监听器B"]) {
        [self addNotificationObserverB];
    } else if([title isEqualToString:@"注册监听器C"]) {
        [self addNotificationObserverC];
    } else if([title isEqualToString:@"取消所有监听器"]) {
        [self removeObserver];
    }
}

#pragma -mark 发送通知

- (void)sendNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"通知名称A" object:nil userInfo:@{@"data": @"1122344"}];
}

#pragma -mark 监听通知

- (void)addNotificationObserverA {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotificationData:) name:@"通知名称A" object:nil];
}


- (void)addNotificationObserverB {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotificationDataB:) name:@"通知名称A" object:nil];
}


- (void)addNotificationObserverC {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotificationDataC:) name:@"通知名称A" object:nil];
}


#pragma -mark 获取通知数据

- (void)getNotificationData:(NSNotification *)notification {
    NSString *data = notification.userInfo[@"data"];
    [ToastUtil showToastCenter:[NSString stringWithFormat:@"ObserverA 获取到通知数据: %@", data]];
}

- (void)getNotificationDataB:(NSNotification *)notification {
    NSString *data = notification.userInfo[@"data"];
    [ToastUtil showToastCenter:[NSString stringWithFormat:@"ObserverB 获取到通知数据: %@", data]];
}

- (void)getNotificationDataC:(NSNotification *)notification {
    NSString *data = notification.userInfo[@"data"];
    [ToastUtil showToastCenter:[NSString stringWithFormat:@"ObserverC 获取到通知数据: %@", data]];
}

#pragma -mark 取消特定通知的监听
- (void)removeObserver {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"通知名称A"
                                                  object:nil];
}

@end
