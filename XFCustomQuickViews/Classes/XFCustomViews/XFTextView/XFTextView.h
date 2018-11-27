//
//  XFTextView.h
//  student
//
//  Created by 李雪峰 on 16/2/20.
//  Copyright © 2016年 徐结兵. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void (^BXSinglePickerBlock)(NSString* pickStr);


@interface XFTextView : UITextView<UITextViewDelegate>

@property ( nonatomic, strong) NSString *placeholder;

@property ( nonatomic, assign) BOOL writed;

@property ( nonatomic, strong) UIColor *contentTextColor;

@property (nonatomic, strong) BXSinglePickerBlock singleBlock;

@property (nonatomic, strong) UIColor *placeholderColor;


@end
