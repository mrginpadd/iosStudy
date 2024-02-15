//
//  UIAlertViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/13.
//

#import "UIAlertViewController.h"
#import "IntroductionViewController.h"
#import "Masonry.h"
@implementation UIAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildViews];
}

- (void)buildViews {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    
    //
//  [self.view addSubview:vc.view];
    vc.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height); // 设置子视图控制器的大小和位置
        [self.view addSubview:vc.view];
    
    [vc didMoveToParentViewController:self];
    
    vc.introTitleLabel.text = @"UIAlertController介绍";
    vc.introContentLabel.text = @"\n \
    UIAlertController 是 iOS  开发中常用的控件之一，用于显示提醒、警告、确认等弹出式对话框。 \n \
    它替代了之前的 UIAlertView 和 UIActionSheet，提供了更加灵活和功能丰富的功能。"
    ;
    
    vc.applicationContentLabel.text = @" \n \
    1. 弹出提醒、警告：例如，当用户进行一些敏感操作时需要确认。 \n \
    2. 显示确认信息：当用户执行某些操作需要二次确认时使用。 \n \
    3. 提供选择项：例如，从多个选项中选择一个。 \n \
    4. 包含文本输入：在需要用户输入文本的情况下使用。 \n \
    ";
    
    
    vc.useStepContentLabel.text = @" \n \
    UIAlertController可以包含两种类型的弹出框：警告框（Alert）和操作表（ActionSheet）。 \n \
    对于警告框，可以包含标题、消息和按钮；而操作表则适用于在屏幕底部弹出的选择菜单。 \n \
    "
    ;
    
    UIButton *alertBtn = [[UIButton alloc] init];
    alertBtn.backgroundColor = [UIColor blueColor];
    [alertBtn setTitle:@"alert" forState:UIControlStateNormal];
    [alertBtn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:alertBtn];
    [alertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.useStepContentLabel.mas_bottom);
        make.left.equalTo(vc.view);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
    
    NSString *alertTip = @"    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@\"警告框UIAlertControllerStyleAlert\" \n \ message:@\"UIAlertController的警告框UIAlertControllerStyleAlert\"  \n \ preferredStyle:UIAlertControllerStyleAlert]; \n \
    //添加按钮  \n \
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@\"取消\"  \n \ style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) { \n \
        [self dismissViewControllerAnimated:YES completion:nil]; \n \
    }]; \n \
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@\"确认\"  \n \ style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)  \n \ { \n \
        [self dismissViewControllerAnimated:YES completion:nil]; \n \
    }];\n \
        \n \
    [alertController addAction:cancelAction];\n \
    [alertController addAction:confirmAction];\n \
    \n \
    //显示警告框\n \
    [self presentViewController:alertController animated:YES completion:nil]; \n \
    ";
    
    
    UIButton *alertSheetBtn = [[UIButton alloc] init];
    alertSheetBtn.backgroundColor = [UIColor blueColor];
    [alertSheetBtn setTitle:@"alertSheet" forState:UIControlStateNormal];
    [alertSheetBtn addTarget:self action:@selector(showAlertSheet) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:alertSheetBtn];
    [alertSheetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.useStepContentLabel.mas_bottom);
        make.left.equalTo(alertBtn.mas_right).offset(10);
        make.height.equalTo(@40);
        make.width.equalTo(@100);
    }];
    NSString *alertSheetTip = @"  \n \
    UIAlertController *alertSheetController = [UIAlertController    \n \ alertControllerWithTitle:@\"alertSheet\"   \n \ message:@\"这是操作表UIAlertControllerStyleActionSheet\"   \n \ preferredStyle:UIAlertControllerStyleActionSheet];   \n \
          \n \
    //添加按钮   \n \
    UIAlertAction *option1Action = [UIAlertAction actionWithTitle:@\"选项1\"   \n \ style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {   \n \
              \n \
    }];  \n \
          \n \
    UIAlertAction *option2Action = [UIAlertAction actionWithTitle:@\"选项2\"   \n \ style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {   \n \
              \n \
    }];  \n \
          \n \
    [alertSheetController addAction:option1Action];  \n \
    [alertSheetController addAction:option2Action];  \n \
          \n \
    //显示操作表  \n \
    [self presentViewController:alertSheetController animated:YES completion:nil];  \n \
    ";
    
    
    [vc setUseStepTipBtns:@[@"alert", @"alertSheet"] titles:@[@"alert", @"alertSheet"] contents:@[alertTip, alertSheetTip]];
 
}

-(void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告框UIAlertControllerStyleAlert" message:@"UIAlertController的警告框UIAlertControllerStyleAlert" preferredStyle:UIAlertControllerStyleAlert];
    
    //添加按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    //显示警告框
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showAlertSheet {
    UIAlertController *alertSheetController = [UIAlertController alertControllerWithTitle:@"alertSheet" message:@"这是操作表UIAlertControllerStyleActionSheet" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //添加按钮
    UIAlertAction *option1Action = [UIAlertAction actionWithTitle:@"选项1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *option2Action = [UIAlertAction actionWithTitle:@"选项2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertSheetController addAction:option1Action];
    [alertSheetController addAction:option2Action];
    
    //显示操作表
    [self presentViewController:alertSheetController animated:YES completion:nil];
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
