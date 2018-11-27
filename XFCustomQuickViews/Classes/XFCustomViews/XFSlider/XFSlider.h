//
//  XFSlider.h
//  LanMeiWallet
//
//  Created by 展翅的小鸟 on 17/4/14.
//  Copyright © 2017年 com.hfuu. All rights reserved.
//

typedef void (^SliderValueChangedBlock)(float rate);

#import <UIKit/UIKit.h>

@interface XFSlider : UISlider

@property (nonatomic, assign) NSInteger stepLength;

@property (nonatomic, assign) NSInteger countNumber;

@property (nonatomic, assign) float     maxNumber;

@property (nonatomic, strong) SliderValueChangedBlock block;

@property (nonatomic, assign) BOOL      showDot;//是否显示断点

@end
