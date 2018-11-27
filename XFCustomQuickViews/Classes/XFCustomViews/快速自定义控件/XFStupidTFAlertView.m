//
//  XFStupidTFAlertView.m
//  笨象直播
//
//  Created by 李雪峰 on 16/8/25.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFStupidTFAlertView.h"
#import "XFCustomHeader.h"

@implementation XFStupidTFAlertView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, MainWidth, MainHeight)];
        
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        
        [self addSubview:_bgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleBtnClick)];
        tap.numberOfTapsRequired = 1;
        _bgView.userInteractionEnabled = YES;
        [_bgView addGestureRecognizer:tap];
        
        [UIView animateWithDuration:0.4 animations:^{
            self.hidden = NO;
            [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
        } completion:^(BOOL finished) {
            
        }];
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleBtnClick)];
//        tap.numberOfTapsRequired = 1;
//        self.userInteractionEnabled = YES;
//        [self addGestureRecognizer:tap];
        
        _alertView = [[UIView alloc] init];
        [_alertView setBackgroundColor:[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]];
        [self addSubview:_alertView];
        [_alertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-100);
            make.width.mas_equalTo(260);
            make.height.mas_equalTo(170);
        }];
        [_alertView addCornerRadiusWithFloat:5];
        
        _titleLabel = [[UILabel alloc] init];
        _textField = [[UITextField alloc] init];
        _commitBtn = [[UIButton alloc] init];
        _cancleBtn = [[UIButton alloc] init];

        [_alertView addSubViews:@[_titleLabel,_textField,_commitBtn,_cancleBtn]];

        _titleLabel.text = @"编辑微信号";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor darkGrayColor];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_alertView);
            make.left.equalTo(_alertView).offset(10);
            make.right.equalTo(_alertView).offset(-10);
            make.height.mas_equalTo(50);
        }];
        
        [_textField addBorderWithFloat:0.5 andColor:BorderColor];
        [_textField addCornerRadiusWithFloat:3];
        _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.textColor = [UIColor darkGrayColor];
        [_textField setBackgroundColor:[UIColor whiteColor]];
        [_textField becomeFirstResponder];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom);
            make.left.equalTo(_alertView).offset(10);
            make.right.equalTo(_alertView).offset(-10);
            make.height.mas_equalTo(40);
        }];
        
        CGFloat btnWidth = 110;
        [_commitBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_commitBtn setTitle:@"确定" forState:UIControlStateNormal];

        [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textField.mas_bottom).offset(20);
            make.right.equalTo(_alertView).offset(-10);
            make.width.mas_equalTo(btnWidth);
            make.height.mas_equalTo(35);
        }];
        [_commitBtn addBorderWithFloat:0.5 andColor:BorderColor];
        [_commitBtn addCornerRadiusWithFloat:2.5];
        
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textField.mas_bottom).offset(20);
            make.left.equalTo(_alertView).offset(10);
            make.width.mas_equalTo(btnWidth);
            make.height.mas_equalTo(35);
        }];
        [_cancleBtn addBorderWithFloat:0.5 andColor:BorderColor];
        [_cancleBtn addCornerRadiusWithFloat:2.5];
        
        [_commitBtn addTarget:self action:@selector(commintBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addObserver:self forKeyPath:@"placeholder" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"placeholder"]) {
        _textField.placeholder = _placeholder;
    }
    if ([keyPath isEqualToString:@"title"]) {
        _titleLabel.text = _title;
    }
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"title"];
    [self removeObserver:self forKeyPath:@"placeholder"];
}

- (void)commintBtnClick{
    if (_commitBlock && _textField.text.length > 0) {
        _commitBlock(_textField.text);
    }else if (_textField.text.length == 0 && _commitBlock){
        _commitBlock(@"");
    }
    [self hideAllViewWithAnimate];
}

- (void)hideAllViewWithAnimate{
    [UIView animateWithDuration:0.4 animations:^{
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
        CGRect frame = _alertView.frame;
        frame.origin.y = - frame.size.height;
        [_alertView setFrame:frame];
        [self endEditing:YES];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)cancleBtnClick{
    self.textField.text = @"";
    [self hideAllViewWithAnimate];
}

@end
