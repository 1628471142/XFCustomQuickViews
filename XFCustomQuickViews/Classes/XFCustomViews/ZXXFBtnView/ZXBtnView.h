//
//  ZXBtnView.h
//  LanmeiPublicTrust
//
//  Created by 秘银-XF on 2018/1/5.
//  Copyright © 2018年 秘银-XF. All rights reserved.
//

typedef void (^ZXEventBlock)(NSString *title);

#import <UIKit/UIKit.h>

@interface ZXBtnView : UIView

@property (nonatomic, strong) UIImageView   *imageView;

@property (nonatomic, strong) UILabel       *titleLab;

@property (nonatomic, strong) UILabel       *subTitleLab;

@property (nonatomic, strong) ZXEventBlock  eventBlock;


@end
