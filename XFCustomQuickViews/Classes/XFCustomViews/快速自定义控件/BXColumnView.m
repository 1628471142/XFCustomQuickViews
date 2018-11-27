//
//  BXColumn.m
//  笨象直播
//
//  Created by 展翅的小鸟 on 16/12/15.
//  Copyright © 2016年 雪峰. All rights reserved.
//
#define OrangeFontColor [UIColor colorWithRed:1 green:150/255.0 blue:0/255.0 alpha:1]
#define KMainWidth [UIScreen mainScreen].bounds.size.width
#define DotWidth 4
#import "BXColumnView.h"
#import "UIView+AddCornerRadius.h"
#import "NSString+Extention.h"
#import "XFCustomHeader.h"

@implementation BXColumnView
{
    UIView *_leftLine;
    UIView *_rightLine;
    UIView *_leftdot;
    UIView *_rightdot;

}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _leftLine = [[UIView alloc] init];
        _rightLine = [[UIView alloc] init];
        _leftdot = [[UIView alloc] init];
        _rightdot = [[UIView alloc] init];
        
        [_leftdot setBackgroundColor:OrangeFontColor];
        [_leftdot addCornerRadiusWithFloat:DotWidth/2];
        [_rightdot setBackgroundColor:OrangeFontColor];
        [_rightdot addCornerRadiusWithFloat:DotWidth/2];

        
        [_leftLine setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
        [_rightLine setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _offset = 15.0;
        
        [self addSubview:_leftLine];
        [self addSubview:_leftdot];
        [self addSubview:_rightLine];
        [self addSubview:_rightdot];
        [self addSubview:_titleLabel];
    }
    
    return self;
}

- (void)setOffset:(CGFloat)offset{
    _offset = offset;
    [self layoutSubviews];
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
    [self layoutSubviews];
}

- (void)layoutSubviews{
    
    CGSize size = [_titleLabel.text sizeWithfont:[UIFont systemFontOfSize:16]];
    
    CGFloat lineWidth = (KMainWidth - size.width - 2*_offset)/2;
    
    [_leftLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(lineWidth);
        make.centerY.equalTo(self);
    }];
    
    [_leftdot mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftLine.mas_right).offset(-DotWidth/2);
        make.height.mas_equalTo(DotWidth);
        make.width.mas_equalTo(DotWidth);
        make.centerY.equalTo(self);
    }];
    
    [_rightLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(lineWidth);
        make.centerY.equalTo(self);
    }];
    
    [_rightdot mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_rightLine.mas_left).offset(DotWidth/2);
        make.height.mas_equalTo(DotWidth);
        make.width.mas_equalTo(DotWidth);
        make.centerY.equalTo(self);
    }];
    
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(size.width + 3);
        make.height.equalTo(self);
    }];
    
}

@end
