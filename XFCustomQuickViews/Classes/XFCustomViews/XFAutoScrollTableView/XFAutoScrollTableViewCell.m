//
//  XFAutoScrollTableViewCell.m
//  LanMeiWallet
//
//  Created by 展翅的小鸟 on 17/8/23.
//  Copyright © 2017年 com.hfuu. All rights reserved.
//

#import "XFAutoScrollTableViewCell.h"

@implementation XFAutoScrollTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLab = [[UILabel alloc] init];
        [self addSubview:_titleLab];
        self.titleLab.font = [UIFont systemFontOfSize:14];
        self.titleLab.textColor = [UIColor grayColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.titleLab setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
    }
    return self;
    
}

@end
