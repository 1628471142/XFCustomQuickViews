//
//  XFBrokenLineTextView.m
//  笨象直播
//
//  Created by 李雪峰 on 16/8/27.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFBrokenLineTextField.h"

@implementation XFBrokenLineTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat lengths[] = {5,3};
    CGContextSetLineDash(context, 0, lengths, 1);
    CGContextMoveToPoint(context, 0.0, rect.size.height - 1);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 0.8);  //线的颜色
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 1);
    CGContextStrokePath(context);
}


@end
