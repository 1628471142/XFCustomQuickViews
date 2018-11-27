//
//  ZXBtnView.m
//  LanmeiPublicTrust
//
//  Created by 秘银-XF on 2018/1/5.
//  Copyright © 2018年 秘银-XF. All rights reserved.
//

#import "ZXBtnView.h"
#import "XFCustomHeader.h"

@implementation ZXBtnView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addOwnViews];
        [self relayoutSubViewsFrame];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
    
}

- (void)tapEvent{
    
    if ([self eventBlock]) {
        self.eventBlock(_titleLab.text);
    }
    
}


- (void)addOwnViews{
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
    
    _titleLab = [[UILabel alloc] init];
    _titleLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:_titleLab];
    
    _subTitleLab = [[UILabel alloc] init];
    _subTitleLab.textColor = [UIColor grayColor];
    _subTitleLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:_subTitleLab];
    
}

- (void)relayoutSubViewsFrame{
    
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(self.bounds.size.width/8);
    }];
    
    [_titleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(self.bounds.size.width);
        make.top.equalTo(_imageView).offset(-10);
        make.left.equalTo(_imageView.mas_right).offset(8);
    }];
    
    [_subTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(self.bounds.size.width);
        make.bottom.equalTo(_imageView).offset(10);
        make.left.equalTo(_imageView.mas_right).offset(8);
    }];
    
}

@end
