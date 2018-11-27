//
//  WebViewController.m
//  WhiteCollarMall
//
//  Created by 李雪峰 on 16/1/16.
//  Copyright © 2016年 hfuu. All rights reserved.
//

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

#import "WebViewController.h"
@interface WebViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    
}
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self changeLeftButton];

    self.navigationController.navigationBar.barStyle = UIBaselineAdjustmentNone;

    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];

    _webView = [[WKWebView alloc]init];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.bounces = NO;
    [_webView loadRequest:request];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];

    [self.view addSubview:_webView];
    [self.webView sizeToFit];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 2)];
    self.progressView.trackTintColor = [UIColor colorWithRed:252/255.0 green:86/255.0 blue:89/255.0 alpha:1];
    self.progressView.progressTintColor = self.barTintColor;
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    [self.view addSubview:self.progressView];
    

    [self changeRightRefreshButton];
    
}


- (UIColor *)barTintColor{
    
    if (_barTintColor == nil) {
        _barTintColor = [UIColor redColor];
    }
    return _barTintColor;
    
}



- (void)changeRightRefreshButton{
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [rightBtn setTitle:@"刷新" forState:UIControlStateNormal];
    [rightBtn setTitleColor:self.barTintColor forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(refreshEvent) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = barBtn;
    self.tabBarController.tabBar.hidden = YES;
    
}


- (void)refreshEvent{
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:_webView.URL];
    
    [_webView loadRequest:request];
    
}


- (void)changeLeftButton{
    
//    UIView *btnsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 25)];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 50, 25)];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    closeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    UIBarButtonItem *barBtn2 = [[UIBarButtonItem alloc]initWithCustomView:closeBtn];

    self.navigationItem.leftBarButtonItems = @[barBtn,barBtn2];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)closeBtnClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)backClick{
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.hidden = NO;
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress >= 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
            }];
        }
    }
}


- (void)dealloc{
    
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    
    NSLog(@"webView被销毁了");
    
}


// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
    
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
    
    
}


//// 接收到服务器跳转请求之后调用
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
//
//
//
//}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{

    self.navigationController.navigationItem.title = webView.title;
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSLog(@"purposeUrl = %@",navigationAction.request.URL.absoluteString);
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}



- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_navhide) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [_webView setFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    }else{

        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [_webView setFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - 64)];
    }
    
}


//解决js alert 不弹窗问题
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    //    DLOG(@"msg = %@ frmae = %@",message,frame);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
