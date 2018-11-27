//
//  XFReportView.h
//  笨象直播
//
//  Created by 展翅的小鸟 on 17/1/12.
//  Copyright © 2017年 雪峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFTextView.h"
typedef void (^StupidCommitTextBlock)(NSString *text);

@interface XFReportView : UIView
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) XFTextView *textView;

@property (nonatomic, strong) UIButton *commitBtn;

@property (nonatomic, strong) UIButton *cancleBtn;

@property (nonatomic, strong) StupidCommitTextBlock commitBlock;
@end
