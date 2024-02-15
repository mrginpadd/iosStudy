//
//  CusUIWebViewViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusUIWebViewViewController.h"
#import "IntroductionViewController.h"
@interface CusUIWebViewViewController ()<IntroductionViewControllerDelegate, UIWebViewDelegate>

//@property(nonatomic, strong, readwrite) UIProgressView* progressView;

@end

@implementation CusUIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.delegate = self;
    vc.introTitleLabel.text = @"UIWebView介绍";
    vc.introContentLabel.text = @"\n \
UIWebView提供了加载、显示和操作网页内容的功能。\n \
    ";
    
    vc.attributeContentLabel.text = @" \n \
    delegate：委托对象，用于处理 WebView 相关事件和回调。 \n \
    scalesPageToFit：是否自动缩放页面以适应 WebView 的大小。 \n \
    scrollView：WebView 的滚动视图。 \n \
    allowsInlineMediaPlayback：是否允许内联媒体播放，例如在网页中播放视频。 \n \
    mediaPlaybackRequiresUserAction：是否需要用户操作才能开始媒体播放。 \n \
    ";
    
    vc.applicationContentLabel.text = @"\n \
       显示网页内容：最常见的用途是在应用程序中加载和显示网页内容，比如展示文章、新闻、博客等。 \n \
       内嵌网页功能：可以将 WebView 嵌入到应用程序中的某个界面，实现内嵌网页的浏览功能。 \n \
       嵌入 HTML5 游戏或应用：WebView 支持 HTML5 技术，可以用来嵌入 HTML5 游戏或应用程序。 \n \
       加载本地 HTML 文件：除了加载远程网页，还可以加载本地 HTML 文件进行展示。 \n \
    ";
    
    vc.useStepContentLabel.text = @"\n \
      1.创建UIWebView示例 webView = [[UIWebView alloc] initWithFrame:frame]; \n \
      2.设置代理 \n \
      <UIWebViewDelegate>  \n \
      webView.delegate = self;  \n \
      3.加载网页。\n \
        NSURL *url = [NSURL URLWithString:@\"https://www.example.com\"]; \n \
        NSURLRequest *request = [NSURLRequest requestWithURL:url]; \n \
        [webView loadRequest:request]; \n \
    ";
    
    [vc setUseStepTipBtns:@[@"url加载", @"html加载"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@
         "url加载"]) {
        [self showLoadUrlWebView];
    } else if([title isEqualToString:@"html加载"]) {
        [self showLoadHtmlStringWebView];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [_progressView setProgress:0 animated:YES];
//    _progressView.hidden = NO;
    self.navigationItem.title = @"加载中...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    [_progressView setProgress:1 animated:YES];
//    _progressView.hidden = YES;
    
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.navigationItem.title = title;
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    [_progressView setProgress:1 animated:YES];
//    _progressView.hidden = YES;
}

// 监听 estimatedProgress 属性变化
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"estimatedProgress"]) {
//        // 更新进度条的进度
//        CGFloat progress = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
//        [_progressView setProgress:progress animated:YES];
//    }
//}

- (void)showLoadUrlWebView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[self.view bounds]];
    webView.tag = 1;
    webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"https://www.bazi-test.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
//        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 2)];
    
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)showLoadHtmlStringWebView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[self.view bounds]];
    webView.tag = 2;
    webView.delegate = self;
    
    NSString *htmlString = @"<!DOCTYPE html> \
    <html> \
    <head> \
        <title>示例页面</title> \
    </head> \
    <body> \
        <h1>Hello, World!</h1> \
        <p>This is a sample HTML content loaded in a WebView.</p> \
        <img src=\"https://www.example.com/image.jpg\" alt=\"Example Image\"> \
    </body> \
    </html> \
";
    [webView loadHTMLString:htmlString baseURL:nil];
    
    [self.view addSubview:webView];
}
@end
