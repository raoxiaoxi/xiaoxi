//
//  FSFiveStarCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSFiveStarCell.h"
#import "FSFiveStarView.h"

@implementation FSFiveStarCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        FSFiveStarView *fsFiveStarView = [[FSFiveStarView alloc] initWithFrame:CGRectMake(10, 7, 300, 40) scale:1];
//        fsFiveStarView.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:fsFiveStarView];
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 20, 50, 20)];
        _scoreLabel.text = @"5.0分";
        [self addSubview:_scoreLabel];

    }
    return self;
}

@end
