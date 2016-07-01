//
//  FunschoolDetailController.h
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSBasicViewController.h"

@interface FunschoolDetailController : FSBasicViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
- (void)viewDidLoad;
@end
