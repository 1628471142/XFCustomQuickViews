//
//  UIView+AddCorneradius.h
//  weipai
//
//  Created by 李雪峰 on 15/12/30.
//  Copyright © 2015年 徐结兵. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (AddCornerRadius)
- (void)addCornerRadiusWithFloat:(float)i;
- (void)addBorderWithFloat:(float)width andColor:(UIColor *)color;
- (void)addSeparatorLine;
//给左上添加圆角
- (void)addCornerRadiusToTopWithFloat:(float)i;

- (void)addCornerRadiusToBottomWithFloat:(float)i;

- (void)addleftSeparatorLine;

- (void)addCornerRadiusToLeftWithFloat:(float)i;

- (void)addRightSeparatorLine;

- (void)addCornerRadiusToRightWithFloat:(float)i;

- (void)addSubViews:(NSArray <UIView *> *)views;

- (UIViewController*)viewController;

- (UIViewController*)getCurrentViewController;//获取当前最前端控制器

@end
