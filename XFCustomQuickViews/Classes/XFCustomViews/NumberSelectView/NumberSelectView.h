//
//  NumberSelectView.h
//  student
//
//  Created by 李雪峰 on 16/7/8.
//  Copyright © 2016年 徐结兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberSelectView : UIView

@property ( nonatomic, strong) UIButton *reduceBtn;

@property ( nonatomic, strong) UIButton *addBtn;

@property ( nonatomic, strong) UITextField *numberTextField;

@property ( nonatomic, assign) NSInteger maxCount;

@property ( nonatomic, assign) NSInteger minCount;

@end
