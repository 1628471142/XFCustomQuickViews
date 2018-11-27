//
//  UIView+AddCorneradius.m
//  weipai
//
//  Created by 李雪峰 on 15/12/30.
//  Copyright © 2015年 徐结兵. All rights reserved.
//

#import "UIView+AddCornerRadius.h"
#import "XFCustomHeader.h"

@implementation UIView (AddCornerRadius)
- (void)addCornerRadiusWithFloat:(float)i{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = i;
}

//添加外边框
- (void)addBorderWithFloat:(float)width andColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

//给cell底部添加自定义分割线
- (void)addSeparatorLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(8, self.bounds.size.height - 0.5, self.bounds.size.width - 16, 0.5)];
    [line setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
    [self addSubview:line];
}

//给左上右上添加圆角
- (void)addCornerRadiusToTopWithFloat:(float)i{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(i, i)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

//给左下右下添加圆角
- (void)addCornerRadiusToBottomWithFloat:(float)i{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(i, i)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

//给左上左下添加圆角
- (void)addCornerRadiusToLeftWithFloat:(float)i{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(i, i)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

//给右上右下添加圆角
- (void)addCornerRadiusToRightWithFloat:(float)i{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(i, i)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

//添加左分割线
- (void)addleftSeparatorLine{
    UIView *line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.mas_equalTo(0.5);
        make.height.equalTo(self);
        make.top.equalTo(self);
    }];
    [line setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1]];
}

- (void)addRightSeparatorLine{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width - 1, 3, 1, self.bounds.size.height - 6)];
    [line setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
    [self addSubview:line];
}

- (void)addSubViews:(NSArray <UIView *> *)views{
    for (int i = 0; i < views.count; i ++) {
        UIView *view = [views objectAtIndex:i];
        [self addSubview:view];
    }
}

-(UIViewController*)viewController
{
    UIResponder *nextResponder =  self;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}


- (UIViewController*)getCurrentViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}
@end
