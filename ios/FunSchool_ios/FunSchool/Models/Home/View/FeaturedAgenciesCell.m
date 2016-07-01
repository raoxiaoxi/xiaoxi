//
//  FeaturedAgenciesCell.m
//  FunSchool
//
//  Created by YYQ on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FeaturedAgenciesCell.h"

@implementation FeaturedAgenciesCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    }
    return self;
}

- (void)SetImageButtonWithimageArray:(NSArray*)imageArray LabelTitle:(NSArray *)titleArray imageTag:(int)imageTag
{
    for (int i = 0; i < [_CellImageArray count]; i++) {
        [[_CellImageArray objectAtIndex:i] removeFromSuperview];
    }
    for (int j= 0; j < [_CelllabelArray count]; j++) {
        [[_CelllabelArray objectAtIndex:j] removeFromSuperview];
    }
    _CellImageArray = [[NSMutableArray alloc] init];
    _CelllabelArray =[[NSMutableArray alloc] init];
    for (int i=0; i<3; i++)
    {
        CGFloat imageWith = (kScreenwidth-5)/3;
        _itemImageView = [[UIImageView alloc]initWithFrame:CGRectMake(1+i*(imageWith+1), 0, imageWith, 90)];
        [_itemImageView setImage:[UIImage imageNamed:imageArray[i]]];
        [self.contentView addSubview:_itemImageView];
     
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(1+i*(imageWith+1), 0, imageWith, 90)];
        label.text = titleArray[i];
        label.textColor = [UIColor whiteColor];
        [label setBackgroundColor:[UIColor blackColor]];
        [label setAlpha:0.5];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        [_CellImageArray addObject:_itemImageView];
        [_CelllabelArray addObject:label];
        
        _itemImageView.tag = imageTag+i;//设置tag值
        _itemImageView.userInteractionEnabled = YES;
        self.contentView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapImage:)];
        [_itemImageView addGestureRecognizer:tap];
    }
}

- (void)TapImage:(UITapGestureRecognizer *)tap
{
    UIImageView* ImageView = (UIImageView*)tap.view;
    self.itemImageView = ImageView;
    if ([_delegate respondsToSelector:@selector(SetImageClickSkipping:)]) {
        [_delegate SetImageClickSkipping:self];
    }
}

@end
