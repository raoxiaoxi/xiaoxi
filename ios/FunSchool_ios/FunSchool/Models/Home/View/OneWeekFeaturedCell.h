//
//  OneWeekFeaturedCell.h
//  FunSchool
//  一周精选
//  Created by YYQ on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoLoopView.h"
@interface OneWeekFeaturedCell : UITableViewCell <AutoLoopDelegate>
@property (nonatomic,strong) AutoLoopView *loop;

- (void)SetAutoLoopWithImageArray:(NSArray *)imageArray;
@end
