//
//  BXEditInfoView.m
//  笨象直播
//
//  Created by 展翅的小鸟 on 16/12/14.
//  Copyright © 2016年 雪峰. All rights reserved.
//
#import "XFCustomHeader.h"

#import "BXEditInfoView.h"
@implementation BXEditInfoView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGFloat lengths[] = {2,2};
//    CGContextSetLineDash(context, 0, lengths, 1);
//    CGContextMoveToPoint(context, 0.0, rect.size.height - 1);
//    CGContextSetRGBStrokeColor(context, 0.8, 0.8, 0.8, 0.8);  //线的颜色
//    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 1);
//    CGContextStrokePath(context);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _textField = [[UITextField alloc] init];
        _textField.textColor = [UIColor whiteColor];
        [_titleLabel sizeToFit];
        [self addSubview:_titleLabel];
        [self addSubview:_textField];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.centerY.equalTo(self);
        }];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self);
            make.top.equalTo(self).offset(5);
            make.height.equalTo(self).offset(-10);
        }];
        
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder{
    _textField.placeholder = placeholder;
}

@end
