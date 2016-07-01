//
//  MyViewController.m
//  FunSchool
//
//  Created by YYQ on 16/6/27.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "MyViewController.h"
#import "MyVCCell.h"
#import "LoginViewController.h"
#import "HomeSearchBar.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableview;
    NSMutableArray*  _DateArraySession;
    NSString *ImageUrlString;
    NSMutableArray*  _dataImageArray;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreateNav];
    [self CreatetableView];
    [self initArray];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.tabBarController.navigationItem.titleView setHidden:YES];
    self.tabBarController.navigationItem.titleView = nil;
    [_tableview reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//状态栏字体白色
    [super viewDidAppear:animated];
    [self ReloadData];
}

- (void)ReloadData
{
    [_tableview reloadData];
}

- (void)initArray
{
    _DateArraySession = [NSMutableArray array];
    NSMutableArray* Array1 = [NSMutableArray array];
    [Array1 addObject:@""];
    NSMutableArray* Array3 = [NSMutableArray array];
    [Array3 addObject:@"我的收藏"];
    [Array3 addObject:@"我的评论"];
    [Array3 addObject:@"我的消息"];
    [Array3 addObject:@"试听申请"];
    
    NSMutableArray* Array2 = [NSMutableArray array];
    [Array2 addObject:@"更多"];
    
    [_DateArraySession addObject:Array1];
    [_DateArraySession addObject:Array3];
    [_DateArraySession addObject:Array2];
    
    
//    _dataImageArray = [NSMutableArray array];
//    NSMutableArray* imageArray0 = [NSMutableArray array];
//    [imageArray0 addObject:@""];
//    NSMutableArray* imageArray1 = [NSMutableArray array];
//    [imageArray1 addObject:@"UserInfo_TrafficInput_icon.png"];
//    [imageArray1 addObject:@"UserInfo_Redpackage_icon.png"];
//    
//    NSMutableArray* imageArray = [NSMutableArray array];
//    [imageArray addObject:@"icon_menu_album@2x"];
//    [imageArray addObject:@"icon_menu_myfooter@2x"];
//    [imageArray addObject:@"icon_menu_helpcenter@2x"];
//    [imageArray addObject:@"icon_menu_setting@2x"];
//    [_dataImageArray addObject:imageArray0];
//    [_dataImageArray addObject:imageArray1];
//    [_dataImageArray addObject:imageArray];
    
}

- (void)CreatetableView
{
    if(ISIOS7)
    {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, kScreenwidth, kScreenheight-18) style:UITableViewStyleGrouped];
    }
    else
    {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenwidth, kScreenheight) style:UITableViewStyleGrouped];
    }
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
}

- (void)deselect
{
    [_tableview deselectRowAtIndexPath:[_tableview indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.3f];
    
    NSMutableArray* listArray = [_DateArraySession objectAtIndex:indexPath.section];
    NSString* Name = [listArray objectAtIndex:indexPath.row];
    if (indexPath.row == 0 && indexPath.section == 0){
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:loginVC animated:YES];
        
    }
    else if ([Name isEqualToString:@"我的收藏"]) {
       
    }
    else if ([Name isEqualToString:@"我的评论"]) {
        
    }
    else if ([Name isEqualToString:@"我的消息"]) {
        
    }
    else if ([Name isEqualToString:@"试听申请"]) {
        
    }
    else if ([Name isEqualToString:@"更多"]) {
        
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray* listArray = [_DateArraySession objectAtIndex:section];
    return listArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _DateArraySession.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    MyVCCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MyVCCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSMutableArray* listArray = [_DateArraySession objectAtIndex:indexPath.section];
    NSString* Name = [listArray objectAtIndex:indexPath.row];
    
//    NSMutableArray* ImagelistArray = [_dataImageArray objectAtIndex:indexPath.section];
//    NSString* Image = [ImagelistArray objectAtIndex:indexPath.row];
    if (indexPath.section == 0 )
    {
//        FriendModel *model = [[UserInfoUtility sharedInstance]FindModelFromuserId:[UserInfoUtility sharedInstance].userid]; [Utility GetUserName]
        // 网络图片网络获取数据
        cell.nameLabel.text = @"未登录";
        CGFloat padding = 20;
        CGFloat imageHW = 70;
        CGFloat nameH = 20;
        cell.nameLabel.frame = CGRectMake(imageHW+15, 30, kScreenwidth-imageHW-padding-20, nameH);

//        cell.corporationLabel.text = [Utility GetDeptName];
//        [cell.userImageView sd_setImageWithURL:[NSURL URLWithString:model.photoURL] placeholderImage:[UIImage imageNamed:@"Normal_Head"]];
        [cell.userImageView setImage:[UIImage imageNamed:@"chooser-button-tab"]];
        cell.titleImageView.hidden = YES;
        cell.userImageView.hidden = NO;
        cell.titleLabel.text = nil;
    }
    else
    {
        // 固定数据
        cell.userImageView.hidden = YES;
        cell.titleImageView.hidden= NO;
        cell.nameLabel.text = nil;
        cell.corporationLabel.text = nil;
//        [cell.titleImageView setImage:[UIImage imageNamed:Image]];
        cell.titleLabel.text = Name;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;// 系统箭头
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一行
    if (indexPath.section ==0) {
        return 80;
    }
    else
    {
        return 45;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0)
{
    if(ISIOS7)
    {
        return 2;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (void)CreateNav
{
    self.title = @"我";
    self.view.backgroundColor = [UIColor whiteColor];
}


//弹出再次确定判断是否退出视图 选择 代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==1) {
        [self LogoutPost];
//        LoginViewController *lvc = [[LoginViewController alloc]init];
//        lvc.isDelegateRoot = NO;
//        [self presentViewController:lvc animated:YES completion:nil];
    }
}

//服务器端注销
-(void)LogoutPost
{
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    [[CFAPIClient sharedInstance] requestWithMethod:HTTPPOSTMETHOD  withPath:LogoutURL withParams:params onCompletion:^(NSDictionary *json) {
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideCircleNeedRefresh" object:nil];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshCircle" object:nil];
//    } onFailure:^(NSString *errorCode) {
//        
//    }];
}

@end
