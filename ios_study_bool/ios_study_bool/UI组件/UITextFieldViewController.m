//
//  UITextFieldViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/24.
//

#import "UITextFieldViewController.h"
#import "ScreenUtil.h"
@interface UITextFieldViewController ()<UITextFieldDelegate>
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;
@property(nonatomic, strong, readwrite) UITextField *textField1;
@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _buildViews];
}

- (void) _buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, TOPHEIGHT, self.view.frame.size.width, 400)];
        label.text = @"UITextField是iOS开发中常用的文本输入框控件，它允许用户在应用程序中输入和编辑文本。下面是UITextField的一些特性和示例： \n \
        text：字符串，表示文本输入框中显示的文本内容。  \n \
        placeholder：字符串，表示在用户未输入内容时显示的占位符文本。  \n \
        delegate：遵循UITextFieldDelegate协议的对象，用于处理与文本输入框相关的事件和回调。  \n \
        keyboardType：UIKeyboardType枚举值，表示键盘类型。可以根据需要设置不同的键盘类型，例如数字键盘、邮箱键盘等。  \n \
        secureTextEntry：布尔值，表示是否以密码形式显示输入的文本。当设置为true时，输入内容将会以圆点或星号等隐藏。  \n \
        autocapitalizationType：UITextAutocapitalizationType枚举值，表示自动大写类型。  \n \
        可以控制自动大写的行为，例如每个单词首字母大写、句子首字母大写等。";
        label.numberOfLines = 0;
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [_scrollView addSubview:({
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 410 + TOPHEIGHT, self.view.frame.size.width, 30)];
            label.text = @"UITextBorderStyle";
            label;
    })];
    
    [_scrollView addSubview:({
        UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 440 + TOPHEIGHT, self.view.frame.size.width, 50) actions:@[@"None", @"Line", @"Bezel", @"RoundedRect"]];
        segmentedControl.selectedSegmentIndex = 0;
        //添加事件
        [segmentedControl addTarget:self action:@selector(borderStyleChange:) forControlEvents:UIControlEventValueChanged];
        
        segmentedControl;
    })];
    
    [_scrollView addSubview:({
        UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 440 + TOPHEIGHT, self.view.frame.size.width, 50) actions:@[@"None", @"Line", @"Bezel", @"RoundedRect"]];
        segmentedControl.selectedSegmentIndex = 0;
        //添加事件
        [segmentedControl addTarget:self action:@selector(borderStyleChange:) forControlEvents:UIControlEventValueChanged];
        
        segmentedControl;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 490 + TOPHEIGHT, self.view.frame.size.width, 30)];
        label.text = @"输入框键盘类型 keyboardType";
        label.font = [UIFont boldSystemFontOfSize:15];
        label;
    })];
    
    [_scrollView addSubview:({
        UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 520 + TOPHEIGHT, self.view.frame.size.width, 30) actions:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7"]];
        segmentedControl.selectedSegmentIndex = 0;
        //添加事件
        [segmentedControl addTarget:self action:@selector(keyBoardTypeChange:) forControlEvents:UIControlEventValueChanged];
        
        segmentedControl;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 560 + TOPHEIGHT, self.view.frame.size.width, 30)];
        label.text = @"密码输入框 secureTextEntry";
        label.font = [UIFont boldSystemFontOfSize:15];
        label;
    })];
    
    [_scrollView addSubview:({
        UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 590 + TOPHEIGHT, self.view.frame.size.width, 30) actions:@[@"密码输入框", @"非密码"]];
        segmentControl.selectedSegmentIndex = 0;
        [segmentControl addTarget:self action:@selector(securityChange:) forControlEvents:UIControlEventValueChanged];
        segmentControl;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 620 + TOPHEIGHT, self.view.frame.size.width, 30)];
        label.text = @"输入框大写类型 autocapitalizationType(UITextAutocapitalizationType)";
        label.font = [UIFont boldSystemFontOfSize:15];
        label;
    })];
    
    [_scrollView addSubview:({
        UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 650 + TOPHEIGHT, self.view.frame.size.width, 30) actions:@[@"None", @"Words", @"Sentences", @"AllCharacters"]];
        segmentControl.selectedSegmentIndex = 0;
        [segmentControl addTarget:self action:@selector(daxieChange:) forControlEvents:UIControlEventValueChanged];
        segmentControl;
    })];
    
    
    [_scrollView addSubview:({
        _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(0, 690 + TOPHEIGHT, 350, 30)];
        //设置占位符文本
        _textField1.placeholder = @"请输入数字";
        //设置边框
        //        UITextBorderStyleNone,
        //        UITextBorderStyleLine,
        //        UITextBorderStyleBezel,
        _textField1.borderStyle = UITextBorderStyleRoundedRect;
   
        //设置键盘类型
        _textField1.keyboardType = UIKeyboardTypeDefault;
        
        //设置密码输入框
        _textField1.secureTextEntry = YES;
        
        //设置大写类型
        _textField1.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _textField1.delegate = self;
        
        _textField1;
    })];
    
    
    
    [self.view addSubview:_scrollView];
}

