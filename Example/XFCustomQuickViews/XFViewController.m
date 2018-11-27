//
//  XFViewController.m
//  XFCustomQuickViews
//
//  Created by 953894805@qq.com on 11/27/2018.
//  Copyright (c) 2018 953894805@qq.com. All rights reserved.
//

#import "XFViewController.h"
#import "XFCustomHeader.h"
@interface XFViewController ()

@end

@implementation XFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    XFSegementView *segemtentView = [[XFSegementView alloc] initWithFrame:CGRectMake(0, 50, MainWidth, 40)];
    segemtentView.titleArray = @[@"水果",@"蔬菜",@"乳品",@"肉蛋",@"海鲜"];
    segemtentView.titleSelectedColor = [UIColor redColor];
    segemtentView.scrollLineColor = [UIColor greenColor];
    [self.view addSubview:segemtentView];
    
    XFBrokenLineTextField *tf = [[XFBrokenLineTextField alloc] initWithFrame:CGRectMake(100, 150, 200, 40)];
    [tf addBorderWithFloat:0.5 andColor:BorderColor];
    [self.view addSubview:tf];
    
    XFIntroduceView *introduceView = [[XFIntroduceView alloc] initWithFrame:CGRectMake(20, 250, MainWidth - 40, 110)];
    introduceView.title = @"高晓松说世界杯就是大骗局！";
    introduceView.content = @"没错，最大的谣言就是“世界杯是一场大骗局，很多比赛都是假球，像提线木偶一样，被博彩公司牢牢操控。”而无数的人，因为博彩游戏的反复失败和赔钱，也或多或少地对世界杯比赛的真实性产生了怀疑。需要注意，赌博的恶劣影响是有目共睹的，库叔之前刊发的文章《十赌九输的科学证明，就算是胜负五五开赌徒也必定倾家荡产》里，就讲到了赌博的本质，所以奉劝各位不要赌博。";
    [self.view addSubview:introduceView];
    
    XFAutoScrollTableView *tableView = [[XFAutoScrollTableView alloc] initWithFrame:CGRectMake(20, 350, MainWidth - 40, 40)];
    [self.view addSubview:tableView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
