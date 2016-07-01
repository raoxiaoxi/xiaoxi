//
//  FSShowImageInfoCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//


#import "FSShowImageInfoCell.h"

@implementation FSShowImageInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _collectionView = [[FSShowImageInfoItemView alloc] initWithFrame:CGRectMake(0, 7, 80, 30) withStyle:FSShowImageInfoItemViewStyleShowMessage];
    [_collectionView setIcon:nil withContent:@"收藏"];
    [self.contentView addSubview:_collectionView];
    
    _attendedView = [[FSShowImageInfoItemView alloc]initWithFrame:CGRectMake(80+7 + 10, 7, 120, 30) withStyle:FSShowImageInfoItemViewStyleShowMessage];
    [_attendedView setIcon:nil withContent:@"参加过"];
    [self.contentView addSubview:_attendedView];
    
    _commentView = [[FSShowImageInfoItemView alloc] initWithFrame:CGRectMake(80+7 + 10 + 80 + 10+7,7 , 120, 30) withStyle:FSShowImageInfoItemViewStyleShowMessage];
    [self.contentView addSubview:_commentView];
    [_commentView setIcon:nil withContent:@"评论"];
    [_commentView setupContentLabelColor];
    return self;
}
@end
