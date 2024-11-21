//
//  UIButtonViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/21.
//

#import "UIButtonViewController.h"
#import "ScreenUtil.h"
@interface UIButtonViewController ()

@end

@implementation UIButtonViewController
- (instancetype)init {
    self = [super init];
    if (self) {
 
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.title = @"UIButton";
    // Do any additional setup after loading the view.
    [self buildViews];
}
- (void)buildViews {
    [self buildTypeView];
    [self buildStateView];
}
- (void)buildTypeView {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, 390, 30)];
    label1.text = @"buttonWithType 按钮类型: UIButtonTypeXXX";
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 40+TOPHEIGHT, 100, 30)];
    [btn1 setTitle:@"直接init" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor greenColor];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setFrame:CGRectMake(120, 40+TOPHEIGHT, 100, 30)];
    [btn2 setTitle:@"System" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor greenColor];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeClose];
    [btn3 setFrame:CGRectMake(240, 40+TOPHEIGHT, 100, 30)];
    [btn3 setTitle:@"Close" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor greenColor];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setFrame:CGRectMake(0, 180+TOPHEIGHT, 100, 30)];
    [btn4 setTitle:@"Custom" forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor greenColor];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [btn5 setFrame:CGRectMake(0, 80+TOPHEIGHT, 100, 30)];
    [btn5 setTitle:@"InfoLight" forState:UIControlStateNormal];
    btn5.backgroundColor = [UIColor greenColor];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn6 setFrame:CGRectMake(120, 80+TOPHEIGHT, 100, 30)];
    [btn6 setTitle:@"ContactAdd" forState:UIControlStateNormal];
    btn6.backgroundColor = [UIColor greenColor];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn7 setFrame:CGRectMake(240, 80+TOPHEIGHT, 100, 30)];
    [btn7 setTitle:@"RoundedRect" forState:UIControlStateNormal];
    btn7.layer.cornerRadius = 10.0;
    btn7.layer.masksToBounds = YES;
    btn7.backgroundColor = [UIColor greenColor];
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [btn8 setFrame:CGRectMake(0, 140+TOPHEIGHT, 100, 30)];
    [btn8 setTitle:@"DetailDisclosure" forState:UIControlStateNormal];
    btn8.backgroundColor = [UIColor greenColor];
    
    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [btn9 setFrame:CGRectMake(120, 140+TOPHEIGHT, 100, 30)];
    [btn9 setTitle:@"InfoDark" forState:UIControlStateNormal];
    btn9.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    [self.view addSubview:btn5];
    [self.view addSubview:btn6];
    [self.view addSubview:btn7];
    [self.view addSubview:btn8];
    [self.view addSubview:btn9];
}

- (void)buildStateView {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 210+TOPHEIGHT, self.view.frame.size.width, 30)];
    label1.text = @"UIControlStateXXX 按钮点击状态";
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 240+TOPHEIGHT, self.view.frame.size.width, 30)];
    [btn1 setTitle:@"Normal状态" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn1 setTitle:@"Highlighted状态" forState:UIControlStateHighlighted];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];

    [self.view addSubview:btn1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 270+TOPHEIGHT, self.view.frame.size.width, 60)];
    label2.text = @"UIControlStateSelected是用于单选按钮，btn.selected = !selected时的样式";
    label2.textColor = [UIColor grayColor];
    label2.numberOfLines = 2;
    [label2 sizeToFit];
    [self.view addSubview:label2];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 330+TOPHEIGHT, self.view.frame.size.width, 30)];
    [btn2 setTitle:@"Normal状态" forState:UIControlStateNormal];
    [btn2 setTitle:@"Selected状态" forState:UIControlStateSelected];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 360 + TOPHEIGHT, self.view.frame.size.width, 80)];
        label.text = @"[btn addTarget:self action:@selector(触发的函数名称) forControlEvents:UIControlEventTouchUpInside点击时触发];";
        label.numberOfLines = 0;
        label;
    })];
    [self.view addSubview:({
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 430 + TOPHEIGHT, 250, 40)];
        [btn setTitle:@"触发事件" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(tapEvent) forControlEvents:UIControlEventTouchUpInside];
        btn;
    })];
    
}

-(void) selectBtn:(UIButton*)sender {
    sender.selected = !sender.selected;
}

-(void) tapEvent {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"你点击了按钮" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:okAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];
    
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
