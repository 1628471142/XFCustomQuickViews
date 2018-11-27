//
//  NumberSelectView.m
//  student
//
//  Created by 李雪峰 on 16/7/8.
//  Copyright © 2016年 徐结兵. All rights reserved.
//

#import "NumberSelectView.h"
#import "XFCustomHeader.h"

@implementation NumberSelectView


- (void)drawRect:(CGRect)rect {
    // Drawing code
}



- (instancetype)init{
    self = [super init];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews{
    _maxCount = 1;
    _minCount = 1;
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addCornerRadiusWithFloat:4];
    _reduceBtn = [[UIButton alloc] init];
    [_reduceBtn setTitle:@"-" forState:UIControlStateNormal];
    _reduceBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_reduceBtn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    [_reduceBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_reduceBtn addTarget:self action:@selector(reduceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _addBtn = [[UIButton alloc] init];
    [_addBtn setTitle:@"+" forState:UIControlStateNormal];
    _addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_addBtn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    [_addBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _numberTextField = [[UITextField alloc] init];
    _numberTextField.text = @"1";
    _numberTextField.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_numberTextField];
    [self addSubview:_reduceBtn];
    [self addSubview:_addBtn];
    [_reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_reduceBtn.mas_right);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(_addBtn.mas_left);
    }];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)addBtnClick{
    if (_numberTextField.text.integerValue >= _maxCount) {
        _numberTextField.text = [NSString stringWithFormat:@"%d",_maxCount];
        return;
    }
    NSInteger number = _numberTextField.text.integerValue;
    number ++;
    _numberTextField.text = [NSString stringWithFormat:@"%d",number];
    
}

- (void)reduceBtnClick{
    if (_numberTextField.text.integerValue <= _minCount) {
        _numberTextField.text = [NSString stringWithFormat:@"%d",_minCount];
        return;
    }
    NSInteger number = _numberTextField.text.integerValue;
    number --;
    _numberTextField.text = [NSString stringWithFormat:@"%d",number];
}

@end
