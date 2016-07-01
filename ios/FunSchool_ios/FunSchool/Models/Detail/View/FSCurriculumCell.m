//
//  CurriculumCell.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/29.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSCurriculumCell.h"

@implementation FSCurriculumCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _curriculumImageView = [[UIImageView alloc] init];
        _curriculumImageView.frame = CGRectMake(10,17.5 , 40, 40);
        _curriculumImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_curriculumImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 2.5, kScreenwidth - 70, 20)];
        _titleLabel.text = @"学龄前儿童音乐课程";
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20 + 5, kScreenwidth - 70, 20)];
        _contentLabel.text = @"学龄前儿童音乐课程";
        [self.contentView addSubview:_contentLabel];

        
        _desContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20 + 5 + 20+2.5, kScreenwidth - 70, 20)];
        _desContentLabel.text = @"学龄前儿童音乐课程";
        [self.contentView addSubview:_desContentLabel];
        
    }
    return self;
}
@end
