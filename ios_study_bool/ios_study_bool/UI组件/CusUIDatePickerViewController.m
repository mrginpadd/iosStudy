//
//  CusUIDatePickerViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusUIDatePickerViewController.h"
#import "IntroductionViewController.h"
#import "Masonry.h"
@interface CusUIDatePickerViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusUIDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    
    vc.delegate = self;
    
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController: self];
    
    vc.introTitleLabel.text = @"UIDatePicker介绍";
    vc.introContentLabel.text = @" \n \
    UIDatePicker 是 iOS 开发中常用的控件，用于让用户选择日期和时间。  \n \
    它提供了一个滚轮来让用户通过滑动来选择日期和时间，用户可以通过滚轮选择年、月、日、时、分等信息。  \n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
       日期和时间选择器：允许用户选择特定的日期和时间。  \n \
       预约和日历应用程序：用户可以使用 UIDatePicker 来选择特定日期和时间进行预约或安排日程。  \n \
       生日选择器：在用户注册或填写个人资料时，可以使用 UIDatePicker 让用户选择他们的生日。  \n \
       提醒设置：用户可以通过 UIDatePicker 来设定提醒的日期和时间。  \n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
      1.初始化 UIDatePicker *datePicker = [[UIDatePicker alloc] init];  \n \
      2.设置日期选择范围  \n \
    NSDate *minDate = [NSDate date];  \n \
    NSDate *maxDate = [NSDate dateWithTimeIntervalSinceNow:3600*24*7]; // 当前时间到一周后  \n \
    [datePicker setMinimumDate:minDate];  \n \
    [datePicker setMaximumDate:maxDate]; \n \
      3.日期改变触发方法  \n \
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged]; \n \
    ";
    
    [vc setUseStepTipBtns:@[@"Date", @"Time", @"DateAndTime", @"CountDownTimer"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"Date"]) {
        [self showDatePicker:UIDatePickerModeDate];
    } else if([title isEqualToString:@"Time"]) {
        [self showDatePicker:UIDatePickerModeTime];
    } else if([title isEqualToString:@"DateAndTime"]) {
        [self showDatePicker:UIDatePickerModeDateAndTime];
    } else if([title isEqualToString:@"CountDownTimer"]) {
        [self showDatePicker:UIDatePickerModeCountDownTimer];
    }
}

// 日期选择器
- (void)showDatePicker:(UIDatePickerMode*)mode {
    //创建实例
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = mode;
    datePicker.backgroundColor = [UIColor greenColor];
    //设置日期范围
    NSDate *minDate = [NSDate date];
    NSDate *maxDate = [NSDate dateWithTimeIntervalSinceNow:3600*24*7];
    [datePicker setMinimumDate:minDate];
    [datePicker setMaximumDate:maxDate];
 
    //添加事件处理方法
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.bottom.left.equalTo(self.view);
        make.height.equalTo(@200);
    }];
}
// 事件处理方法
- (void)datePickerValueChanged:(UIDatePicker *)picker {
    NSDate *selectedDate = picker.date;
    // 处理选择的日期
    NSLog(@"%@", selectedDate);
}

@end
