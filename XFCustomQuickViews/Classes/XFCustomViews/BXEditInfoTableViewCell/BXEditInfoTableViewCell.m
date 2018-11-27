//
//  BXEditInfoTableViewCell.m
//  笨象直播
//
//  Created by 展翅的小鸟 on 16/12/14.
//  Copyright © 2016年 雪峰. All rights reserved.
//
#import "XFCustomHeader.h"
#import "BXEditInfoTableViewCell.h"
@implementation BXEditInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _type = BXNormalTextInput;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

- (void)drawRect:(CGRect)rect{
    if (!_hasNoLine) {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGFloat lengths[] = {2,2};
//        CGContextSetLineDash(context, 0, lengths, 1);
//        CGContextMoveToPoint(context, 0.0, rect.size.height - 1);
//        CGContextSetRGBStrokeColor(context, 0.3, 0.3, 0.3, 0.7);  //线的颜色
//        CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 1);
//        CGContextStrokePath(context);
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _textField = [[UITextField alloc] init];
        _textField.textColor = [UIColor darkGrayColor];
        _textField.font = [UIFont systemFontOfSize:16];
        _textField.delegate = self;
        _textFieldBtn = [[UIButton alloc] init];
        _textFieldBtn.hidden = YES;
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_textField];
        [self.contentView addSubview:_textFieldBtn];
        
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.width.mas_equalTo(72);
            make.left.equalTo(self).offset(15);
            make.height.equalTo(self).offset(-10);
        }];
        
        [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self);
            make.left.equalTo(_titleLabel.mas_right).offset(24);
            make.height.equalTo(self).offset(-10);
        }];
        
        [_textFieldBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_textField);
            make.centerY.equalTo(_textField);
            make.left.equalTo(_textField);
            make.height.equalTo(_textField);
        }];
        
        
        _type = BXNormalTextInput;
        
        //日期选择基础数据
        _yearLeast = 1900;
        _yearSum   = 200;
        
        _year  = [NSCalendar currentYear];
        _month = [NSCalendar currentMonth];
        _day   = [NSCalendar currentDay];
        
        [_textFieldBtn addTarget:self action:@selector(textFieldClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;

}

- (void)selectedOk{
    
    [_pickerView remove];
    
    if (self.selectedText) {
        
        _textField.text = self.selectedText;
        
    }else{
        
        _textField.text = _titles[0];
        
    }
    
    if ([self.textChangedDelegate respondsToSelector:@selector(changedText:withIndexPath:)]) {
        [self.textChangedDelegate changedText:_textField.text withIndexPath:_indexPath];
    }
    
    [_bgView removeFromSuperview];
    
}

- (void)bgViewTap:(UITapGestureRecognizer *)tap{

    [_bgView removeFromSuperview];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    

}


- (void)setType:(BXEditCellType)type{

    _type = type;

    if (type == QBRelationshipChooseInput) {
        
        self.pickerTitle = @"请选择联系人关系";

    }
    if (type == QBIncomeChooseInput) {
        
        self.pickerTitle = @"请选择收入范围";
        
    }
    if (type == QBMarryChooseInput) {
        
        self.pickerTitle = @"请选择婚姻状况";
        
    }
    if (type == QBStayTimeChooseInput) {
        
        self.pickerTitle = @"请选择居住时长";
        
    }
    if (type == QBWorkTimeChooseInput) {
        
        self.pickerTitle = @"请选择入职时间";
        
    }
    if (type == QBWaitRequest) {
        
        self.pickerTitle = @"请选择";
        
    }
    if (type == QBApplyNumberChooseInput) {
        
        self.pickerTitle = @"请选择申请额度";
        
    }
    if (type == QBLoanPurposeChooseInput) {
        
        self.pickerTitle = @"请选择借款目的";
        
    }
    
    if (type == QBEducationChooseInput) {
        
        self.pickerTitle = @"请选择最高学历";
        
    }
    
    if (type == QBLivingChooseInput) {
        
        self.pickerTitle = @"请选择住房类型";
        
    }
    
    if (type == ZXBorrowDays) {
        
        self.pickerTitle = @"请选择借款天数";
        
    }
    
    if (type == ZXBorrowTimes) {
        
        self.pickerTitle = @"请选择借款期数";
        
    }
    
    if (_type == BXNormalTextInput) {
        _textFieldBtn.hidden = YES;
    }else{
        _textFieldBtn.hidden = NO;
    }

}


- (void)showPicker{

    STPickerView *pickerView = [[STPickerView alloc] init];
    _pickerView = pickerView;
    _pickerView.pickerView.dataSource = self;
    _pickerView.pickerView.delegate = self;
    [_pickerView.buttonRight addTarget:self action:@selector(selectedOk)];
    
    if (_type == BXNormalTextInput) {
        
        
        
    }else if (_type == BXTimeChooseInput){
        
        _pickerView.title = [NSString stringWithFormat:@"请选择%@",[_title substringToIndex:_title.length - 1]];
        [_pickerView show];
        
        [self.pickerView.pickerView selectRow:(_year - _yearLeast) inComponent:0 animated:NO];
        [self.pickerView.pickerView selectRow:(_month - 1) inComponent:1 animated:NO];
        [self.pickerView.pickerView selectRow:(_day - 1) inComponent:2 animated:NO];
        self.selectedText = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)self.year,(long)self.month,(long)self.day];
        
        
    }else{
        
        //年龄段选择
        if (_type == BXAgeLevelInput) {
            
            _titles = @[@"儿童",@"少年",@"青年",@"中年",@"老年"];
            
        }
        
        //电影类型选择
        if (_type == BXMovieTypeInput) {
            
            //            _titles = @[@"院线电影",@"电视剧",@"网络电视剧",@"电视电影",@"网络大电影",@"综艺节目",@"其他"];
            
            _titles = @[@"韵达快递",@"天天快递",@"中通快递",@"申通快递",@"圆通快递",@"全峰快递",@"EMS快递",@"顺丰快递",@"汇通快递",@"京东快递",@"国通快递",@"其他"];
            
        }
        
        //角色选择
        if (_type == BXRoleTypeInput) {
            
            _titles = @[@"主演",@"主配",@"次配",@"特约",@"特型",@"跟组",@"群演",@"重要角色",@"其他"];
            
        }
        
        //年份选择
        if (_type == BXYearChooseInput) {
            
            _titles = @[@"1990",@"1991",@"1992",@"1993",@"1994",@"1995",@"1996",@"1997",@"1998",@"1999",@"2000",@"2001",@"2002",@"2003",@"2004",@"2005",@"2006",@"2007",@"2008",@"2009",@"2010",@"2011",@"2012",@"2013",@"2014",@"2015",@"2016",@"2017"];
            
        }
        //性别选择
        if (_type == BXSexChooseInput) {
            
            _titles = @[@"男",@"女"];
            
        }
        //角色标签选择
        if (_type == BXRoleSignInput) {
            
            _titles = @[@"网红",@"反派",@"痞气",@"正太萝莉",@"中性",@"谐星",@"胖妞/胖仔",@"丑咖",@"前卫个性",@"朴实",@"外籍艺人",@"优雅端庄",@"御姐",@"干练知性",@"性感妩媚",@"硬汉",@"帅气型男",@"忧郁深邃",@"霸道总裁",@"小鲜肉",@"特型演员",@"成熟稳重",@"青春阳光",@"其他"];
            
        }
        
        //星座选择
        if (_type == BXStarChooseInput) {
            
            _titles = @[@"水瓶座",@"双鱼座",@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座"];
            
        }
        //题材选择
        if (_type == BXThemeChooseInput) {
            
            _titles = @[@"现代",@"年代",@"古装"];
            
        }
        
        self.selectedText = _titles[0];
        
        _pickerView.title = [NSString stringWithFormat:@"%@",self.pickerTitle];
//        [[self viewController].view endEditing:YES];
        [_pickerView show];
        
        
    }
    
}


