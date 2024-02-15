//
//  CusWKWebViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusWKWebViewController.h"
#import "IntroductionViewController.h"
#import <WebKit/WebKit.h>
#import "ScreenUtil.h"

@interface CusWKWebViewController ()<IntroductionViewControllerDelegate, WKUIDelegate, WKNavigationDelegate>
@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@end

@implementation CusWKWebViewController

- (void)viewDidLoad {

    
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [self didMoveToParentViewController:vc];
    
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"UIWKWebView介绍";
    vc.introContentLabel.text = @"  \n \
    WKWebView 是 iOS 8 及更高版本引入的一个用于显示网页内容的类，它是 WebKit  \n \ 框架提供的一个现代化的 WebView 组件。相比于旧版的 UIWebView，WKWebView  \n \ 有更好的性能、更多的功能和更强大的扩展性。  \n \
    ";
    vc.attributeContentLabel.text = @"   \n \
loadRequest:加载 URL 请求。   \n \
loadHTMLString:baseURL: 加载 HTML 字符串。   \n \
scrollView：获取 WebView 的滚动视图。   \n \
configuration：WebView 的配置对象，可以设置偏好设置、脚本注入等等。   \n \
navigationDelegate：导航代理，用于处理 WebView 的导航操作，比如页面加载、跳转等。   \n \
UIDelegate：用户界面代理，用于处理用户交互行为，比如警报框、确认框等。   \n \
    ";
    vc.applicationContentLabel.text = @"  \n \
    1.显示网页内容：WKWebView 可以用于加载并显示网页内容，包括静态网页、动态网页、以及响应式网页设计。  \n \
        \n \
    2.嵌入第三方内容：可以在应用中嵌入第三方网页或者服务，比如社交媒体、新闻、电子商务等。  \n \
        \n \
    3.与 JavaScript 交互：WKWebView 提供了丰富的 JavaScript 交互  \n \ API，可以实现网页与原生应用之间的双向通信。  \n \
        \n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
     1.创建wekWebView实例 webView = [[WKWebView alloc] initWithFrame:self.view.bounds]; \n \
        \n \
     2.加载网页 [webView loadRequest:request];  \n \
    ";
    
    [vc setUseStepTipBtns:@[@"loadRequest", @"loadHtmlString"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"loadRequest"]) {
        [self buildLoadRequestWebView];
    } else if([title isEqualToString:@"loadHtmlString"]) {
        [self buildLoadHtmlStringWebView];
    }
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    _progressView.progress = 0;
    _progressView.hidden = NO;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    _progressView.progress = 1;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.progressView.hidden = YES;
        //注入js代码改变网页背景颜色
        [webView evaluateJavaScript:@"document.body.style.backgroundColor = '#FFC0CB';" completionHandler:nil];
    });
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        // 更新进度条的进度
        CGFloat progress = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
        [_progressView setProgress:progress animated:YES];
    }
}

- (void)buildLoadRequestWebView {
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[self.view bounds]];
    _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progressView.frame = CGRectMake(0, TOPHEIGHT + 15, self.view.frame.size.width, 5);
    _progressView.progress = 0.5;
    _progressView.progressTintColor = [UIColor blueColor];
    _progressView.backgroundColor = [UIColor redColor];
    _progressView.trackTintColor = [UIColor redColor]; // 设置进度条背景颜色
    _progressView.hidden = YES;
   

    
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    
    
    NSURL *url = [NSURL URLWithString:@"https://www.bazi-test.com/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];

    [self.view addSubview:webView];
    [self.view addSubview:_progressView];
}

-(void)buildLoadHtmlStringWebView {
    NSString *htmlString = @"<!DOCTYPE html> \
    <html> \
      <head> \
        <meta charset=\"UTF-8\"> \
        <title>我的HTML页面</title> \
        <style> \
          /* CSS样式 */ \
          body { \
            font-family: Arial, sans-serif; \
            background-color: #f0f0f0; \
          } \
          h1 { \
            color: #333; \
            border-bottom: 1px solid #333; \
            padding-bottom: 8px; \
          } \
          p { \
            font-size: 18px; \
            line-height: 1.5; \
            margin: 16px 0; \
          } \
          ul { \
            list-style-type: disc; \
            margin-left: 24px; \
          } \
          li { \
            font-size: 16px; \
            line-height: 1.5; \
          } \
          img { \
            max-width: 100%; \
            height: auto; \
            margin: 16px 0; \
          } \
          table { \
            border-collapse: collapse; \
            margin: 16px 0; \
          } \
          th, td { \
            border: 1px solid #ccc; \
            padding: 8px; \
          } \
          th { \
            font-size: 18px; \
            background-color: #f0f0f0; \
          } \
        </style> \
      </head> \
      <body> \
        <!-- HTML内容 --> \
        <h1>欢迎来到我的HTML页面</h1> \
        <p>这是一个包含图片、列表和表格的HTML页面示例。</p> \
        <h2>图片</h2> \
        <img src=\"https://via.placeholder.com/800x400?text=Placeholder+Image\" alt=\"占位图片\"> \
        <h2>无序列表</h2> \
        <ul> \
          <li>列表项1</li> \
          <li>列表项2</li> \
          <li>列表项3</li> \
        </ul> \
        <h2>有序列表</h2> \
        <ol> \
          <li>列表项1</li> \
          <li>列表项2</li> \
          <li>列表项3</li> \
        </ol> \
        <h2>表格</h2> \
        <table> \
          <tr> \
            <th>姓名</th> \
            <th>年龄</th> \
            <th>性别</th> \
          </tr> \
          <tr> \
            <td>张三</td> \
            <td>28</td> \
            <td>男</td> \
          </tr> \
          <tr> \
            <td>李四</td> \
            <td>32</td> \
            <td>女</td> \
          </tr> \
        </table> \
      </body> \
    </html>";

    //WKWebView 默认不允许使用 JavaScript，需要手动开启
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.preferences = [[WKPreferences alloc] init];
    configuration.preferences.javaScriptEnabled = YES;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[self.view bounds] configuration:configuration];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    
    [webView loadHTMLString:htmlString baseURL:nil];
    
    [self.view addSubview:webView];
}
@end
