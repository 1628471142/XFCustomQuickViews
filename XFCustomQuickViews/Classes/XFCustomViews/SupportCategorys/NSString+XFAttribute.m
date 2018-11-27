//
//  NSString+XFAttribute.m
//  追梦夺宝
//
//  Created by 李雪峰 on 16/7/20.
//  Copyright © 2016年 雪峰. All rights reserved.
//

#import "NSString+XFAttribute.h"

@implementation NSString (XFAttribute)

- (NSMutableAttributedString *)attributedWithRange:(NSRange)range font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    if (bgColor == nil) {
        bgColor = [UIColor clearColor];
    }
    
    NSDictionary *dic = @{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor,NSBackgroundColorAttributeName:bgColor};
    
    [attributedStr setAttributes:dic range:range];
    
    return attributedStr;
}

- (NSAttributedString *)attributedFormStr:(NSString *)startString endStr:(NSString *)endString font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor{
    NSInteger location1 = [self rangeOfString:startString].location + [self rangeOfString:startString].length;
    
    NSInteger location2 = [self rangeOfString:endString].location;
    
    NSRange range = NSMakeRange(location1, location2 - location1);
    
    if (bgColor == nil) {
        bgColor = [UIColor clearColor];
    }
    NSMutableAttributedString *attributedStr = [self attributedWithRange:range font:font textColor:textColor bgColor:bgColor];
    
    return attributedStr;
}

- (NSAttributedString *)attributedContainStr:(NSString *)startString endStr:(NSString *)endString font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor{
    NSInteger location1 = [self rangeOfString:startString].location;
    
    NSInteger location2 = [self rangeOfString:endString].location + [self rangeOfString:endString].length;
    
    NSRange range = NSMakeRange(location1, location2 - location1);
    
    if (bgColor == nil) {
        bgColor = [UIColor clearColor];
    }
    NSMutableAttributedString *attributedStr = [self attributedWithRange:range font:font textColor:textColor bgColor:bgColor];
    
    return attributedStr;
}

- (NSDictionary *)dictionaryFromJsonString{
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dic;
    
}

//行间距
- (NSAttributedString *)changeLineSpaceWithSpace:(float)space {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle};
    
    [attributedString setAttributes:dic range:NSMakeRange(0, [self length])];
    
    return attributedString;
    
}

//字间距
- (NSAttributedString *)changeWordSpaceWithSpace:(float)space {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    
    return attributedString;
    
}


//获取时间
- (NSString *)timeStringFromTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

- (NSString *)subtimeStringFromTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

- (NSString *)dateStringFromTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

- (NSString *)dateCompleteStringFromTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

- (NSString *)ChinaDateStringFromTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月dd日"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}


+ (NSString *)getCurrentTime{
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *DateTime = [formatter stringFromDate:date];
    return DateTime;
    
}

- (NSString *)completeDateStringFromTime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}



//获取时间差
- (NSString *)expireSpaceFromTime{
    
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *nowDate = [NSDate date];
    
    // 截止时间data格式
    NSDate *expireDate = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:nowDate toDate:expireDate options:0];
    
    return [NSString stringWithFormat:@"%ld",dateCom.day];
}


- (NSString *)URLEncodedString
{
#if __has_feature(objc_arc)
    NSString *result = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                    (__bridge CFStringRef)self,
                                                                                    NULL,
                                                                                    CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                    kCFStringEncodingUTF8);
#else
    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)str,
                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8);
#endif
    return result;
}
@end
