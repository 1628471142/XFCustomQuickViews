//
//  XFAutoScrollTableView.m
//  LanMeiWallet
//
//  Created by 展翅的小鸟 on 17/8/23.
//  Copyright © 2017年 com.hfuu. All rights reserved.
//

#import "XFAutoScrollTableView.h"
#import "XFAutoScrollTableViewCell.h"
@implementation XFAutoScrollTableView
{
    NSTimer         *_timer;
    
    NSInteger       _curRow;
}


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        _curRow = 0;
        _cellHeight = 0;

        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];

        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

    }
    
    return self;

}

- (CGFloat)cellHeight{
    
    if (_cellHeight == 0) {
        _cellHeight = 40.f;
    }
    return _cellHeight;
    
}

- (UIColor *)textColor{
    
    if (_textColor == nil) {
        _textColor = [UIColor darkGrayColor];
    }
    return _textColor;
    
}

- (void)autoScroll{

    NSIndexPath *nextPath = [NSIndexPath indexPathForRow:_curRow + 1 inSection:0];

    [self scrollToRowAtIndexPath:nextPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1000;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.rowHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    XFAutoScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XFAutoScrollTableViewCell"];
    if (cell == nil) {
        cell = [[XFAutoScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XFAutoScrollTableViewCell"];
        cell.titleLab.textColor = self.textColor;
    }
    
    _curRow = indexPath.row;
    
    NSArray *startPhone = @[@"135",@"136",@"137",@"138",@"139",@"147",@"150",@"151",@"158",@"187",@"180",@"155"];
    NSArray *amounts = @[@"1000",@"2000",@"3000"];
    NSString *phone = [NSString stringWithFormat:@"%@****%d%d%d%d在面包汽车成功借款%@元",startPhone[arc4random()%startPhone.count],arc4random()%9,arc4random()%9,arc4random()%9,arc4random()%9,amounts[arc4random()%2]];
    cell.titleLab.text = phone;
    
    return cell;

}


@end
