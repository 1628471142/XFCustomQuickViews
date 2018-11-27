//
//  XFTextAlertView.m
//  追梦夺宝
//
//  Created by 李雪峰 on 16/7/15.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFTextAlertView.h"
#import "XFCustomHeader.h"

@implementation XFTextAlertView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, MainWidth, MainHeight)];
        [UIView animateWithDuration:0.8 animations:^{
            self.hidden = NO;
            [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
        } completion:^(BOOL finished) {
            
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleBtnClick)];
        tap.numberOfTapsRequired = 1;
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
        
        _alertView = [[UIView alloc] init];
        [_alertView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_alertView];
        [_alertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.mas_equalTo(self.frame.size.width - 20);
            make.height.mas_equalTo(180);
        }];
        [_alertView addCornerRadiusWithFloat:5];
        
        _titleLabel = [[UILabel alloc] init];
        _textField = [[UITextField alloc] init];
        _commitBtn = [[UIButton alloc] init];
        _cancleBtn = [[UIButton alloc] init];
        UIView *headbgView = [[UIView alloc] init];
        [_alertView addSubViews:@[headbgView,_titleLabel,_textField,_commitBtn,_cancleBtn]];
        
        [headbgView setBackgroundColor:LineColor];
        [headbgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_alertView);
            make.left.equalTo(_alertView);
            make.right.equalTo(_alertView);
            make.height.mas_equalTo(40);
        }];
        
        _titleLabel.text = @"请填写充值金额";
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_alertView);
            make.left.equalTo(_alertView).offset(10);
            make.right.equalTo(_alertView).offset(10);
            make.height.mas_equalTo(40);
        }];
        
        [_textField addBorderWithFloat:1 andColor:BorderColor];
        _textField.keyboardType = UIKeyboardTypeDecimalPad;
        _textField.textAlignment = NSTextAlignmentCenter;
        [_textField becomeFirstResponder];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(20);
            make.left.equalTo(_alertView).offset(10);
            make.right.equalTo(_alertView).offset(-10);
            make.height.mas_equalTo(40);
        }];
        
        CGFloat btnWidth = (self.frame.size.width - 60)/2;
        [_commitBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_commitBtn setBackgroundColor:[UIColor redColor]];
        [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textField.mas_bottom).offset(30);
            make.left.equalTo(_alertView).offset(10);
            make.width.mas_equalTo(btnWidth);
            make.height.mas_equalTo(40);
        }];

        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textField.mas_bottom).offset(30);
            make.right.equalTo(_alertView).offset(-10);
            make.width.mas_equalTo(btnWidth);
            make.height.mas_equalTo(40);
        }];

        
        [_commitBtn addTarget:self action:@selector(commintBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    }
    return self;
}

- (void)commintBtnClick{
    if (_commitBlock && _textField.text.length > 0) {
        _commitBlock(_textField.text);
    }else if (_textField.text.length == 0 && _commitBlock){
        _commitBlock(@"0");
    }
    [self hideAllViewWithAnimate];
}

- (void)hideAllViewWithAnimate{
//    [UIView animateWithDuration:0.8 animations:^{
//        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
//    } completion:^(BOOL finished) {
//        self.hidden = YES;
//    }];
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.01];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
    //你的动作，比如删除某个东西
    [self removeFromSuperview];
    [UIView commitAnimations];

}

- (void)cancleBtnClick{
    self.textField.text = @"0";
    [self hideAllViewWithAnimate];
}

@end
