//
//  CusDelegationViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusDelegationViewController.h"
#import "IntroductionViewController.h"
@interface CusDelegationViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusDelegationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"委托代理protocol - delegate介绍";
    vc.introContentLabel.text = @"\n \
    协议-委托（Protocol-Delegate）是一种常见的设计模式，用于在对象之间进行通信和传递数据。 \n \
    协议（Protocol）：定义一组方法或属性的规范，但没有具体实现。  \n \
    委托（Delegate）：符合特定协议的对象，代表另一个对象进行特定任务。 \n \
    ";
    
    vc.attributeContentLabel.text = @"\n \
    用于持有委托对象的属性，类型为符合指定协议的对象。\n \
    通常以weak或unowned修饰。 \n \
    weak 用于避免循环引用。 \n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
    视图控制器之间的通信：一个视图控制器作为委托对象，处理其他视图控制器发送过来的事件或数据。 \n \
    自定义视图的交互处理：自定义视图通过委托将用户的交互事件通知给其他对象进行处理。 \n \
    网络请求的回调：将网络请求的结果通过委托传递给其他对象进行处理。 \n \
    ";
    

    
    vc.useStepContentLabel.text = @"\n \
    协议-代理，以老板和秘书为例子。\n \
    老板每天事情很多，于是把一些事情交给秘书处理。 \n \
    老板把交给秘书处理的事项清单， 即声明协议及协议中的方法 \n \
    老板需要持有一个秘书，即声明属性delegate \n \
    秘书需要按着清单办事, 即遵守协议 @interface Assistant()<BossDelegate>  \n \
    秘书是老板的代理，即声明老板的代理为自己 boss.delegate = self  \n \
    秘书为老板代理办事，即实现协议中的方法 \n \
    实现协议中的方法后，当Boss在某个时机需要秘书去代理实现时，就会触发秘书的代理方法。 \n \
    ";
    
    
    NSString *code = @" \n \
    老板协议 \n \
    @protocol CusBossViewDelegate<NSObject>\n \
    -(void)doSomething;\n \
    @end\n \
    \n \
    老板.h \n \
    @interface CusBossViewController : UIViewController \n \
    @property(nonatomic, weak, readwrite) id<CusBossViewDelegate> delegate; \n \
    @end\n \
        \n \
    老板.m\n \
    @implementation CusBossViewController\n \
    \n \
    \n \
    - (void)viewDidLoad {\n \
        self.view.backgroundColor = [UIColor redColor];\n \
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];\n \
        [btn setTitle:@\"点击Boss\" forState:UIControlStateNormal];\n \
        [btn addTarget:self action:@selector(doSomethingByDelegate)\n \ forControlEvents:UIControlEventTouchUpInside];\n \
        [self.view addSubview:btn];\n \
    }\n \
    \n \
    - (void)doSomethingByDelegate {\n \
        if (self.delegate && [self.delegate\n \ respondsToSelector:NSSelectorFromString(@\"doSomething\")]) {\n \
            [self.delegate doSomething];\n \
        }\n \
    }\n \
    @end\n \
        \n \
    \n \
        \n \
    助理.h \n \
    @interface CusAssistViewController : UIViewController\n \
    \n \
    @end\n \
        \n \
    助理.m \n \
    @implementation CusAssistViewController\n \
    \n \
    - (void)viewDidLoad {\n \
        self.view.backgroundColor = [UIColor greenColor];\n \
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 350, 30)];\n \
        _label.text = @\"代理\";\n \
        [self.view addSubview:_label];\n \
            \n \
        _BossVC = [[CusBossViewController alloc] init];\n \
        _BossVC.delegate = self;\n \
            \n \
    }\n \
    - (void)doSomething {\n \
        NSLog(@\"代理执行boss dosomething\");\n \
        _label.text = @\"代理执行boss dosomething\";\n \
    }\n \
    \n \
        \n \
    \n \
    ";
    [vc setUseStepTipBtns:@[@"代码"] titles:@[@"协议-代理"] contents:@[code]];
    [vc setUseStepTipBtns:@[@"老板-助理"]];
    
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"老板-助理"]) {
        CusAssistViewController *assVC = [[CusAssistViewController alloc] init];
        [self.navigationController pushViewController:assVC animated:YES];
    }
}

@end


@implementation CusBossViewController


- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    [btn setTitle:@"点击Boss" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(doSomethingByDelegate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)doSomethingByDelegate {
    if (self.delegate && [self.delegate respondsToSelector:NSSelectorFromString(@"doSomething")]) {
        [self.delegate doSomething];
    }
}
@end

@interface CusAssistViewController()<CusBossViewDelegate>
@property(nonatomic, strong, readwrite) CusBossViewController *BossVC;
@property(nonatomic, strong, readwrite) UILabel *label;
@end

@implementation CusAssistViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor greenColor];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 350, 30)];
    _label.text = @"代理";
    [self.view addSubview:_label];
    
    _BossVC = [[CusBossViewController alloc] init];
    _BossVC.delegate = self;
    
    [self.view addSubview:_BossVC.view];
    _BossVC.view.frame = CGRectMake(0, 257, 350, 40);
    [self addChildViewController:_BossVC];
    [_BossVC didMoveToParentViewController:self];
}
- (void)doSomething {
    NSLog(@"代理执行boss dosomething");
    _label.text = @"代理执行boss dosomething";
}

@end
