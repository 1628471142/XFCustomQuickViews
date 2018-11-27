//
//  WebViewController.h
//  WhiteCollarMall
//
//  Created by 李雪峰 on 16/1/16.
//  Copyright © 2016年 hfuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController
@property ( nonatomic, strong) WKWebView *webView;
@property ( nonatomic, strong) NSString *urlString;
@property ( nonatomic, assign) BOOL navhide;

@property ( nonatomic, strong) NSString *htmlString;

@property (nonatomic, strong) UIColor *barTintColor;
@end
