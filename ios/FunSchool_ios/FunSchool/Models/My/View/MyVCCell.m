//
//  MyVCCell.m
//  EOC营销通
//
//  Created by pgzj on 15/7/27.
//  Copyright (c) 2015年 尚通科技. All rights reserved.
//

#import "MyVCCell.h"

@implementation MyVCCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = CellSelectedBackgroundColor;//cell按下后的颜色
        // Initialization code
        [self creatUI];
    }
    return self;
}
-(void)creatUI
{
    
    //文字
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.numberOfLines = 1;
    _titleLabel.font= [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_titleLabel];
    
    //姓名
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.numberOfLines = 1;
    _nameLabel.font= [UIFont systemFontOfSize:15];
    _nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_nameLabel];

    
    _corporationLabel = [[UILabel alloc]init];
    _corporationLabel.numberOfLines = 0;
    _corporationLabel.font= [UIFont systemFontOfSize:15];
    _corporationLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_corporationLabel];
    
    //图片
//    _titleImageView = [[UIImageView alloc]init];
//    _titleImageView.backgroundColor = [UIColor clearColor];
//    [self.contentView addSubview:_titleImageView];
    
    _userImageView = [[UIImageView alloc]init];
    Radiucorner(_userImageView);
    [self.contentView addSubview:_userImageView];
    
//    _Signoutlabel =  [[UILabel alloc]init];
//    _Signoutlabel.numberOfLines = 1;
//    _Signoutlabel.font= [UIFont systemFontOfSize:CellFont];
//    _Signoutlabel.textColor = [UIColor orangeColor];
//    _Signoutlabel.textAlignment = NSTextAlignmentCenter;
//    [self.contentView addSubview:_Signoutlabel];
    
    
    CGFloat padding = 20;
    CGFloat imagePadding = 10;
    CGFloat imageHW = 70;
    CGFloat nameH = 20;
//    _titleImageView.frame = CGRectMake(10, (CellHigh-18)/2, 20, 20);
    _titleLabel.frame = CGRectMake(imagePadding, 0, kScreenwidth-CGRectGetMaxX(_titleImageView.frame)-20 , CellHigh);
    _userImageView.frame = CGRectMake(imagePadding, imagePadding, imageHW-imagePadding, imageHW-imagePadding);
    _nameLabel.frame = CGRectMake(imageHW+15, padding-5, kScreenwidth-imageHW-padding-20, nameH);
    _corporationLabel.frame = CGRectMake(imageHW+15, CGRectGetMaxY(_nameLabel.frame), kScreenwidth-imageHW+padding-20-40, nameH*2);
    
}
@end
