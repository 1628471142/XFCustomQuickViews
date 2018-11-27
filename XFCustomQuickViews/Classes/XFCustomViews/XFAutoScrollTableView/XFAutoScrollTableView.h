//
//  XFAutoScrollTableView.h
//  LanMeiWallet
//
//  Created by 展翅的小鸟 on 17/8/23.
//  Copyright © 2017年 com.hfuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFAutoScrollTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) UIColor *textColor;

@end
