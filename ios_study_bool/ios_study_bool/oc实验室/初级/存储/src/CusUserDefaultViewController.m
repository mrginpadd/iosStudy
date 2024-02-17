//
//  CusUserDefaultViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/17.
//

#import "CusUserDefaultViewController.h"
#import "IntroductionViewController.h"
#import "ToastUtil.h"
@interface CusUserDefaultViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusUserDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;

    vc.introTitleLabel.text = @"UserDefaults介绍";
    vc.introContentLabel.text = @" \n \
    UserDefaults 是 iOS 中的一种轻量级的数据存储方式，它可以用来存储用户的偏好设置、配置信息、临时缓存等简单的键值对数据。 \n \
    UserDefaults 是基于 Property List（plist）文件格式的一种存储机制，它使用了一个全局的单例对象来进行数据的读取和写入操作。 \n \
    UserDefaults 提供了一组简单的接口，使得我们可以方便地读写数据，而无需关心底层的存储细节。\n \
    ";
    
    vc.attributeContentLabel.text = @" \n \
    standard: 一个静态属性，返回 UserDefaults 的标准实例，它是一个全局的单例对象。\n \
    suiteName: 用于指定存储数据的 Suite 名称。\n \
    synchronize方法：确保数据被立即写入磁盘并更新内存中的缓存 \n \
    ";
    
    NSString *suiteNameTip = @"    通常会使用suite来存储NSUserDefaults数据的情况包括以下几种：\n \
    因为同一套代码如果有多个app，或者主app与extensions之间，它们的数据是无法共享的，比如[NSUserDefault \n \ standatdUserDefaults] 存储的数据。无法共享，需要通过suiteName获取userDefault实现共享数据\n \
    数据分组：如果你的应用有多个组件或模块需要独立保存数据，可以使用suite来创建不同的命名空间，避免数据冲突。\n \
    App扩展：当你的应用有App扩展（如Widget、Today Extension等）时，可以使用suite来共享数据。\n \
    共享数据：如果你的应用与其他应用需要共享数据，可以将数据保存在suite中以便其他应用访问。\n \
    数据隔离：有些情况下，你可能需要将用户设置或特定数据与应用的其他数据隔离开来，这时可以使用suite来存储这些数据。\n \
    总之，使用suite可以帮助你更灵活地管理和组织NSUserDefaults中的数据，确保数据的安全性和隔离性。\n ";
    
    NSString *syncTip = @" \n \
    调用synchronize方法确保数据立即写入磁盘。 \n \
    \n \
// 存储数据\n \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];\n \
[defaults setObject:@\"Hello, UserDefaults!\" forKey:@\"myDataKey\"];\n \
[defaults synchronize]; // 确保数据被立即写入磁盘并更新内存中的缓存\n \
    \n \
// 立即读取数据\n \
NSString *savedData = [defaults objectForKey:@\"myDataKey\"];\n \
if (savedData) {\n \
    NSLog(@\"从 UserDefaults 中读取到的数据是：%@\", savedData);\n \
} else {\n \
    NSLog(@\"未能在 UserDefaults 中找到相应的数据\");\n \
}\n \
    ";
    
    [vc setAttributeTipBtns:@[@"suiteName", @"synchronize方法"] titles:@[@"什么时候使用suiteName", @"synchronize方法的作用"] contents:@[suiteNameTip, syncTip]];
    
    vc.applicationContentLabel.text = @" \n \
    存储和读取用户的偏好设置，如音量、亮度等。  \n \
    缓存一些临时数据，如用户的登录状态、上次使用的选项等。 \n \
    存储应用程序的配置信息，如是否开启推送通知、使用的语言等。 \n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
    存储： \n \
    [[NSUserDefaults standardUserDefaults] setObject:@\"张三\" forKey:@\"username\"]; \n \
    [[NSUserDefaults standardUserDefaults] setObject:@\"123456\" forKey:@\"password\"]; \n \
    \n \
    读取: \n \
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@\"username\"]; \n \
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@\"password\"]; \n \
    移除: \n \
    \n \
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@\"username\"];  \n \
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@\"password\"];  \n \
    \n \
    suiteName:用来做数据隔离  \n \
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@\"模块名或App名\"];";
    
    [vc setUseStepTipBtns:@[@"存储", @"读取", @"移除", @"suite存储", @"suite读取", @"suite移除"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"存储"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"张三" forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:@"123456" forKey:@"password"];
        [ToastUtil showToastCenter:@"存储username: 张三, password: 123456"];
    } else if ([title isEqualToString:@"读取"]) {
        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
        [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@: %@", username, password]];
    } else if ([title isEqualToString:@"移除"]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
        [ToastUtil showToastCenter:@"移除username password本地存储"];
    } else if ([title isEqualToString:@"suite存储"]) {
        NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"模块名或App名"];
        [userDefault setObject:@"李四" forKey:@"username"];
        [userDefault setObject:@"111111" forKey:@"password"];
        [ToastUtil showToastCenter:@"利用suiteName 存储username: 李四, password: 111111"];
    } else if ([title isEqualToString:@"suite读取"]) {
        NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"模块名或App名"];
        NSString *username = [userDefault objectForKey:@"username"];
        NSString *password = [userDefault objectForKey:@"password"];
        [ToastUtil showToastCenter:[NSString stringWithFormat:@"利用suiteName 读取username: %@, password: %@", username, password]];
    } else if([title isEqualToString:@"suite移除"]) {
        NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"模块名或App名"];
        [userDefault removeObjectForKey:@"username"];
        [userDefault removeObjectForKey:@"password"];
        [ToastUtil showToastCenter:@"suite移除 username password"];
    }
}

@end
