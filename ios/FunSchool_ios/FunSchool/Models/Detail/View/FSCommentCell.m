//
//  FSCommentCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/30.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSFiveStarView.h"
#import "FSCommentCell.h"
#import "FSIconCountView.h"

@implementation FSCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2.5, 20, 20)];
        [self.contentView addSubview:_headImageView];
        _headImageView.backgroundColor = [UIColor redColor];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+30, 2.5, 100, 20)];
        _nameLabel.text = @"Eolande W";
        [self.contentView addSubview:_nameLabel];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 25, kScreenwidth - 20, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        lineView.alpha = 0.3;
        [self addSubview:lineView];
        
        FSFiveStarView *fiveStarView = [[FSFiveStarView alloc] initWithFrame:CGRectMake(10, 25, 300, 30) scale:0.6];
        [self addSubview:fiveStarView];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, kScreenwidth - 20, 40)];
        _contentLabel.text = @"很好的培训机构呢，老师们都比较热心，我的孩子在这里收获蛮多的，希望这机构与啊聊越好";
        _contentLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_contentLabel];
        _contentLabel.numberOfLines = 0;
        lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 95, kScreenwidth - 20, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:lineView];
        lineView.alpha = 0.3;
        
        UIView *buttomView =[[UIView alloc] initWithFrame:CGRectMake(0, 95, kScreenwidth, 30)];
        [self.contentView addSubview:buttomView];
        
        FSIconCountView *iconCountView = [[FSIconCountView alloc] initWithFrame:CGRectMake(10, 0, 100, 25)];
        [buttomView addSubview:iconCountView];
        
        iconCountView = [[FSIconCountView alloc] initWithFrame:CGRectMake(80, 0, 100, 25)];
        [buttomView addSubview:iconCountView];

        
//        UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
//        [buttomView addSubview:iconCountView];
//        [buttomView addSubview:(nonnull UIView *)]
    }
    return self;
}

@end
