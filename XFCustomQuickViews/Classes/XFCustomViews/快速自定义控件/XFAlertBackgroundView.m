//
//  XFAlertBackgroundView.m
//  笨象直播
//
//  Created by 展翅的小鸟 on 16/11/14.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFAlertBackgroundView.h"

@implementation XFAlertBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setFrame:[UIScreen mainScreen].bounds];
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}



@end
