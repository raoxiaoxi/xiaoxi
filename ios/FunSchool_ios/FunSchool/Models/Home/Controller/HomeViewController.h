//
//  HomeViewController.h
//  FunSchool
//
//  Created by YYQ on 16/6/27.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)BOOL bNavPrest;
@property(nonatomic,assign)NSInteger invoiceSections;
@end