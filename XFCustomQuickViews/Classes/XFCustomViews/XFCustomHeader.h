//
//  XFCustomHeader.h
//  BreadCarInstalments
//
//  Created by 秘银-XF on 2018/5/23.
//  Copyright © 2018年 秘银-XF. All rights reserved.
//

#ifndef XFCustomHeader_h
#define XFCustomHeader_h

#define LineColor [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]

#define AutoScaleWidth(a) a*MainWidth/375.0
#define AutoScaleHeight(a) a*MainHeight/568.0

#define MainWidth [UIScreen mainScreen].bounds.size.width

#define MainHeight [UIScreen mainScreen].bounds.size.height

#import <UIKit/UIKit.h>

#import "XFSegementView.h"

#import "XFTextAlertView.h"

#import "NumberSelectView.h"

#import "QBImageButton.h"

#import "XFNavigationViewController.h"

#import "WebViewController.h"

#import "XFScrollBtnView.h"

#import "Masonry.h"

#import "UIView+AddCornerRadius.h"

#import "NSString+XFAttribute.h"

#import "NSString+Extention.h"

#import "BXViewsHeader.h"

#import "BXEditInfoTableViewCell.h"

#import "XFAutoScrollTableView.h"

#endif /* XFCustomHeader_h */
