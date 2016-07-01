//
//  FSShowImageCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSShowImageCell.h"

@implementation FSShowImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, kScreenwidth - 20, 150)];
    _showImageView.image = [UIImage imageNamed:@""];
    _showImageView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_showImageView];
    return self;
}

//

@end
