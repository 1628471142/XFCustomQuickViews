//
//  QBImageButton.m
//  LanMeiWallet
//
//  Created by 展翅的小鸟 on 17/6/10.
//  Copyright © 2017年 com.hfuu. All rights reserved.
//

#import "QBImageButton.h"

#define KnewButtonImageRation 0.3

@implementation QBImageButton


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){

        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width ;
    CGFloat imageH = contentRect.size.height * KnewButtonImageRation;
    return CGRectMake(0, (0.6-KnewButtonImageRation)*imageW*0.5, imageW, imageH);
    
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = (contentRect.size.height + 30) * KnewButtonImageRation ;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}


@end
