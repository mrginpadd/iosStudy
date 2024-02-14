//
//  CusUIPickerViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusUIPickerViewController.h"
#import "IntroductionViewController.h"
#import "Masonry.h"
@interface CusUIPickerViewController ()<IntroductionViewControllerDelegate,UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, strong, readwrite) NSArray* colorsArray;
@end

@implementation CusUIPickerViewController

- (void)viewWillAppear:(BOOL)animated {
    self.colorsArray = @[
   [UIColor redColor],
   [UIColor blueColor],
   [UIColor greenColor],
   [UIColor yellowColor],
   [UIColor purpleColor],
   [UIColor orangeColor]
   ];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];

    // Do any additional setup after loading the view.
}

- (void)buildView {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];

    //将vc的view和其它结构移动到self
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"UIPickerView介绍";
    vc.introContentLabel.text = @" \n \
    UIPickerView 是 iOS 开发中常用的控件，用于展示一组数据供用户选择。 \n \
    用来展示滚动列表并允许用户选择其中一项的控件。它通常用于需要用户从多个选项中选择一个的情况，比如日期选择、地区选择等。 \n \
    \n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
1. 日期选择器 \n \
2. 颜色选择器 \n \
3. 选择不同的主题或模式 \n \
    \n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
      1.初始化UIPickerView  pickerView = [[UIPickerView alloc] init];  \n \
      2.设置代理和数据源  \n \
             self.pickerView.delegate = self;  \n \
             self.pickerView.dataSource = self; \n \
      3.遵守协议  \n \
       <UIPickerViewDelegate, UIPickerViewDataSource>  \n \
      4.实现代理方法  numberOfComponentsInPickerView    numberOfRowsInComponent  \n \
        \n \
    ";
    [vc setApplicationTipBtns:@[@"日期", @"颜色"] ];
  
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"日期"]) {
        [self showDatePicker];
    } else if([title isEqualToString:@"颜色"]) {
        [self showColorPicker];
    } else if([title isEqualToString:@"主题"]) {
        
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (pickerView.tag == 101) {
        return 3; // 日期选择器包含年、月、日三个部分
    } else if(pickerView.tag == 102) {
        return 1;
    } else {
        return 1;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView.tag == 101) {
        if (component == 0) {
            return 100; // 选择100年
        } else if (component == 1) {
            return 12; // 12个月
        } else {
            // 这里需要根据年份和月份计算实际的天数
            return 31; // 假设每个月都有31天
        }
    } else if(pickerView.tag == 102) {
        return self.colorsArray.count;
    } else {
        return 1;
    }
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView.tag == 101) {
        if (component == 0) {
            return [NSString stringWithFormat:@"%ld年", 2022 + row]; // 假设从2022年开始选择
        } else if (component == 1) {
            return [NSString stringWithFormat:@"%ld月", 1 + row]; // 月份从1开始
        } else {
            return [NSString stringWithFormat:@"%ld日", 1 + row]; // 日期从1开始
        }
    } else if(pickerView.tag == 102) {
        return [self colorNameForRow:row];
    } else {
        return @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView.tag == 101) {
        // 当选择完成后执行的操作，你可以在这里获取选择的年、月、日，并进行相应的处理
        NSInteger year = [pickerView selectedRowInComponent:0] + 2022; // 获取选择的年份
        NSInteger month = [pickerView selectedRowInComponent:1] + 1; // 获取选择的月份
        NSInteger day = [pickerView selectedRowInComponent:2] + 1; // 获取选择的日期
        NSLog(@"选择的日期为：%ld年%ld月%ld日", year, month, day);
    } else if(pickerView.tag == 102) {
        pickerView.superview.backgroundColor = _colorsArray[row];
    } else {
        
    }
}

