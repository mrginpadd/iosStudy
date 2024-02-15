//
//  CusGesRegViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusGesRegViewController.h"
#import "IntroductionViewController.h"
#import "ToastUtil.h"
#import "Masonry.h"
#import "TripleTapGestureRecognizer.h"
@interface CusGesRegViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusGesRegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    // Do any additional setup after loading the view.
    
    vc.introTitleLabel.text = @"手势识别器（Gesture Recognizer）介绍";
    vc.introContentLabel.text = @" \n \
    手势识别器（GestureRecognizer）\n \
    用于检测和响应用户的手势操作，如点击、拖动、捏合等。  \n \
    能够识别用户在屏幕上的手势操作的对象 \n \
    iOS提供了多种内置的手势识别器，如UITapGestureRecognizer（点击手势）、UIPanGestureRecognizer（拖动手势）、UIPinchGestureRecognizer（捏合手势）等。 \n \
"
    ;
    vc.attributeContentLabel.text = @" \n \
isEnabled：手势识别器是否启用。 \n \
delegate：手势识别器的委托对象，用于处理手势识别过程中的事件。 \n \
numberOfTouchesRequired：触发手势所需的手指数量。 \n \
cancelsTouchesInView：手势识别器识别手势时是否取消视图中的触摸事件。 \n \
view：手势识别器关联的视图对象。 \n \
    ";
    
    vc.applicationContentLabel.text = @"\n \
添加交互性：通过手势识别器可以为视图添加更多的交互方式，提升用户体验。\n \
自定义手势：可以自定义特定的手势识别器，实现更复杂的用户交互功能。\n \
处理用户输入：根据用户的手势操作来执行相应的逻辑，如放大缩小图片、拖动视图等。\n \
    ";
    
    
    vc.useStepContentLabel.text = @" \n \
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]  \n \ initWithTarget:self action:@selector(tapGesAction)];  \n \
        [gesLabel addGestureRecognizer:tapGes];  \n \
         \n \
    ";
    
    UILabel *gesLabel = [[UILabel alloc] init];
    gesLabel.backgroundColor = [UIColor greenColor];
    gesLabel.text = @"内置手势";
    gesLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesAction)];
    [gesLabel addGestureRecognizer:tapGes];
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesAction:)];
    [gesLabel addGestureRecognizer:panGes];
    
    [self.view addSubview:gesLabel];
    [gesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vc.useStepContentLabel.mas_bottom);
            make.width.equalTo(self.view);
            make.height.equalTo(@100);
    }];
    

    UILabel *cusLabel = [[UILabel alloc] init];
    cusLabel.backgroundColor = [UIColor redColor];
    cusLabel.text = @"自定义连续点击3次手势";
    TripleTapGestureRecognizer *tripleGes = [[TripleTapGestureRecognizer alloc] initWithTarget:self action:@selector(tripleGesAction)];
    cusLabel.userInteractionEnabled = YES;
    [cusLabel addGestureRecognizer:tripleGes];
    [self.view addSubview:cusLabel];
    [cusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(gesLabel.mas_bottom).equalTo(@20);
            make.width.equalTo(self.view);
            make.height.equalTo(@300);
    }];
    
}

- (void)tapGesAction {
    [ToastUtil showToastCenter:@"UITapGestureRecognizer点击手势"];
}

- (void)panGesAction:(UIPanGestureRecognizer *)gesture {
    // 获取手势的状态和位置信息
    CGPoint translation = [gesture translationInView:self.view];
    CGPoint velocity = [gesture velocityInView:self.view];
    UIGestureRecognizerState state = gesture.state;
    
    if (state == UIGestureRecognizerStateChanged) {
        NSLog(@"拖动手势x: %ld y: %ld", translation.x, translation.y);
        // 手势正在拖动中
        // 根据手势的位置和状态执行相应的操作逻辑
    } else if (state == UIGestureRecognizerStateEnded) {
        // 手势已经结束
        // 根据手势的速度和方向执行相应的操作逻辑
    }
    // 其他手势状态的处理逻辑...
    [ToastUtil showToastCenter:@"UIPanGestureRecognizer拖动手势"];
}

-(void)tripleGesAction {
    [ToastUtil showToastCenter:@"自定义连续点击3次手势"];
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
