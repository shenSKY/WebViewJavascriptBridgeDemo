//
//  ViewController.m
//  WebViewJavascriptBridgeDemo
//
//  Created by 沈凯 on 2017/4/27.
//  Copyright © 2017年 神SKY. All rights reserved.
//

#import "ViewController.h"
#import "WebViewJavascriptBridge.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"WebViewJavascriptBridgeDemo" ofType:@"html"]]]];
    //初始化bridge
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    //1 注册OC的方法给JS
    [self.bridge registerHandler:@"Set" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self.bridge callHandler:@"Get" data:@"OC已接受"];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
