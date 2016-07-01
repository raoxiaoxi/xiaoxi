//
//  MenuCell.m
//  FunSchool
//
//  Created by YYQ on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    for (int i = 0; i < [_CellbuttonArray count]; i++) {
        [[_CellbuttonArray objectAtIndex:i] removeFromSuperview];
    }
    for (int j= 0; j < [_CelllabelArray count]; j++) {
        [[_CelllabelArray objectAtIndex:j] removeFromSuperview];
    }
    _CellbuttonArray = [[NSMutableArray alloc] init];
    _CelllabelArray =[[NSMutableArray alloc] init];
    CGFloat HW = 40.0;
    CGFloat SpacingX = ((kScreenwidth-40)-HW*3)/2;
    CGFloat SpacingY =  30+HW;
    NSArray *titleArray = @[@"游戏小组",@"兴趣班",@"补习班",@"特殊教育",@"家长课程",@"附近课程"];
    for (int i=0; i<[titleArray count]; i++) {
        int n =  20 +i%3*SpacingX+ i%3*40;;
        int m = 10 + i/3*SpacingY;
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(n, m, HW, HW);
        [_button setImage:[UIImage imageNamed:@"chooser-button-tab"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _button.tag = 100+i;
        [self.contentView addSubview:_button];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_button.frame), CGRectGetMaxY(_button.frame)+5, HW, 10)];
        _titleLabel.text = titleArray[i];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        [_CellbuttonArray addObject:_button];
        [_CelllabelArray addObject:_titleLabel];
        [self.contentView  addSubview:_titleLabel];
    }
    
}

- (void)btnClick:(UIButton *)button
{
    debugLog(@"%d",(int)button.tag);
    NSArray *titleArray = @[@"游戏小组",@"兴趣班",@"补习班",@"特殊教育",@"家长课程",@"附近课程"];

    
    
    if ([_delegate respondsToSelector:@selector(SetbuttonClickSkipping:)]) {
        [_delegate SetbuttonClickSkipping:titleArray[(int)button.tag-100]];
    }
}
@end
