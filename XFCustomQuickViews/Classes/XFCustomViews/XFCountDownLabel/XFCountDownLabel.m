//
//  XFCountDownLabel.m
//  追梦夺宝
//
//  Created by 李雪峰 on 16/7/18.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFCountDownLabel.h"

@implementation XFCountDownLabel

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
- (void)startWithTime:(NSInteger)timeLine endTitle:(NSString *)endTitle countDownTitle:(NSString *)curTitle endColor:(UIColor *)endColor countColor:(UIColor *)color curTextColor:(UIColor *)curTextColor endTextColor:(UIColor *)endTextColor{
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_sourceTimer, dispatch_walltime(NULL, 0), 0.01 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_sourceTimer, ^{
        timeOut --;
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_sourceTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = endColor;
                self.textColor = endTextColor;
                self.text = [NSString stringWithFormat:@"%@",endTitle];
                self.userInteractionEnabled = YES;
                if ([self countDownBlock]) {
                    self.countDownBlock();
                }
            });
        } else {
            NSInteger mimute = timeOut/100/60;
            NSString *mimuteStr = mimute/10 == 0 ? [NSString stringWithFormat:@"0%ld",mimute] : [NSString stringWithFormat:@"%ld",mimute];
            NSInteger seconds = timeOut/100%60;
            NSString *secondsStr = seconds/10 == 0 ? [NSString stringWithFormat:@"0%ld",seconds] : [NSString stringWithFormat:@"%ld",seconds];
            NSInteger mseconds = timeOut%100;
            NSString *msecondsStr = mseconds/10 == 0 ? [NSString stringWithFormat:@"0%ld",mseconds] : [NSString stringWithFormat:@"%ld",mseconds];
            NSString *timeStr = [NSString stringWithFormat:@"%@:%@:%@", mimuteStr,secondsStr,msecondsStr];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                self.textColor = curTextColor;
                self.text = [NSString stringWithFormat:@"%@ %@",curTitle,timeStr];
                self.userInteractionEnabled = NO;
            });
        }
    });
    dispatch_resume(_sourceTimer);
}

- (void)dealloc{
    NSLog(@"dealloc");
}

@end
