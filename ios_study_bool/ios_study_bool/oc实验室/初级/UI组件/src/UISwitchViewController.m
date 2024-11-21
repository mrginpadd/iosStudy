//
//  UISwitchViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/24.
//

#import "UISwitchViewController.h"
#import "ScreenUtil.h"
@interface UISwitchViewController ()

@end

@implementation UISwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self _buildViews];
}

- (void) _buildViews {

    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, self.view.frame.size.width, 600)];
        label.text = @"UISwitch是iOS开发中常用的控件，它是一个用于切换开关状态的按钮。下面是UISwitch的一些常用属性：\n \
        isOn：布尔值，表示开关的状态。当isOn为true时，开关处于打开状态；当isOn为false时，开关处于关闭状态。\n \
        onTintColor：颜色，表示开关打开时的背景颜色。可以使用UIColor类来设置颜色。\n \
        thumbTintColor：颜色，表示开关上滑块的颜色。可以使用UIColor类来设置颜色。\n \
        onImage：UIImage对象，表示开关打开时的图片。可以通过设置该属性来自定义开关打开时的外观。\n \
        offImage：UIImage对象，表示开关关闭时的图片。可以通过设置该属性来自定义开关关闭时的外观。\n \
        addTarget(_:action:forControlEvents:)：方法，用于给开关添加事件监听。可以通过该方法将开关的状态变化与特定的方法进行关联。\n \
        isEnabled：布尔值，表示开关是否可用。当isEnabled为true时，开关可以响应用户的交互；\n \
        当isEnabled为false时，开关将变为禁用状态，无法响应用户交互。";
        label.numberOfLines = 0;
        label;
    })];
    [self.view addSubview:({
        UISwitch *swBtn = [[UISwitch alloc] initWithFrame:CGRectMake(0, 630 + TOPHEIGHT, 100, 30)];
        swBtn.thumbTintColor = [UIColor redColor];
        swBtn.onTintColor = [UIColor greenColor];
     
        [swBtn addTarget:self action:@selector(switchBtn:) forControlEvents:UIControlEventTouchUpInside];
        swBtn;
    })];
}

- (void) switchBtn: (UISwitch*) sender {
    if (sender.isOn) {
        
    } else {
  
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
