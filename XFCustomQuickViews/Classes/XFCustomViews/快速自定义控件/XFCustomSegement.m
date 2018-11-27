//
//  XFCustomSegement.m
//  笨象直播
//
//  Created by 李雪峰 on 16/8/18.
//  Copyright © 2016年 雪峰. All rights reserved.
//
#define BtnTag 3432
#import "XFCustomSegement.h"
#import "UIView+AddCornerRadius.h"

@implementation XFCustomSegement

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self addObserver:self forKeyPath:@"titles" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"normalTitleColor" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

        [self addObserver:self forKeyPath:@"selectedTitleColor" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

        [self addBorderWithFloat:1 andColor:[UIColor whiteColor]];
        [self addCornerRadiusWithFloat:5];
        
    }
    return self;
}

- (UIColor *)selectedbgColor{
    if (_selectedbgColor == nil) {
        _selectedbgColor = [UIColor whiteColor];
    }
    return _selectedbgColor;
}


- (UIColor *)normalbgColor{
    if (_normalbgColor == nil) {
        _normalbgColor = [UIColor colorWithRed:48/255.0 green:48/255.0 blue:48/255.0 alpha:1];
    }
    return _normalbgColor;
}

- (UIColor *)selectedTitleColor{
    if (_selectedTitleColor == nil) {
        _selectedTitleColor = [UIColor darkGrayColor];
    }
    return _selectedTitleColor;
}

- (UIColor *)normalTitleColor{
    if (_normalTitleColor == nil) {
        _normalTitleColor = [UIColor whiteColor];
    }
    return _normalTitleColor;
}


- (void)dealloc{
    [self removeObserver:self forKeyPath:@"titles"];
    [self removeObserver:self forKeyPath:@"normalTitleColor"];
    [self removeObserver:self forKeyPath:@"selectedTitleColor"];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"titles"]) {
        [self configSubViewNoChangeIndex];
    }
    
    if ([keyPath isEqualToString:@"selectedTitleColor"]) {
        [self configSubViewNoChangeIndex];
    }
    
    if ([keyPath isEqualToString:@"normalTitleColor"]) {
        [self configSubViewNoChangeIndex];
    }
}

- (void)configSubView{
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat btnWidth = self.bounds.size.width/_titles.count;
    CGFloat btnHeight = self.bounds.size.height;
    for (int i = 0; i < _titles.count; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnWidth * i, 0, btnWidth, btnHeight)];
        btn.tag = i + BtnTag;
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitleColor:self.selectedTitleColor forState:UIControlStateDisabled];
        [btn setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:btn];
        
    }
    [self seletBtnWithIndex:0];
}



- (void)seletBtnWithIndex:(NSInteger)index{
    _curIndex = index;
    [self btnClick:[self viewWithTag:index + BtnTag]];
}

- (void)btnClick:(UIButton *)curBtn{
    curBtn.enabled = NO;
    [curBtn setBackgroundColor:self.selectedbgColor];
    for (int i = 0; i < _titles.count; i ++) {
        UIButton *btn = [self viewWithTag:i + BtnTag];
        if (![btn isEqual:curBtn]) {
            btn.enabled = YES;
            [btn setBackgroundColor:self.normalbgColor];
        }
    }
    
    
    if ([self.delegate respondsToSelector:@selector(customSegementClickIndex:)]) {
        _curIndex = curBtn.tag - BtnTag;
        [self.delegate customSegementClickIndex:curBtn.tag - BtnTag];
    }
}

- (void)configSubViewNoChangeIndex{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    CGFloat btnWidth = self.bounds.size.width/_titles.count;
    CGFloat btnHeight = self.bounds.size.height;
    for (int i = 0; i < _titles.count; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnWidth * i, 0, btnWidth, btnHeight)];
        btn.tag = i + BtnTag;
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitleColor:self.selectedTitleColor forState:UIControlStateDisabled];
        [btn setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:btn];
        
    }
    [self seletBtnWithIndex:_curIndex];

}
@end
