//
//  CusRouteCaseViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/16.
//

#import "CusRouteCaseViewController.h"
#import "IntroductionViewController.h"
#import "CTMediator.h"
@interface CusRouteCaseViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusRouteCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"组件化路由方案";
    
    vc.introContentLabel.text = @"  \n \
    日常开发中，你可能会遇到这样的问题，各个模块相互引用，相互依赖，直观表现就是引入了很多头文件，很混乱，比如登录、收藏、消息模块间的相互调用，这样的代码显然不能符合 低耦合、高内聚、职责单一逻辑清晰的代码设计原则。 \n \
    为此，我们可能需要使用一个 调度中心   \n \ 去管理这些模块，有了这个调度中心，每个模块就不需要依赖其它模块，不用导入其它模块的头文件了，只需要调度中心关心每个模块的调度，其它模块只需要关心怎么调用和调用后反馈的结果。  \n \
    这个调度中心就是 路由(Router), 这种设计模式也被称为 中介者模式。 \n \
         \n \
    路由简单来说就是一个中转站，输入一条数据，然后按照内部的一定规则，处理这条数据，最后输出特定格式的新数据。 \n \
     \n \
    路由是一个很好的解耦的方案，它可以为各个组件之间调用提供便利，没有路由，组件化也是可以用的。 \n \
    \n \
    业界常见的三种解决方案: \n \
    1.Url-scheme注册(MGJRouter)  \n \
    2.利用Runtime实现的target-action方式（CTMediator）- 推荐   \n \
    3.protcol-class注册  \n \
         \n \   
    ";
    
    [vc setIntroTipBtns:@[@"url注册", @"target-action", @"protocol-class"]];

    
    NSString *urlTip = @"  \n \
    iOS系统中默认是支持 url scheme方式的，例如可以在浏览器中输入： weixin://  \n \   就可以打开微信应用。自然在APP内部也可以通过这种方法来实现组件之间的路由设计。  \n \
     \n \
    这种方式实现的原理是在APP启动的时候，或者是向以下实例中的每个模块自己的load方法里面注册自己的断链（url \n \  ）,以及对外提供服务(Block)，通过url-scheme标记好，然后维护在url-router里面。 \n \   url-router中保存了各个组件对应的url-scheme,只要其它组件调用了 open url \n \   的方法，url-router就会去根据url去查找对应的服务并执行，详见demo。 \n \
    ";
    
    NSString *targetTip = @" \n \
   相较于url-scheme的方式进行组件间的路由，runtime的方式借助了OC运行时的特征， \n \实现了组件间服务的自动发现，无需注册即可实现组件间的调用，因此，不管从维护性、可读性、扩展性来说，都是一个比较完美的方案。 \n \
    \n \
    原理： \n \
    传统的中介者模式，这个中间件Mediator会依赖其它组件，其它组件也会依赖mediator, 但是能不能让mediator不在依赖组件，各个组件之间不再依赖，组件间调用只依赖中间者mediator？  \n \
    casa 大神是这样优化的： \n \
    利用target-action的方式，创建一个taget的类，里面定义了一些action方法，这些方法的结果是返回一个controller或其它object，再给中间件CTMedator添加一个分类方法,定义组件外部可调用的方法接口，内部实现方法 \n \ perform：target：action的方法，主要通过runtime中的 NSClassFromString 获取target类和 \n \ NSSelectorFromString 获取方法名，这样就可以执行先去创建的 \n \ target类中的方法得到返回值，再通过分类中的方法传值出去，完美解决~ \n \
    ";
    
    NSString *protocolTip = @"  \n \
    通过协议和类绑定，核心思想和代理传值是一样的，遵循协议，实现协议中的方法。  \n \
    主要思路:  \n \
    1、创建一个头文件 CommonProtocol.h ，里面存放各个模块提供的协议。在各个模块依赖这个头文件，实现协议的方法。 \n \
    2、创建一个中间类 ProtocolMediator, \n \ 提供模块的注册和获取模块的功能（其实就是将类和协议名进行绑定，放在一个字典里，key是协议名字符串，value是类）。 \n \
    3、在各个模块中实现协议,核心代码如下： \n \
Class cls = [[ProtocolMediator sharedInstance] classForProtocol:@protocol(B_VC_Protocol)]; \n \
UIViewController<B_VC_Protocol> *B_VC = [[cls alloc] init]; \n \
[B_VC action_B:@\"param1\" para2:222 para3:333 para4:444]; \n \
[self presentViewController:B_VC animated:YES completion:nil]; \n \
    ";
    [vc setUseStepTipBtns:@[@"url注册", @"target-action", @"protocol-class"] titles:@[@"url注册", @"target-action", @"protocol-class"] contents:@[urlTip, targetTip, protocolTip] ];
}


- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"url注册"]) {
        [CTMediator openUrl:@"anew://" params:@{
                    @"url": @"",
                    @"controller": self.navigationController
        }];
//        UIViewController *targetVC = [CTMediator getViewControllerWithVCName:@"ANewViewController"];
//        [self.navigationController pushViewController:targetVC animated:YES];
    } else if ([title isEqualToString:@"target-action"]) {
        UIViewController *targetVC = [CTMediator getViewControllerWithVCName:@"ANewViewController"];
        [self.navigationController pushViewController:targetVC animated:YES];
    } else if ([title isEqualToString:@"protocol-class"]) {
//        UIViewController *targetVC = [CTMediator getViewControllerWithVCName:@"ANewViewController"];
//        [self.navigationController pushViewController:targetVC animated:YES];
        
        Class cls = [CTMediator classForProtocol:@protocol(BViewControllerProtocol)];
        [self.navigationController pushViewController:[[cls alloc] init] animated:YES];
    }
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
