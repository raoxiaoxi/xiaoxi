//
//  FSShowDetailCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/29.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSShowDetailCell.h"

@implementation FSShowDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _showImageView = [[UIImageView alloc] init];
        _showImageView.frame = CGRectMake(10, 7, 30, 30);
        _showImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_showImageView];
        
        _showDetailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 7, kScreenwidth - 50 -20, 30)];
        [self.contentView addSubview:_showDetailTextLabel];
        _showDetailTextLabel.text = @"江西省南昌市南昌县向塘镇";
        
        
    }
    return self;
}

- (void)setIcon:(NSString *)icon withText:(NSString *)text
{
    _showDetailTextLabel.text = text;
}

@end
