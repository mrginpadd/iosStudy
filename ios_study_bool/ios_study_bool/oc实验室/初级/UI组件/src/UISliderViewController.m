//
//  UISliderViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/26.
//

#import "UISliderViewController.h"

@interface UISliderViewController ()
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@property(nonatomic, strong, readwrite) UISlider *slider;
@end

@implementation UISliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildView];
}

- (void)buildView {
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [self.view addSubview:_scrollView];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        NSAttributedString *astr = [[NSAttributedString alloc] initWithString:@"UISlider介绍" attributes:@{
            NSForegroundColorAttributeName: [UIColor whiteColor],
      
        }];
        label.backgroundColor = [UIColor blackColor];
        label.attributedText = astr;
        
        label;
    })];
    
    [_scrollView addSubview:({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 80)];
            label.text = @"UISlider 是 UIKit 框架中的一个控件类，用于在应用程序中显示水平滑动条。用户可以通过拖动滑块来选择一个值，通常用于表示范围或进度。";
            label.numberOfLines = 0;
            label.textColor = [UIColor grayColor];
            label;
    })];
    
    [_scrollView addSubview:({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, self.view.frame.size.width, 40)];
            NSAttributedString *astr = [[NSAttributedString alloc] initWithString:@"应用场景" attributes:@{
                NSForegroundColorAttributeName: [UIColor whiteColor]
            }];
        
            label.attributedText = astr;
            label.backgroundColor = [UIColor blackColor];
            label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, self.view.frame.size.width, 120)];
        label.text = @"调整设置：例如， \n \
            1.用户可以使用滑块来调整音量、亮度或其他设置数值。 \n \
            2. 进度展示：用于展示某个任务的进度，比如播放音乐时展示当前播放进度。";
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
        // 计算 UISlider 在父视图中的 x 坐标
        CGFloat xPosition = (self.view.frame.size.width - 200) / 2;
        
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(xPosition, 300, 200, 40)];
        
        //设置滑块的取值范围
        slider.minimumValue = 0.0;
        slider.maximumValue = 100.0;
        slider.value = 50.0;
        slider.thumbTintColor = [UIColor blackColor];
    
        // 设置左侧轨道颜色
        slider.minimumTrackTintColor = [UIColor redColor];

        // 设置右侧轨道颜色
        slider.maximumTrackTintColor = [UIColor grayColor];
        
        [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
        slider;
        
    })];
    
    [_scrollView addSubview:({
        // 计算 UISlider 在父视图中的 x 坐标
        CGFloat xPosition = (self.view.frame.size.width - 200) / 2;
        
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(xPosition, 350, 200, 40)];
        
        //设置滑块的取值范围
        _slider.minimumValue = 0.0;
        _slider.maximumValue = 100.0;
        _slider.value = 50.0;
        _slider.thumbTintColor = [UIColor blackColor];
    
        // 设置左侧轨道颜色
        _slider.minimumTrackTintColor = [UIColor redColor];

        // 设置右侧轨道颜色
        _slider.maximumTrackTintColor = [UIColor grayColor];
//        _slider.backgroundColor = [UIColor grayColor];


        [_slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
        _slider;
        
    })];
    [self addTickMarks:_slider count:6];
}

-(void)sliderValueChange:(UISlider*) slider {
    NSLog(@"%s %f", __FUNCTION__, slider.value);
}

- (void)addTickMarks:(UISlider*)slider count: (int)count {
    CGFloat width = 2;
    //计算刻度线间隔
    CGFloat tickSpacing = (slider.frame.size.width - width) / (count - 1);
    for(int i=0; i<count; i++) {
        UIView *tickView = [[UIView alloc] initWithFrame:CGRectMake( i*tickSpacing, slider.frame.size.height/2 - 4, width, 10)];
        tickView.backgroundColor = [UIColor blackColor];
        [slider addSubview:tickView];
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