//切换输入框边框样式
-(void)borderStyleChange:(UISegmentedControl *)sender {
    switch(sender.selectedSegmentIndex) {
        case 0:
            _textField1.borderStyle = UITextBorderStyleNone;
            break;;
        case 1:
            _textField1.borderStyle = UITextBorderStyleLine;
            break;
        case 2:
            _textField1.borderStyle = UITextBorderStyleBezel;
            break;;
        case 3:
            _textField1.borderStyle = UITextBorderStyleRoundedRect;
            break;
        default:
            _textField1.borderStyle = UITextBorderStyleNone;
            break;
    }
}

// 切换键盘输入框类型
-(void)keyBoardTypeChange:(UISegmentedControl *)sender {
    switch(sender.selectedSegmentIndex) {
        case 0:
            _textField1.keyboardType = UIKeyboardTypeDefault;
            _textField1.placeholder = @"UIKeyboardTypeDefault";
            break;
        case 1:
            _textField1.keyboardType = UIKeyboardTypeURL;
            [_textField1 layoutIfNeeded];
            _textField1.placeholder = @"UIKeyboardTypeURL";
            break;
        case 2:
            _textField1.keyboardType = UIKeyboardTypeNumberPad;
            _textField1.placeholder = @"UIKeyboardTypeNumberPad";
            break;
        case 3:
            _textField1.keyboardType = UIKeyboardTypePhonePad;
            _textField1.placeholder = @"UIKeyboardTypePhonePad";
            break;
        case 4:
            _textField1.keyboardType = UIKeyboardTypeTwitter;
            _textField1.placeholder = @"UIKeyboardTypeTwitter";
            break;
        case 5:
            _textField1.keyboardType = UIKeyboardTypeAlphabet;
            _textField1.placeholder = @"UIKeyboardTypeAlphabet";
            break;
        case 6:
            _textField1.keyboardType = UIKeyboardTypeWebSearch;
            _textField1.placeholder = @"UIKeyboardTypeWebSearch";
            break;
        default:
            _textField1.keyboardType = UIKeyboardTypeDefault;
            _textField1.placeholder = @"UIKeyboardTypeDefault";
            break;
    }
}

//输入框密码切换
-(void)securityChange:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _textField1.secureTextEntry = YES;
    } else {
        _textField1.secureTextEntry = NO;
    }
}

-(void)daxieChange:(UISegmentedControl *)sender {
    switch(sender.selectedSegmentIndex) {
        case 0:
            _textField1.autocapitalizationType = UITextAutocapitalizationTypeNone;
            break;
        case 1:
            _textField1.autocapitalizationType = UITextAutocapitalizationTypeWords;
            break;
        case 2:
            _textField1.autocapitalizationType = UITextAutocapitalizationTypeSentences;
            break;
        case 3:
            _textField1.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
            break;
        default:
            _textField1.autocapitalizationType = UITextAutocapitalizationTypeNone;
            break;
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