- (void)textFieldClick{

    [self showPicker];

}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    NSLog(@"%@",self.reuseIdentifier);
    if (_type != BXNormalTextInput) {
        return NO;
    }else{
        return YES;
    }

}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.textChangedDelegate respondsToSelector:@selector(changedText:withIndexPath:)]) {
        [self.textChangedDelegate changedText:[NSString stringWithFormat:@"%@",textField.text] withIndexPath:_indexPath];
    }
}


- (void)setTitle:(NSString *)title{
    
    _title = title;
    
    if ([title containsString:@"（必填）"]) {
        
        NSAttributedString *attributeString = [title attributedWithRange:NSMakeRange(title.length - 5, 4) font:[UIFont systemFontOfSize:16] textColor:[UIColor colorWithRed:218/255.0 green:115/255.0 blue:30/255.0 alpha:1] bgColor:nil];
        _titleLabel.attributedText = attributeString;
        
    }else{
        
        _titleLabel.text = title;
        
    }
    
//    CGSize size = [title sizeWithfont:[UIFont systemFontOfSize:16]];
//    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(20);
//        make.centerY.equalTo(self);
//        make.height.equalTo(self);
//        make.width.mas_equalTo(size.width + 3);
//    }];
    
}

- (void)setPlaceholder:(NSString *)placeholder{
    
    _textField.placeholder = placeholder;
    
    [_textField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];//需要在设置placeholder之后设置
}


#pragma mark - --- delegate 视图委托 ---

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (_type == BXTimeChooseInput) {
        
        return 3;
        
    }else{
        
        return 1;

    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (_type == BXTimeChooseInput) {
        if (component == 0) {
            return self.yearSum;
        }else if(component == 1) {
            return 12;
        }else {
            NSInteger yearSelected = [pickerView selectedRowInComponent:0] + self.yearLeast;
            NSInteger monthSelected = [pickerView selectedRowInComponent:1] + 1;
            return  [NSCalendar getDaysWithYear:yearSelected month:monthSelected];
        }
    }else{
        
        return _titles.count;

    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 28.0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    if (_type == BXTimeChooseInput) {
        
        NSString *text;
        if (component == 0) {
            text =  [NSString stringWithFormat:@"%ld", row + 1900];
        }else if (component == 1){
            text =  [NSString stringWithFormat:@"%ld", row + 1];
        }else{
            text = [NSString stringWithFormat:@"%ld", row + 1];
        }
        
        UILabel *label = [[UILabel alloc]init];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setFont:[UIFont systemFontOfSize:17]];
        [label setText:text];
        return label;
        
    }else{
        
        UILabel *label = [[UILabel alloc]init];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setFont:[UIFont systemFontOfSize:20]];
        [label setText:_titles[row]];
        return label;
        
    }
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (_type == BXTimeChooseInput) {
        switch (component) {
            case 0:
                [pickerView reloadComponent:1];
                [pickerView reloadComponent:2];
                break;
            case 1:
                [pickerView reloadComponent:2];
            default:
                break;
        }
        
        [self reloadData];
    }else{
        
        self.selectedText = _titles[row];

    }

}

- (void)reloadData
{
    self.year  = [self.pickerView.pickerView selectedRowInComponent:0] + self.yearLeast;
    self.month = [self.pickerView.pickerView selectedRowInComponent:1] + 1;
    self.day   = [self.pickerView.pickerView selectedRowInComponent:2] + 1;
    self.selectedText = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)self.year,(long)self.month,(long)self.day];

}

- (UIViewController*)viewController
{
    UIResponder *nextResponder =  self;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}

@end
