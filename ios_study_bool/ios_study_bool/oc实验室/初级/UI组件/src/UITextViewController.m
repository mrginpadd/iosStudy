//
//  UITextViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/25.
//

#import "UITextViewController.h"
#import "ScreenUtil.h"
@interface UITextViewController ()<UITextViewDelegate>
@property (nonatomic, strong, readwrite) UIScrollView *scrollView;
@end

@implementation UITextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _buildViews];
    // Do any additional setup after loading the view.
}

- (void)_buildViews {
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 3);
    [self.view addSubview: _scrollView];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
        label.numberOfLines = 0;
        label.textColor = [UIColor blackColor];
        NSMutableAttributedString *aStr1 = [[NSMutableAttributedString alloc] initWithString:@"UITextView"];
        NSDictionary *aDic = @{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0],
            NSBackgroundColorAttributeName: [UIColor blackColor],
            NSForegroundColorAttributeName: [UIColor whiteColor]
        };
        [aStr1 setAttributes:aDic range:NSMakeRange(0, 10)];
        label.attributedText = aStr1;
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 390)];
        label.numberOfLines = 0;
        label.textColor = [UIColor grayColor];
        label.text = @"UITextView是iOS平台上的一个控件，用于显示多行文本。 \n \
        相比UILabel，UITextView具有更强的灵活性和交互性，支持滚动、编辑、选择和格式化等功能。 \n \
        以下是UITextView的一些常用属性： \n \
        text：文本内容。 \n \
        font：字体。 \n \
        textColor：字体颜色。 \n \
        textAlignment：文本对齐方式。 \n \
        editable：是否可编辑。 \n \
        selectable：是否可选择。 \n \
        dataDetectorTypes：数据检测类型（如电话号码、链接等）。 \n \
        scrollEnabled：是否可滚动。 \n \
        contentInset：内容缩进。 \n \
        delegate：委托对象，用于处理文本变化和用户交互等事件。 \n \
        ";
        label;
    })];
    
    [_scrollView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 340, self.view.frame.size.width, 200)];
        label.numberOfLines = 0;
        label.textColor = [UIColor blackColor];
        NSMutableAttributedString *aStr1 = [[NSMutableAttributedString alloc] initWithString:@"应用场景"];
        NSDictionary *aDic = @{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0],
            NSBackgroundColorAttributeName: [UIColor blackColor],
            NSForegroundColorAttributeName: [UIColor whiteColor]
        };
        [aStr1 setAttributes:aDic range:NSMakeRange(0, 4)];
        label.attributedText = aStr1;
        label;
    })];
    
    [_scrollView addSubview:({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 450, self.view.frame.size.width, 450)];
            label.text = @"显示富文本：UITextView可以显示富文本，包括不同字体、颜色、大小、行距和段落等属性。因此，它通常用于显示格式化的文本内容，如新闻、博客、电子书等。 \n \
            用户输入：UITextView可以让用户输入多行文本，并支持编辑、选择和格式化等功能。因此，它适用于用户提交评论、反馈、笔记、文本消息等场景。  \n \
            文本编辑器：由于UITextView支持多行文本输入和格式化，它可以用作简单的文本编辑器，如备忘录、To-Do List、日记等。  \n \
            显示数据：UITextView可以显示各种类型的数据，如JSON、XML、HTML、Markdown等格式。它可以帮助开发人员在调试和测试过程中更好地查看和分析数据。  \n \
            网页浏览器：虽然UITextView不能完全替代UIWebView或WKWebView，但它可以显示简单的HTML文本和链接，如联系方式、地图、社交媒体等。这对于某些简单的任务来说是非常有用的，同时也可以提高应用程序的性能。";
        label.textColor = [UIColor grayColor];
        label.numberOfLines = 0;
        label;
    })];
    
    [_scrollView addSubview:({
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 910, 200, 100)];
        textView.delegate = self;
        textView.backgroundColor = [UIColor yellowColor];
        NSString *text = @"这是UITextView编辑区域，链接： https://www.baidu.com 电话：10086 ...";
        //1.设置文本为富文本
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        
        //2.单读设置链接区域样式
        //设置链接样式
        NSRange linkRange = [text rangeOfString:@"https://www.baidu.com"];
        if (linkRange.location != NSNotFound) {
            [attributedText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"https://www.baidu.com"] range:linkRange];
            [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:linkRange];
        }
        //设置电话样式
        NSRange phoneRange = [text rangeOfString:@"10086"];
        if (phoneRange.location != NSNotFound) {
            [attributedText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"tel:10086"] range:phoneRange];
            [attributedText addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:phoneRange];
        }

        
        textView.attributedText = attributedText;
        //设置多个识别类型
        textView.dataDetectorTypes = UIDataDetectorTypeLink | UIDataDetectorTypePhoneNumber | UIDataDetectorTypeMoney;
        
        [textView setEditable:YES];
        textView.textColor = [UIColor blackColor];
        textView.font = [UIFont systemFontOfSize:15];
        textView.layer.borderColor = [UIColor grayColor].CGColor;
        textView.layer.borderWidth = 1.5;
        textView.layer.cornerRadius = 5.0;
        textView;
    })];

}

#pragma-mark - UITextViewDelegate方法
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"%s 开始编辑文本", __FUNCTION__);
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"%s 结束编辑文本", __FUNCTION__);
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"%s 文本内容发生改变", __FUNCTION__);
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    NSLog(@"%s 点击了textView中的链接", __FUNCTION__);
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange; {
    NSLog(@"%s 点击自定义的链接或特定文本时调用（通过自定义NSAttributedString来实现）", __FUNCTION__);
    return YES;
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
