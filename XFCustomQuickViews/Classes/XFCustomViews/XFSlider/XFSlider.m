//
//  XFSlider.m
//  LanMeiWallet
//
//  Created by 展翅的小鸟 on 17/4/14.
//  Copyright © 2017年 com.hfuu. All rights reserved.
//

#import "XFSlider.h"
#import <math.h>
@implementation XFSlider


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addTarget:self action:@selector(valueChangeEvent) forControlEvents:UIControlEventTouchUpInside];
        
        [self setThumbImage:[UIImage imageNamed:@"拖动按钮"] forState:UIControlStateNormal];
        _stepLength = 1;
        
    }
    return self;
}

- (void)setStepLength:(NSInteger)stepLength{

    _stepLength = stepLength;
    
    if (stepLength == 500) {
        
        _showDot = YES;
        
    }
    
}


//注意self.value若maximumValue不等于0，那么在起始点，self.value的值也不为0
- (void)valueChangeEvent{
    NSLog(@"self.value = %.2f",self.value);
 
    NSInteger value = rint(self.value*_countNumber);
    
    NSLog(@"value0 = %ld",value);

    //判断是否符合步长
    if (value%_stepLength != 0) {
//        NSLog(@"value%%_stepLength = %ld",value%_stepLength);

        if (value%_stepLength >= _stepLength/2) {
//            NSLog(@"大于");
            
            value = (value/_stepLength + 1)*_stepLength;
            float rate = value/1.0/_countNumber;    //转为float型
//            NSLog(@"rate = %.2f",rate);
            [self setValue:rate animated:YES];
            if ([self block]) {
                self.block(rate);
            }
        }else{
//            NSLog(@"小于");

            value = (value/_stepLength)*_stepLength;
            float rate = value/1.0/_countNumber;
            
//            NSLog(@"rate = %.2f",rate);

            [self setValue:rate animated:YES];
            
            if ([self block]) {
                self.block(rate);
            }
        }
        
        
    }
    
}



-(CGRect)trackRectForBounds:(CGRect)bounds{   
    
    CGFloat height = 5;
    CGFloat offsetY = (bounds.size.height - height)/2;
    
    return CGRectMake(0, offsetY, bounds.size.width, height);
}

@end
