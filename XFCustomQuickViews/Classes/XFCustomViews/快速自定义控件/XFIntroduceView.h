//
//  XFIntroduceView.h
//  笨象直播
//
//  Created by 李雪峰 on 16/8/20.
//  Copyright © 2016年 雪峰. All rights reserved.
//
typedef void (^SpreadClickBlock)(void);

#import "XFSignLabel.h"

#import <UIKit/UIKit.h>

@interface XFIntroduceView : UIView

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) XFSignLabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *spreadBtn;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, assign) CGRect normalFrame;

@property (nonatomic, strong) SpreadClickBlock spreadBlock;

@property (nonatomic, assign) CGFloat curHeight;

@property (nonatomic, strong) UIColor *themeColor;

@end
