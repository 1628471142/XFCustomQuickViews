//
//  XFTextView.m
//  student
//
//  Created by 李雪峰 on 16/2/20.
//  Copyright © 2016年 徐结兵. All rights reserved.
//

#import "XFTextView.h"

@implementation XFTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.textColor = self.placeholderColor;
        self.font = [UIFont systemFontOfSize:14];
        [self addObserver:self forKeyPath:@"placeholder" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"placeholderColor" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    }
    return self;
}

- (void)dealloc{
    
    [self removeObserver:self forKeyPath:@"placeholder"];
    [self removeObserver:self forKeyPath:@"placeholderColor"];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"placeholder"] || [keyPath isEqualToString:@"placeholderColor"]) {
        self.text = _placeholder;
        self.textColor = self.placeholderColor;
    }
}

- (UIColor *)placeholderColor{

    if (_placeholderColor == nil) {
        _placeholderColor = [UIColor lightGrayColor];
    }
    return _placeholderColor;
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([textView.text isEqualToString:_placeholder]) {
        _writed = NO;
    }else{
        _writed = YES;
    }
}

- (UIColor *)contentTextColor
{
    if (_contentTextColor == nil) {
        _contentTextColor = [UIColor blackColor];
    }
    return _contentTextColor;
}

#pragma textView协议方法
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if([self.text isEqualToString:_placeholder]){
        self.text = @"";
    }
    self.textColor = _contentTextColor;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if ([self.text isEqualToString:_placeholder] || [self.text isEqualToString:@""]) {
        _writed = NO;
        self.text = _placeholder;
        self.textColor = _placeholderColor;
    }
    return YES;
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    if ([self singleBlock]) {
        _singleBlock([NSString stringWithFormat:@"%@",textView.text]);
    }
}

@end
