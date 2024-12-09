//
//  CusRunLoopEventViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/9.
//

#import "CusRunLoopEventViewController.h"

@interface CusRunLoopEventViewController ()

@end

@implementation CusRunLoopEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    vc.introTitleLabel.text = @"RunLoop事件循环";
    vc.introContentLabel.text = @" \n \
    Runloop 还是比较顾名思义的一个东西，说白了就是一种循环，只不过它这种循环比较高级。 \n \
    一般的 while 循环会导致 CPU 进入忙等待状态，而 Runloop 则是一种“闲”等待，这部分可以类比 Linux 下的 epoll。 \n \
    当没有事件时，Runloop 会进入休眠状态，有事件发生时， Runloop 会去找对应的Handler  处理事件。\n \
    Runloop 可以让线程在需要做事的时候忙起来，不需要的话就让线程休眠。\n \
        \n \
    图中展现了 Runloop 在线程中的作用：从 input source 和 timer source\n \ 接受事件，然后在线程中处理事件。\n \
        \n \
        \n \
    Runloop 与线程  \n \
    Runloop 和线程是绑定在一起的。  \n \
    每个线程（包括主线程）都有一个对应的 Runloop 对象。 \n \
    我们并不能自己创建 Runloop 对象，但是可以获取到系统提供的 Runloop 对象。 \n \
    主线程的 Runloop 会在应用启动的时候完成启动，其他线程的 Runloop 默认并不会启动，需要我们手动启动。 \n \
    Runloop Mode  \n \
    苹果文档中提到的 Mode 有五个，分别是：  \n \
     \n \
    NSDefaultRunLoopMode \n \
    NSConnectionReplyMode \n \
    NSModalPanelRunLoopMode \n \
    NSEventTrackingRunLoopMode \n \
    NSRunLoopCommonModes \n \
    ";
    
    vc.attributeContentLabel.text = @"  \n \
    日常开发中，与 runLoop 接触得最近可能就是通过 NSTimer 了。 \n \
    一个 Timer 一次只能加入到一个 RunLoop 中。 \n \
    我们日常使用的时候，通常就是加入到当前的 runLoop 的 default mode 中，而 ScrollView \n \ 在用户滑动时，主线程 RunLoop 会转到 UITrackingRunLoopMode 。 \n \
    而这个时候， Timer 就不会运行。 \n \
        \n \
    有如下两种解决方案：\n \
    \n \
    第一种: 设置 RunLoop Mode，例如 NSTimer,我们指定它运行于 NSRunLoopCommonModes ，这是一个 Mode 的集合。注册到这个 Mode 下后，无论当前 runLoop 运行哪个 mode ，事件都能得到执行。\n \
    第二种: 另一种解决 Timer 的方法是，我们在另外一个线程执行和处理 Timer 事件，然后在主线程更新 UI。\n \
        \n \
            \n \
    在 AFNetworking 3.0 中，就有相关的代码，如下：   \n \
    - (void)startActivationDelayTimer {   \n \
        self.activationDelayTimer = [NSTimer  \n \
                                     timerWithTimeInterval:self.activationDelay  \n \ target:self  \n \ selector:@selector(activationDelayTimerFired)  \n \ userInfo:nil repeats:NO];  \n \
        [[NSRunLoop mainRunLoop] addTimer:self.activationDelayTimer  \n \ forMode:NSRunLoopCommonModes]; \n \
    } \n \
    这里就是添加了一个计时器，由于指定了 NSRunLoopCommonModes，所以不管 RunLoop 出于什么状态，都执行这个计时器任务。\n \
    ";
}

@end
