//
//  XFSignLabel.m
//  笨象直播
//
//  Created by 李雪峰 on 16/8/17.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFSignLabel.h"
#import "XFCustomHeader.h"

@implementation XFSignLabel


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _signView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, frame.size.height)];
        [_signView setBackgroundColor:self.themeColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_signView];
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(_signView);
            make.centerY.equalTo(_signView);
            make.left.equalTo(_signView.mas_right).offset(6);
        }];
        
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

- (UIColor *)themeColor{
    
    if (_themeColor == nil) {
        _themeColor = [UIColor redColor];
    }
    return _themeColor;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"text"]) {
        _titleLabel.text = _text;
    }
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"text"];
}

@end
