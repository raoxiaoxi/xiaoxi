//
//  FunschoolDetailController.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSMoreCell.h"
#import "FSCommentCell.h"
#import "FSCurriculumCell.h"
#import "FSShowDetailCell.h"
#import "FSFiveStarCell.h"
#import "FSShowImageCell.h"
#import "FSShowImageInfoCell.h"
#import "FSShowImageActionCell.h"
#import "FunschoolDetailController.h"

@implementation FunschoolDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenwidth, kScreenheight-64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
#pragma tableView datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 170;
    }
    else if (indexPath.section == 4)
    {
        if (indexPath.row == 2)
        {
            return 33;
        }
        return 75;
    }
    else if (indexPath.section == 5)
    {
        if (indexPath.row == 1)
        {
            return 33;
        }
        return 125;
    }

    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return 3;
    }
    else if (section == 2)
    {
        return 2;
    }
    else if (section == 3)
    {
        return 4;
    }
    else if (section ==4)
    {
        return 3;
    }
    else if (section == 5)
    {
        return 2;
    }
    else
    {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        // 显示图片
        static NSString *showImageCell = @"showImageCell";
        FSShowImageCell *cell = [tableView dequeueReusableCellWithIdentifier:showImageCell];
        if (!cell) {
            cell = [[FSShowImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showImageCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        if(indexPath.section == 1)
        {
            if (indexPath.row == 0)
            {
                // 评分cell
                static NSString *fsFiveStarCellId = @"fsFiveStarCellId";
                FSFiveStarCell *cell = [tableView dequeueReusableCellWithIdentifier:fsFiveStarCellId];
                if (!cell) {
                    cell = [[FSFiveStarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fsFiveStarCellId];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                return cell;
            }
            else if (indexPath.row == 1)
            {
                // 信息
                static NSString *fsShowImageInfoCellId = @"fsShowImageInfoCell";
                FSShowImageInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:fsShowImageInfoCellId];
                if (!cell)
                {
                    cell = [[FSShowImageInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fsShowImageInfoCellId];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                return cell;
            }
            else
            {
                // 事件
                static NSString *fsShowImageActionCellId = @"fsShowImageActionCellId";
                FSShowImageActionCell *cell = [tableView dequeueReusableCellWithIdentifier:fsShowImageActionCellId];
                if (!cell)
                {
                    cell = [[FSShowImageActionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fsShowImageActionCellId];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell;
            }
        }
        else if (indexPath.section == 2||indexPath.section == 3)
        {
            // 地理位置以及附加信息
            static NSString *fsShowDetailCellId = @"fsShowDetailCellId";
            FSShowDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:fsShowDetailCellId];
            if (!cell)
            {
                cell = [[FSShowDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fsShowDetailCellId];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
        else if (indexPath.section == 4)
        {
            if (indexPath.row < 2)
            {
                static NSString *curriculumCellId = @"curriculumCellId";
                FSCurriculumCell *cell = [tableView dequeueReusableCellWithIdentifier:curriculumCellId];
                if (!cell) {
                    cell = [[FSCurriculumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:curriculumCellId];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
            else {
                // 更多
                static NSString *moreCellId = @"moreCellId";
                FSMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellId];
                if (!cell) {
                    cell = [[FSMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:moreCellId];
                    cell.textLabel.text = @"查看全部28门课程";
                    cell.textLabel.textColor = [UIColor blueColor];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell;
            }
        }
        else if (indexPath.section == 5)
        {
            // 评论
            if (indexPath.row < 1)
            {
                static NSString *curriculumCellId = @"curriculumCellId";
                FSCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:curriculumCellId];
                if (!cell) {
                    cell = [[FSCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:curriculumCellId];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
            else {
                // 更多
                static NSString *moreCellId = @"moreCellId";
                FSMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellId];
                if (!cell) {
                    cell = [[FSMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:moreCellId];
                    cell.textLabel.text = @"查看全部45条评论";
                    cell.textLabel.textColor = [UIColor blueColor];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell;
            }
        }
        else
        {
            static NSString *fsFiveStarCellId = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fsFiveStarCellId];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fsFiveStarCellId];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 4) {
        return @"开设课程(28)";
    }
    else if (section == 5) {
        return @"热门留言(28)";
    }
    else
    {
        return @"";
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *array = [self.navigationController.navigationBar subviews];
    for (int i =0; i < [array count]; i++) {
        if([array[i] isKindOfClass:[UITextField class]])
        {
            [array[i] removeFromSuperview];
        }
    }
}
@end
