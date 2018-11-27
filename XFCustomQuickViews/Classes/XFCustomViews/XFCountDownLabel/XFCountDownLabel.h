//
//  XFCountDownLabel.h
//  追梦夺宝
//
//  Created by 李雪峰 on 16/7/18.
//  Copyright © 2016年 雪峰. All rights reserved.
//
typedef void (^EndCountDownBlock)(void);

#import <UIKit/UIKit.h>

@interface XFCountDownLabel : UILabel

@property (nonatomic, strong) EndCountDownBlock countDownBlock;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger countTime;

@property (nonatomic, strong) NSString *endTitle;

@property (nonatomic, strong) NSString *curTitle;

@property (nonatomic, strong) UIColor *endBgColor;

@property (nonatomic, strong) UIColor *curBgColor;

@property (nonatomic, strong) UIColor *curTextColor;

@property (nonatomic, strong) UIColor *endTextColor;

@property (nonatomic, assign) float interval;

/**
 *  倒计时
 *  @param timeLine 总时间毫秒
 *  @param title    倒计时进行中的title
 *  @param subTitle 倒计时结束后的title
 *  @param mColor   结束后背景颜色
 *  @param color    倒计时中背景色
 *  @param curTextColor 倒计时中文本颜色
 *  @param endTextColor 结束后文本颜色
 */
- (void)startWithTime:(NSInteger)timeLine endTitle:(NSString *)endTitle countDownTitle:(NSString *)curTitle endColor:(UIColor *)endColor countColor:(UIColor *)color curTextColor:(UIColor *)curTextColor endTextColor:(UIColor *)endTextColor;

//- (void)startWithTime:(NSInteger)startTime interval:(float)interval countDownTitle:(NSString *)curTitle endTitle:(NSString *)endTitle countColor:(UIColor *)curBgColor endColor:(UIColor *)endBgColor curTextColor:(UIColor *)curTextColor endTextColor:(UIColor *)endTextColor;

@end
