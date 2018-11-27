//
//  XFIntroduceView.m
//  笨象直播
//
//  Created by 李雪峰 on 16/8/20.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFIntroduceView.h"
#import "XFCustomHeader.h"
@implementation XFIntroduceView

- (instancetype)init{
    self = [super init];
    if (self) {
//        [self configSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _normalFrame = frame;
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews{
    
    _titleLabel = [[XFSignLabel alloc] initWithFrame:CGRectMake(5, 10, 100, 25)];
    _titleLabel.titleLabel.textColor = [UIColor colorWithRed:1 green:140/255.0 blue:5/255.0 alpha:1];
    [_titleLabel.signView setBackgroundColor:[UIColor orangeColor]];
    [self addSubview:_titleLabel];
    _contentLabel = [[UILabel alloc] init];
    [self addSubview:_contentLabel];
    _contentLabel.font = [UIFont systemFontOfSize:13];
    _contentLabel.numberOfLines = 0;
    [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-15);
        make.bottom.equalTo(self).offset(-10);
    }];
    
    _spreadBtn = [[UIButton alloc] init];
    [self addSubview:_spreadBtn];
    [_spreadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLabel);
        make.right.equalTo(_contentLabel);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(40);
    }];
    [_spreadBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 35, 0, -15)];
    [_spreadBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [_spreadBtn setTitle:@"展开" forState:UIControlStateNormal];
    [_spreadBtn setTitle:@"收起" forState:UIControlStateSelected];
    [_spreadBtn setImage:[UIImage imageNamed:@"展开"] forState:UIControlStateNormal];
    [_spreadBtn setImage:[UIImage imageNamed:@"收起"] forState:UIControlStateSelected];
    [_spreadBtn setTitleColor:self.themeColor forState:UIControlStateNormal];
    _spreadBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_spreadBtn addTarget:self action:@selector(spreadBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addObserver:self forKeyPath:@"content" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

}

- (UIColor *)themeColor{
    
    if (_themeColor == nil) {
        _themeColor = [UIColor redColor];
    }
    return _themeColor;
    
}

- (void)spreadBtnClick:(UIButton *)btn{
    
    if (!btn.selected) {
        
        CGSize size = [_content sizeWithfont:self.contentLabel.font MaxX:self.contentLabel.frame.size.width];
        
        self.curHeight = size.height + 60;

        
    }else{

        CGSize size = [_content sizeWithfont:self.contentLabel.font MaxX:self.contentLabel.frame.size.width];
        
        if (size.height < 60) {
            
            self.curHeight = size.height + 60;


        }else{

            self.curHeight = 110;

        }
        
    }
    
    if ([self spreadBlock]) {
        self.spreadBlock();
    }
    
    btn.selected = !btn.selected;
    
    CGRect frame = _normalFrame;
    frame.size.height = self.curHeight;
    [self setFrame:frame];
    
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"title"];
    [self removeObserver:self forKeyPath:@"content"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"title"]) {
        self.titleLabel.text = _title;
    }
    if ([keyPath isEqualToString:@"content"]) {
        
        self.contentLabel.text = _content;

        CGSize size = [_content sizeWithfont:self.contentLabel.font MaxX:MainWidth - 25];
        
        if (size.height < 60) {
            
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(size.height + 60);
            }];
            self.curHeight = size.height + 60;
        }else{
            self.curHeight = 110;
        }


    }
}
@end
