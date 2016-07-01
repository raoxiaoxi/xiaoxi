//
//  HomeViewController.m
//  FunSchool
//
//  Created by YYQ on 16/6/27.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "HomeViewController.h"

#import "MenuCell.h"
#import "OneWeekFeaturedCell.h"
#import "FeaturedAgenciesCell.h"//精选机构
#import "FunschoolDetailController.h"
#import "HomeSearchBar.h"
@interface HomeViewController ()<FeaturedAgenciesCellDelegate,MenuCellDelegate,HomeSearchBarDelegate>
{
    NSInteger TravelStep;//当前流程位置  "step": 1，4可以编辑补助
}
@property (nonatomic,copy)NSArray *picarray;//一周精选图片数组
@property (nonatomic,copy)NSArray *titleArray;//精选机构数组

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    self.picarray =   @[@"http://e.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=fef54a0ab4de9c82b268f1dd0de8eb6f/f9198618367adab42640b5708cd4b31c8701e475.jpg",@"http://h.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=5a720ec9d6c8a786aa27425c0660a258/4d086e061d950a7b7d65e0f70dd162d9f2d3c9b5.jpg",@"http://e.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=0d6a0b519f22720e6fc3eaa81aa26123/574e9258d109b3de981f4a5bcbbf6c81800a4c64.jpg"];
    [self CreatTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if(_bNavPrest == NO)
//    {
        HomeSearchBar *searchBar = [HomeSearchBar searchBar];
        searchBar.SearchBardelegate = self;
        [self.tabBarController.navigationItem setTitleView:searchBar];
//        [self.tabBarController.navigationItem.titleView setHidden:NO];
        [self createPostRemoveObj:YES];
//    }
//    _bNavPrest = YES;
//    HomeSearchBar *searchBar = [HomeSearchBar searchBar];
//    searchBar.SearchBardelegate = self;
//    [self.tabBarController.navigationItem setTitleView:searchBar];
//    }
//    _bNavPrest = YES;
//    HomeSearchBar *searchBar = [HomeSearchBar searchBar];
//    searchBar.SearchBardelegate = self;
//    [self.tabBarController.navigationItem setTitleView:searchBar];
//    [self createPostRemoveObj:YES];
    
}

- (void)SetHomeSearchBar:(UITextField *)textField
{
    FunschoolDetailController *funschoolDetail = [[FunschoolDetailController alloc] init];
    [self.navigationController pushViewController:funschoolDetail animated:YES];
}


- (void)CreatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenwidth, kScreenheight-44) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark --分组头数据
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(15, 0.0, 300.0, 44.0)];
    if (section!=0) {
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.opaque = NO;
        headerLabel.textColor = [UIColor grayColor];
        headerLabel.highlightedTextColor = [UIColor whiteColor];
        headerLabel.font = Font(12);
        headerLabel.frame = CGRectMake(10, -25, 300.0, 44.0);
        if (section == 1)
        {
            headerLabel.text = @"一周精选";
        }
        else if (section == 2)
        {
            headerLabel.text = @"精选机构";
        }
        else if (section == 3)
        {
            headerLabel.text = @"机构排行榜";
        }
        [customView addSubview:headerLabel];
    }
    return customView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

#pragma mark -- 分组头高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 150;
    }
    else if (indexPath.section ==1)
    {
        return 100;
    }
    else
    {
        return 90;
    }
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        static NSString *cellID =  @"CellID";
        MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[MenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString *OneWeekFeaturedCellID =  @"OneWeekFeaturedCellID";
        OneWeekFeaturedCell *cell = [tableView dequeueReusableCellWithIdentifier:OneWeekFeaturedCellID];
        if (!cell) {
            cell = [[OneWeekFeaturedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OneWeekFeaturedCellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell SetAutoLoopWithImageArray:self.picarray];
        return cell;
    }
    else
    {
        static NSString *FeaturedAgenciesCellID =  @"FeaturedAgenciesCellID";
        FeaturedAgenciesCell *cell = [tableView dequeueReusableCellWithIdentifier:FeaturedAgenciesCellID];
        if (!cell) {
            cell = [[FeaturedAgenciesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FeaturedAgenciesCellID];
        }
        cell.delegate = self;
        if (indexPath.section == 2) {
            NSArray *imageArray=@[@"workspace_addnew@2",@"workspace_salesleads_1",@"workspace_contactrecord_1"];
            NSArray *titleArray=@[@"小马哥",@"小飞过",@"全部》"];
            [cell SetImageButtonWithimageArray:imageArray LabelTitle:titleArray imageTag:100];
        }
        else if (indexPath.section == 3)
        {
            NSArray *imageArray=@[@"workspace_salesleads_1",@"workspace_contactrecord_1",@"workspace_salesopportunities_1"];
            NSArray *titleArray=@[@"小小马",@"小飞过",@"全部》"];
            [cell SetImageButtonWithimageArray:imageArray LabelTitle:titleArray imageTag:200];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (NSArray *)getAllProperties:(NSObject *)model
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([model class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

-(void)createPostRemoveObj:(BOOL)RemoveObj
{
    [_tableView reloadData];
}

- (void)SetImageClickSkipping:(FeaturedAgenciesCell *)cell
{
    NSLog(@"%ld",(long)cell.itemImageView.tag);
    
    FunschoolDetailController *funschoolDetail = [[FunschoolDetailController alloc] init];
    funschoolDetail.title = @"详情";
    [self.navigationController pushViewController:funschoolDetail animated:YES];
}
- (void)SetbuttonClickSkipping:(NSString *)title
{
    NSLog(@"%@",title);
    
}


//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
////    FunschoolDetailController *funschoolDetail = [[FunschoolDetailController alloc] init];
////    [self.navigationController pushViewController:funschoolDetail animated:YES];
//}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    FunschoolDetailController *funschoolDetail = [[FunschoolDetailController alloc] init];
//    [self.navigationController pushViewController:funschoolDetail animated:YES];
//}

@end
