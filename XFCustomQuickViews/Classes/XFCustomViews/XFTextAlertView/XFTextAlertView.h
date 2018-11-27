//
//  XFTextAlertView.h
//  追梦夺宝
//
//  Created by 李雪峰 on 16/7/15.
//  Copyright © 2016年 雪峰. All rights reserved.
//

typedef void (^CommintTextBlock)(NSString *text);

#import <UIKit/UIKit.h>

@interface XFTextAlertView : UIView

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *commitBtn;

@property (nonatomic, strong) UIButton *cancleBtn;

@property (nonatomic, strong) CommintTextBlock commitBlock;
@end
