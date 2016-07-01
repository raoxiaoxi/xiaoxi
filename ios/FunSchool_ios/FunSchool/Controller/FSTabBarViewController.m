//
//  FSTabBarViewController.m
//  FunSchool
//
//  Created by YYQ on 16/6/27.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSTabBarViewController.h"
#import "HomeViewController.h"
#import "MyViewController.h"
#import "DCPathButton.h"
#define X  20
@interface FSTabBarViewController ()<DCPathButtonDelegate>
{
    UIButton *HomeBtn;
    UIButton *MyBtn;
    UILabel *MainLabel;
    UILabel *MyLabel;
}
@property (nonatomic,weak)UIButton *selectedBtn;
@end


@implementation FSTabBarViewController



- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
//    self.tabBar.tintColor = [UIColor blackColor];
    [self createUI];
}


-(void)createUI
{
    //主页
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    homeVC.bNavPrest = YES;
    homeVC.tabBarItem = [[UITabBarItem alloc] init];
    homeVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);

    //个人
    MyViewController *MyVC = [[MyViewController alloc]init];
    MyVC.bNavPrest = YES;
    MyVC.tabBarItem = [[UITabBarItem alloc] init];
    MyVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    self.viewControllers = [NSArray arrayWithObjects:homeVC,MyVC,nil];
    
    //tabBar背景View
    UIView *tabBarBackgroundView = [[UIView alloc]initWithFrame:self.tabBar.frame];
    //第一个tabBar按钮
    HomeBtn = [[UIButton alloc]initWithFrame:CGRectMake(X, X/8, X*2, X*2)];
    [HomeBtn setImage:[UIImage imageNamed:@"bar_job"] forState:UIControlStateNormal];
    [HomeBtn setImage:[UIImage imageNamed:@"bar_jobSelcet"] forState:UIControlStateSelected];
    [HomeBtn addTarget:self action:@selector(WorkBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBackgroundView addSubview:HomeBtn];
    [tabBarBackgroundView  setBackgroundColor:[UIColor whiteColor]];
    //默认选择第一个按钮
    [self.navigationItem setTitle:@"首页"];
    [HomeBtn setSelected:YES];
    

    
    MyBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenwidth-3*X, X/8, X*2, X*2)];
    //    [MyBtn setTitle:@"设置" forState:UIControlStateNormal];
    [MyBtn setImage:[UIImage imageNamed:@"bar_mine"] forState:UIControlStateNormal];
    [MyBtn setImage:[UIImage imageNamed:@"bar_mineSelect"] forState:UIControlStateSelected];
    [MyBtn addTarget:self action:@selector(SetBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBackgroundView addSubview:MyBtn];
    [self.view addSubview:tabBarBackgroundView];
    
//    //3  快捷键

    
    [self configureDCPathButton];
    
    MainLabel = [[UILabel alloc] initWithFrame:CGRectMake(X*3/2,X*3.5/2, X*2, X/2)];
    MainLabel.text = @"首页";
    MainLabel.numberOfLines =1;
    MainLabel.textColor = [UIColor orangeColor];
    MainLabel.font= [UIFont boldSystemFontOfSize:10];

    [tabBarBackgroundView addSubview:MainLabel];
    
    
    MyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenwidth-3*X+X/2,X*3.5/2, X*2, X/2)];
    MyLabel.text = @"我的";
    MyLabel.numberOfLines =1;
    MyLabel.font= [UIFont boldSystemFontOfSize:10];
    MyLabel.textColor = [UIColor grayColor];
    [tabBarBackgroundView addSubview:MyLabel];
}



- (void)WorkBtnAction:(UIButton *)button
{
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    [self setSelectedIndex:0];
    self.navigationItem.rightBarButtonItem = nil;
    MainLabel.textColor = [UIColor orangeColor];
    MyLabel.textColor = [UIColor grayColor];
    [self.navigationItem setTitle:@"首页"];
}

- (void)SetBtnAction:(UIButton *)button
{
    HomeBtn.selected=NO;
    // 1.让当前选中的按钮取消选中
    self.selectedBtn.selected = NO;
    // 2.让新点击的按钮选中
    button.selected = YES;
    // 3.让新点击的按钮成为"当前选中的按钮"
    self.selectedBtn = button;
    [self setSelectedIndex:1];
    [self.navigationItem setTitle:@"我的"];
    MyLabel.textColor = [UIColor orangeColor];
    MainLabel.textColor = [UIColor grayColor];
}

- (void)configureDCPathButton
{
    // Configure center button
    //
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                         highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    dcPathButton.delegate = self;
    
    // Configure item buttons
    

//    
    
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"] labbeltitle:@"写评论"];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                               highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                                backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                     backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]labbeltitle:@"我参加过"];
    
    
    [dcPathButton addPathItems:@[
                                 itemButton_1,
                                 itemButton_2,
                                 ]];
    
    dcPathButton.bloomRadius = 120.0f;
    
    dcPathButton.dcButtonCenter = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 25.5f);
    dcPathButton.allowSounds = YES;
    dcPathButton.allowCenterButtonRotation = YES;
    dcPathButton.bottomViewColor = [UIColor blackColor];
    dcPathButton.bloomDirection = kDCPathButtonBloomDirectionCenterTop;
    [self.view addSubview:dcPathButton];
    
    
}

#pragma mark - DCPathButton Delegate

- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton {
    
    NSLog(@"ItemButton will present");
    
}

- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    NSLog(@"You tap %@ at index : %lu", dcPathButton, (unsigned long)itemButtonIndex);
}

- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton {
    
    NSLog(@"ItemButton did present");
    
}




@end

