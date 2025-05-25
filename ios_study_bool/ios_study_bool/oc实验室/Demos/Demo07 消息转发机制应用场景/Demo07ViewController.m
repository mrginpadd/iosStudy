//
//  Demo07ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/25.
//

#import "Demo07ViewController.h"

@interface Demo07ViewController ()

@end

@implementation Demo07ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     3类用途
     1.实现代理模式
     在某些情况下，你可能希望将某些方法调用转发给另一个对象（代理）处理，而不是直接实现这些方法。例如，在一个视图控制器中，你可能希望将网络请求的相关操作委托给一个专门的网络管理器类。
     2.动态添加属性或行为
     假设你有一个基类，但需要根据不同的子类动态地添加一些特定的行为或属性，而不修改基类代码。利用消息转发机制可以实现在运行时动态添加方法。
     3. 日志记录与性能监控
     你可能想要在不修改原始方法的情况下，为某些方法调用添加日志记录或性能监控逻辑。
     */
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
