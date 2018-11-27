//
//  BXShadowLabel.m
//  笨象直播
//
//  Created by 展翅的小鸟 on 17/2/24.
//  Copyright © 2017年 雪峰. All rights reserved.
//

#import "BXShadowLabel.h"

@implementation BXShadowLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (void)drawTextInRect:(CGRect)rect {
//    
//    CGSize shadowOffset = self.shadowOffset;
//    UIColor *textColor = self.textColor;
//    
//    CGContextRef c = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(c, 0.5);
//    CGContextSetLineJoin(c, kCGLineJoinRound);
//    
//    CGContextSetTextDrawingMode(c, kCGTextStroke);
//    self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
//    [super drawTextInRect:rect];
//    
//    CGContextSetTextDrawingMode(c, kCGTextFill);
//    self.textColor = textColor;
//    self.shadowOffset = CGSizeMake(0, 0);
//    [super drawTextInRect:rect];
//    
//    self.shadowOffset = shadowOffset;
//    
//}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        
        self.layer.shadowOffset = CGSizeMake(1,1);
        
        self.layer.shadowOpacity = 0.6;
        
        self.layer.shadowRadius = 1.0;
        
        self.clipsToBounds = NO;
    }
    return self;
}

@end
