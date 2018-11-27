//
//  NSString+Extention.m
//  01-QQ聊天
//
//  Created by 武镇涛 on 15/4/12.
//  Copyright (c) 2015年 武镇涛. All rights reserved.
//

#import "NSString+Extention.h"
static NSString *base64_encode_data(NSData *data){
    data = [data base64EncodedDataWithOptions:0];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
}

static NSData *base64_decode(NSString *str){
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}

@implementation NSString (Extention)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesDeviceMetrics|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    
    
}
- (CGSize)sizeWithfont:(UIFont*)font MaxX:(CGFloat)maxx
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxx, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

- (CGSize)sizeWithfont:(UIFont*)font
{
    return [self sizeWithfont:font MaxX:FLT_MAX];
}

- (NSInteger)Filesize
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL dir;
    BOOL exist =  [mgr fileExistsAtPath:self isDirectory:&dir];
    if (exist == NO) return 0;
    if (dir) {//self是一个文件夹
        //找出文件夹中的文件名
        NSArray *subpaths = [mgr subpathsAtPath:self];
        //获得全路径
        NSInteger totalByteSize = 0;
        for (NSString *subpath in subpaths)
        {
            NSString *fullpath = [self stringByAppendingPathComponent:subpath];
            //遍历文件
            BOOL dir = NO;
            [mgr fileExistsAtPath:fullpath isDirectory:&dir];
            if (dir == NO) {
                totalByteSize +=[[mgr attributesOfItemAtPath:fullpath error:nil][NSFileSize]integerValue];
            }
        }
        return totalByteSize;
        
    }else
    {
        return [[mgr attributesOfItemAtPath:self error:nil][NSFileSize]integerValue];
    }
    
}


@end
