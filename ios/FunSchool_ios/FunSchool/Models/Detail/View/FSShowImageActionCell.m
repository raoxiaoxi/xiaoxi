//
//  FSShowImageActionCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/29.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//


#import "FSShowImageActionCell.h"

@implementation FSShowImageActionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        FSShowImageInfoItemView *commentView = [[FSShowImageInfoItemView alloc] initWithFrame:CGRectMake(0 +20, 0, 140, 20) withStyle:FSShowImageInfoItemViewStyleAction];
        [commentView setIcon:nil withContent:@"写评论"];
        [self.contentView addSubview:commentView];

        FSShowImageInfoItemView *tryClassView = [[FSShowImageInfoItemView alloc] initWithFrame:CGRectMake(kScreenwidth/3+20, 0, 140, 20) withStyle:FSShowImageInfoItemViewStyleAction];
        [tryClassView setIcon:nil withContent:@"免费试课"];
        [self.contentView addSubview:tryClassView];

        FSShowImageInfoItemView *liveMessageView = [[FSShowImageInfoItemView alloc] initWithFrame:CGRectMake(kScreenwidth/3*2+20, 0, 140, 20) withStyle:FSShowImageInfoItemViewStyleAction];
        [liveMessageView setIcon:nil withContent:@"留言"];
        [self.contentView addSubview:liveMessageView];

    }
    return self;
}

@end
