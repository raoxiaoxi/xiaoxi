//
//  FSShowDetailCell.h
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/29.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSShowDetailCell : UITableViewCell
@property(nonatomic,retain)UIImageView *showImageView;
@property(nonatomic,retain)UILabel *showDetailTextLabel;

// 设置图片
- (void)setIcon:(NSString *)icon withText:(NSString *)text;
@end
