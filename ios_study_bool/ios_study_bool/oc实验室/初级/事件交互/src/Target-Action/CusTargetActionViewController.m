//
//  CusTargetActionViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusTargetActionViewController.h"
#import "IntroductionViewController.h"
#import "Masonry.h"
#import "ToastUtil.h"
@interface CusTargetActionViewController ()

@end

@implementation CusTargetActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.introContentLabel.text = @"\n \
     Target-Action \n \
     是一种常见的设计模式，用于处理用户界面元素（如按钮、滑动条等）的交互事件。 \n \
     它通过将一个对象（Target）与一个方法（Action）关联起来，在用户执行某个操作时触发该方法的调用。\n \
    ";
    
    vc.attributeContentLabel.text = @"\n \
    target：目标对象，即接收事件通知并执行相应方法的对象。 \n \
    action：目标对象要执行的方法，一般为带有特定签名（特定参数和返回类型）的方法。 \n \
    ";
    
    vc.applicationContentLabel.text = @"\n \
UIControlEventTouchDown：当用户触摸控件时触发，即按下但尚未松开手指。\n \
UIControlEventTouchDownRepeat：当用户重复触摸控件时触发，即在同一控件上多次按下手指。\n \
UIControlEventTouchDragInside：当用户触摸并拖动手指在控件内部时触发。\n \
UIControlEventTouchDragOutside：当用户触摸并拖动手指离开控件时触发。\n \
UIControlEventTouchDragEnter：当用户触摸并拖动手指进入控件的边界时触发。\n \
UIControlEventTouchDragExit：当用户触摸并拖动手指离开控件的边界时触发。\n \
UIControlEventTouchUpInside：当用户触摸并在控件内部松开手指时触发（常用于按钮的点击事件）。\n \
UIControlEventTouchUpOutside：当用户触摸并在控件外部松开手指时触发。\n \
UIControlEventValueChanged：当控件的值发生改变时触发，常用于滑块、开关等控件的状态改变事件。\n \
UIControlEventEditingDidBegin：当文本输入控件开始编辑时触发。\n \
UIControlEventEditingChanged：当文本输入控件的文本内容发生改变时触发。\n \
UIControlEventEditingDidEnd：当文本输入控件结束编辑时触发。\n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
    设置按钮的 Target 和 Action \n \
[button addTarget:self action:@selector(buttonClicked:) \n \ forControlEvents:UIControlEventTouchUpInside]; \n \
    \n \
    按钮点击事件的处理方法 \n \
    - (void)buttonClicked:(UIButton *)sender { \n \
        NSLog(@\"Button Clicked\"); \n \
    } \n \
        \n \
    ";
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.view);
            make.height.equalTo(@130);
            make.top.equalTo(vc.useStepContentLabel.mas_bottom);
            make.left.equalTo(self.view);
    }];
    
    [btn addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn addTarget:self action:@selector(touchDragInsideAction:) forControlEvents:UIControlEventTouchDragInside];
    
    
    [btn addTarget:self action:@selector(touchDragOutsideAction:) forControlEvents:UIControlEventTouchDragOutside];
    
    [btn addTarget:self action:@selector(touchCancel:) forControlEvents:UIControlEventTouchCancel];
}

- (void)touchUpInsideAction: (UIButton*)sender {

   [ToastUtil showToastCenter:@"UIControlEventTouchUpInside"];
 
}

- (void)touchDragInsideAction: (UIButton*)sender {

   [ToastUtil showToastCenter:@"UIControlEventTouchDragInside"];
 
}

- (void)touchDragOutsideAction: (UIButton*)sender {

   [ToastUtil showToastCenter:@"UIControlEventTouchDragOutside"];
 
}

- (void)touchCancel: (UIButton*)sender {

   [ToastUtil showToastCenter:@"UIControlEventTouchCancel"];
 
}
@end
