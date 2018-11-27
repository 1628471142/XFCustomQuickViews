//
//  XFStupidTFAlertView.h
//  笨象直播
//
//  Created by 李雪峰 on 16/8/25.
//  Copyright © 2016年 雪峰. All rights reserved.
//
typedef void (^StupidCommintTextBlock)(NSString *text);

#import <UIKit/UIKit.h>

@interface XFStupidTFAlertView : UIView
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *commitBtn;

@property (nonatomic, strong) UIButton *cancleBtn;

@property (nonatomic, strong) StupidCommintTextBlock commitBlock;

@end
