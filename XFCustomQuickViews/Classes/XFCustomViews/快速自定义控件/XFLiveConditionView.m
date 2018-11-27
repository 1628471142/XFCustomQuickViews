//
//  XFLiveConditionView.m
//  笨象直播
//
//  Created by 李雪峰 on 16/8/30.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "XFLiveConditionView.h"
#import "XFCustomHeader.h"

@implementation XFLiveConditionView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self.alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-100);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(260);
            make.height.mas_equalTo(150);
        }];
        
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.left.equalTo(self.alertView).offset(10);
            make.right.equalTo(self.alertView).offset(-10);
            make.height.mas_equalTo(30);
        }];
        [self.textField addCornerRadiusWithFloat:10];

        [self.cancleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.alertView.mas_bottom).offset(0.5);
            make.left.equalTo(self.alertView).offset(-0.5);
            make.width.mas_equalTo(130.5);
            make.height.mas_equalTo(35);
        }];
        self.cancleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.cancleBtn addBorderWithFloat:0.5 andColor:[UIColor lightGrayColor]];
        [self.cancleBtn addCornerRadiusWithFloat:0.0];

        
        [self.commitBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.alertView.mas_bottom).offset(0.5);
            make.right.equalTo(self.alertView).offset(0.5);
            make.width.mas_equalTo(131);
            make.height.mas_equalTo(35);
        }];
        self.commitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.commitBtn addBorderWithFloat:0.5 andColor:[UIColor lightGrayColor]];
        [self.commitBtn addCornerRadiusWithFloat:0.0];

        
        _detailLabel = [[UILabel alloc] init];
        [self.alertView addSubview:_detailLabel];
        _detailLabel.textColor = [UIColor grayColor];
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.mas_bottom);
            make.height.mas_equalTo(30);
            make.right.equalTo(self.alertView);
            make.left.equalTo(self.alertView);
        }];
        
        
    }
    return self;
}

@end
