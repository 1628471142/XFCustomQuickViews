//
//  BXEditInfoTableViewCell.h
//  笨象直播
//
//  Created by 展翅的小鸟 on 16/12/14.
//  Copyright © 2016年 雪峰. All rights reserved.
//

@protocol BXEditCellTextChangeDelegate <NSObject>

- (void)changedText:(NSString *)text withIndexPath:(NSIndexPath *)indexPath;

@end

#import <UIKit/UIKit.h>
#import "STPickerView.h"
#import "STPickerDate.h"
#import "NSCalendar+ST.h"
#import "NSString+XFAttribute.h"
#import "UIView+AddCornerRadius.h"

typedef NS_ENUM(NSInteger, BXEditCellType) {
    BXNormalTextInput,
    BXTimeChooseInput,
    BXAgeLevelInput,//儿童，少年，青年，中年，老年
    BXMovieTypeInput,//院线电影，电视剧，网络电视剧，电视电影，网络大电影，综艺节目，其他
    BXRoleTypeInput,//主演，主配，次配，特约，特型，跟组，群演，重要角色，其他
    BXYearChooseInput,
    BXSexChooseInput,
    BXRoleSignInput,//网红，反派。。
    BXStarChooseInput,//星座
    BXThemeChooseInput,//现代，年代，古装
    BXPlatFormChooseInput,//院线，卫视，网络，其他
    QBRelationshipChooseInput,//家属，朋友，同事 
    QBIncomeChooseInput,//收入
    QBMarryChooseInput,//婚姻状况
    QBStayTimeChooseInput,//居住时长
    QBWorkTimeChooseInput,//入职时间
    QBWaitRequest,//等待请求参数
    QBApplyNumberChooseInput,//申请额度
    QBLoanPurposeChooseInput,//借款目的
    QBEducationChooseInput,//最高学历
    QBLivingChooseInput,//住房类型
    ZXBorrowDays,//借款天数
    ZXBorrowTimes//借款期数
};



@interface BXEditInfoTableViewCell : UITableViewCell<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>


@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *pickerTitle;

@property (nonatomic, assign) BXEditCellType type;

@property (nonatomic, weak) STPickerView *pickerView;


@property (nonatomic, strong) NSArray *titles;//单个数据源

@property (nonatomic, strong) NSString *selectedText;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, assign) BOOL hasNoLine;

@property (nonatomic, weak) id<BXEditCellTextChangeDelegate>textChangedDelegate;

@property (nonatomic, weak) UIView *bgView;

@property (nonatomic, strong) UIButton         *textFieldBtn;//覆盖在textField上的按钮，修复bug

/** 1.年 */
@property (nonatomic, assign)NSInteger year;
/** 2.月 */
@property (nonatomic, assign)NSInteger month;
/** 3.日 */
@property (nonatomic, assign)NSInteger day;

/** 1.最小的年份，default is 1900 */
@property (nonatomic, assign)NSInteger yearLeast;
/** 2.显示年份数量，default is 200 */
@property (nonatomic, assign)NSInteger yearSum;

- (UIViewController*)viewController;
@end