#pragma mark - 日期选择器
- (void)showDatePicker{
    
    UIView *datepickerView = [[UIView alloc] initWithFrame:[self.view bounds]];
    
    datepickerView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    datepickerView.tag = 100;
    
    
    UIPickerView *datePicker = [[UIPickerView alloc] init];
    datePicker.tag = 101;
    datePicker.delegate = self;
    datePicker.dataSource = self;

    
    [datepickerView addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(datepickerView);
       make.width.equalTo(datepickerView);
       make.height.equalTo(@200);
        make.left.equalTo(datepickerView);
    }];
    datePicker.backgroundColor = [UIColor whiteColor];
    
    
    UIView *btnBackgroundView = [[UIView alloc] init];
    btnBackgroundView.backgroundColor = [UIColor whiteColor];
    [datepickerView addSubview:btnBackgroundView];
    [btnBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(datePicker.mas_top);
            make.right.equalTo(datePicker);
            make.width.equalTo(datepickerView);
            make.height.equalTo(@40);
    }];
    
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor systemGreenColor] forState:UIControlStateNormal];
    [datepickerView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(datePicker.mas_top);
       make.right.equalTo(datePicker).offset(-10);
       make.width.lessThanOrEqualTo(@200);
       make.height.equalTo(@40);
    }];
    [confirmBtn addTarget:self action:@selector(confirmButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor systemGrayColor] forState:UIControlStateNormal];
    [datepickerView addSubview:cancelBtn];
  
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(datePicker.mas_top);
       make.left.equalTo(datePicker).offset(10);
       make.width.lessThanOrEqualTo(@200);
       make.height.equalTo(@40);
    }];
    [cancelBtn addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:datepickerView];
}

- (void)confirmButtonAction:(UIButton *)sender {
    UIView *pickerView = sender.superview; // 获取底部选择器视图
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = pickerView.frame;
        frame.origin.y = CGRectGetHeight(self.view.bounds);
        pickerView.frame = frame;
    } completion:^(BOOL finished) {
        [pickerView removeFromSuperview]; // 将底部选择器视图从父视图中移除
    }];
}

- (void)cancelButtonAction:(UIButton *)sender {
    UIView *pickerView = sender.superview; // 获取底部选择器视图
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = pickerView.frame;
        frame.origin.y = CGRectGetHeight(self.view.bounds);
        pickerView.frame = frame;
    } completion:^(BOOL finished) {
        [pickerView removeFromSuperview]; // 将底部选择器视图从父视图中移除
    }];
}

#pragma mark - 颜色选择器

- (void)showColorPicker {
    UIView *pickerView = [[UIView alloc] init];
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.tag = 103;
    [self.view addSubview:pickerView];
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.width.equalTo(self.view);
       make.height.equalTo(@240);
       make.bottom.equalTo(self.view.mas_bottom);
       make.left.equalTo(self.view);
    }];
    

    
    
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor systemGreenColor] forState:UIControlStateNormal];
    [pickerView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(pickerView);
       make.right.equalTo(pickerView).offset(-10);
       make.width.lessThanOrEqualTo(@200);
       make.height.equalTo(@40);
    }];
    [confirmBtn addTarget:self action:@selector(confirmButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor systemGrayColor] forState:UIControlStateNormal];
    [pickerView addSubview:cancelBtn];
  
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(pickerView);
       make.left.equalTo(pickerView).offset(10);
       make.width.lessThanOrEqualTo(@200);
       make.height.equalTo(@40);
    }];
    [cancelBtn addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIPickerView *colorPicker = [[UIPickerView alloc] init];
    colorPicker.tag = 102;
    colorPicker.delegate = self;
    colorPicker.dataSource = self;
    [pickerView addSubview:colorPicker];
    [colorPicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(pickerView);
            make.height.equalTo(@200);
            make.bottom.equalTo(pickerView.mas_bottom);
            make.left.equalTo(pickerView);
    }];
}

- (NSString *)colorNameForRow:(NSInteger)row {

    UIColor *color = _colorsArray[row];
    if ([color isEqual:[UIColor redColor]]) {
        return @"红色";
    } else if ([color isEqual:[UIColor blueColor]]) {
        return @"蓝色";
    } else if ([color isEqual:[UIColor greenColor]]) {
        return @"绿色";
    } else if ([color isEqual:[UIColor yellowColor]]) {
        return @"黄色";
    } else if ([color isEqual:[UIColor purpleColor]]) {
        return @"紫色";
    } else if ([color isEqual:[UIColor orangeColor]]) {
        return @"橙色";
    }
    return @"";
}
@end
