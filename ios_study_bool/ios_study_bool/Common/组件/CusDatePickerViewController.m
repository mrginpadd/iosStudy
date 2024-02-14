//
//  CusDatePickerViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusDatePickerViewController.h"

@interface CusDatePickerViewController ()

@end

@implementation CusDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPickerView *datePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
     datePicker.tag = 100;
     datePicker.delegate = self;
     datePicker.dataSource = self;
     datePicker.backgroundColor = [UIColor greenColor];
     
     [self.view addSubview:datePicker];
}

- (void)showBottomPopup {
    CusDatePickerViewController *customViewController = [[CusDatePickerViewController alloc] init];
    customViewController.modalPresentationStyle = UIModalPresentationCustom;
    customViewController.transitioningDelegate = self;
    
    [self presentViewController:customViewController animated:YES completion:nil];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (CGRect)frameOfPresentedViewInContainerView {
    CGFloat height = 200; // 自定义底部弹窗的高度
    CGRect containerBounds = self.containerView.bounds;
    return CGRectMake(0, CGRectGetHeight(containerBounds) - height, CGRectGetWidth(containerBounds), height);
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
