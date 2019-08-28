//
//  WKWebViewController.m
//  ObjcApiIntro
//
//  Copyright © 2019年 hormiga6. All rights reserved.
//

#import "WKWebViewController.h"
@import WebKit;

@interface WKWebViewController ()<WKNavigationDelegate>
@property (nonatomic) WKWebView *webView;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [WKWebView new];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    self.webView.opaque = NO;
    self.webView.backgroundColor = [UIColor lightGrayColor];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    [self setupAnchor];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"wkwebview-sample" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:html baseURL:nil];

//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.example.com"]];
//    request.timeoutInterval = 1.0;
//    [self.webView loadRequest:request];
    
}

- (void)setupAnchor{
    [self.webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.webView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.webView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}


#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), navigationAction.request.URL);
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView
decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse
decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), navigationResponse.response.URL);
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
@end
