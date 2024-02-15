//
//  CusNotificationViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusNotificationViewController.h"
#import "IntroductionViewController.h"
@interface CusNotificationViewController ()

@end

@implementation CusNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.introTitleLabel.text = @"NotificationCenter介绍";
    vc.introContentLabel.text = @" \n \
    NotificationCenter（通知中心）是 iOS 应用程序中一个非常重要的机制，它使得不同模块之间的通信变得更加简单。 \n \
    \n \
 通知是一个消息发布-订阅机制，当一个对象发送一个通知时，其他对象可以自由地订阅并接收该通知。\n \
    ";
    
    vc.attributeContentLabel.text = @"  \n \
    name：通知的名称，用于标识通知。 \n \
    object：通知的发送者。 \n \
    userInfo：通知携带的信息。 \n \
          \n \
    ";
    
    vc.applicationContentLabel.text = @"  \n \
    在不同的模块之间传递数据。 \n \
    监听应用程序的状态变化。 \n \
    实现观察者模式，让不同对象能够监听另一个对象的状态变化。 \n \
    ";
   
    vc.useStepContentLabel.text = @" \n \
    1. 注册通知  [[NSNotificationCenter defaultCenter] addObserver:self \n \ selector:@selector(handleNotification:) name:@\"MyNotification\" object:nil]; \n \
    2. 发送通知 [[NSNotificationCenter defaultCenter] \n \ postNotificationName:@\"MyNotification\" object:nil userInfo:@{@\"key\": \n \ @\"value\"}];  \n \
    3.处理通知 - (void)handleNotification:(NSNotification *)notification {...}  \n \
    4.取消通知 [[NSNotificationCenter defaultCenter] removeObserver:self \n \ name:@\"MyNotification\" object:nil]; \n \
    ";
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
