//
//  FSShowImageInfoCell.h
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSShowImageInfoItemView.h"
#import <UIKit/UIKit.h>

@interface FSShowImageInfoCell : UITableViewCell

@property(nonatomic,retain)FSShowImageInfoItemView *collectionView;
@property(nonatomic,retain)FSShowImageInfoItemView *attendedView;
@property(nonatomic,retain)FSShowImageInfoItemView *commentView;

@end
