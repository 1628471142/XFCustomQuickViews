//
//  NSString+XFAttribute.h
//  追梦夺宝
//
//  Created by 李雪峰 on 16/7/20.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (XFAttribute)
- (NSMutableAttributedString *)attributedWithRange:(NSRange)range font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;

- (NSAttributedString *)attributedFormStr:(NSString *)startString endStr:(NSString *)endString font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;

/**
 *  包含修改开始和结束字符串
 *
 */
- (NSAttributedString *)attributedContainStr:(NSString *)startString endStr:(NSString *)endString font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;


//行间距
- (NSAttributedString *)changeLineSpaceWithSpace:(float)space;

//字间距
- (NSAttributedString *)changeWordSpaceWithSpace:(float)space;


//将jsonString转化成字典
- (NSDictionary *)dictionaryFromJsonString;


- (NSString *)dateStringFromTime;

- (NSString *)timeStringFromTime;

- (NSString *)ChinaDateStringFromTime;

+ (NSString *)getCurrentTime;

//获取时间差
- (NSString *)expireSpaceFromTime;

- (NSString *)completeDateStringFromTime;

- (NSString *)URLEncodedString;

- (NSString *)dateCompleteStringFromTime;

- (NSString *)subtimeStringFromTime;
@end
