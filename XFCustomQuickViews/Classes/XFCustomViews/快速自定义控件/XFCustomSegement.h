//
//  XFCustomSegement.h
//  笨象直播
//
//  Created by 李雪峰 on 16/8/18.
//  Copyright © 2016年 雪峰. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol XFCustomSegementDelegate <NSObject>

- (void)customSegementClickIndex:(NSInteger)index;

@end


@interface XFCustomSegement : UIView

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIColor *selectedbgColor;

@property (nonatomic, strong) UIColor *normalbgColor;

@property (nonatomic, strong) UIColor *selectedTitleColor;

@property (nonatomic, strong) UIColor *normalTitleColor;

@property (nonatomic, weak) id <XFCustomSegementDelegate> delegate;

@property (nonatomic, assign) NSInteger curIndex;

- (void)seletBtnWithIndex:(NSInteger)index;

- (void)configSubViewNoChangeIndex;
@end
