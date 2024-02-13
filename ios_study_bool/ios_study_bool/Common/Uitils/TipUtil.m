//
//  TipUtil.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/13.
//

#import "TipUtil.h"
#import <objc/runtime.h>
@implementation TipUtil
+ (void)showTip:(NSString *)tip title:(NSString *)title inController:(UIViewController *)viewController {
    UIViewController *tipController = [[UIViewController alloc] init];
    
    // 设置 tipView
    UIView *tipView = [self setupTipViewInController:viewController];
    tipController.view = tipView;
    
    // 设置 navView
    UIView *navView = [self setupNavView:tipView title: title inController:viewController];
    [tipView addSubview:navView];
    
    // 设置 label
    UILabel *label = [self setupLabelWithTip:tip inView:tipView];
    [tipView addSubview:label];
    
    // 弹出视图
    [self presentTipController:tipController inController:viewController];
}

+ (UIView *)setupTipViewInController:(UIViewController *)viewController {
    UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewController.view.frame.size.width, viewController.view.frame.size.height)];
    tipView.backgroundColor = [UIColor blackColor];
    tipView.contentMode = UIViewContentModeTop;
    
    return tipView;
}

+ (UIView *)setupNavView:(UIView *)view title:(NSString *)title inController:(UIViewController *)viewController{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 60)];
    navView.backgroundColor = [UIColor systemCyanColor];
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width /4, 60)];
    cancelBtn.backgroundColor = [UIColor systemRedColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 使用关联对象将 viewController 关联到按钮上
    objc_setAssociatedObject(cancelBtn, @"associatedViewController", viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [cancelBtn addTarget:self action:@selector(tapCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width * 1/4, 0, view.frame.size.width /2, 60)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width * 3/4, 0, view.frame.size.width /4, 60)];
    confirmBtn.backgroundColor = [UIColor systemGreenColor];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 使用关联对象将 viewController 关联到按钮上
    objc_setAssociatedObject(confirmBtn, @"associatedViewController", viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [confirmBtn addTarget:self action:@selector(tapConfirm:) forControlEvents:UIControlEventTouchUpInside];
    
    [navView addSubview:cancelBtn];
    [navView addSubview:titleLabel];
    [navView addSubview:confirmBtn];
    return navView;
}

+ (UILabel *)setupLabelWithTip:(NSString *)tip inView:(UIView *)view {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, view.frame.size.width, CGFLOAT_MAX)];
    label.numberOfLines = 0;
    label.textColor = [UIColor grayColor];
    label.text = tip;
    
    [label sizeToFit]; // 让 label 根据内容自适应大小
    
    // 根据 label 内容计算高度
    CGSize labelSize = [label sizeThatFits:CGSizeMake(label.frame.size.width, CGFLOAT_MAX)];
    CGRect newFrame = label.frame;
    newFrame.size.height = labelSize.height;
    label.frame = CGRectMake(0, 60, newFrame.size.width, newFrame.size.height);
    
    return label;
}

+ (void)presentTipController:(UIViewController *)tipController inController:(UIViewController *)viewController {
    [viewController presentViewController:tipController animated:YES completion:nil];
}

+ (void)tapCancel:(UIButton*)btn {
    UIViewController *viewController = objc_getAssociatedObject(btn, @"associatedViewController");
    if ([viewController isKindOfClass:UIViewController.class]) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }
}

+ (void)tapConfirm:(UIButton*)btn {
    UIViewController *viewController = objc_getAssociatedObject(btn, @"associatedViewController");
    if ([viewController isKindOfClass:UIViewController.class]) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
