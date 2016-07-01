//
//  FSShowImageInfoItemView.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSShowImageInfoItemView.h"

@implementation FSShowImageInfoItemView

- (id)initWithFrame:(CGRect)frame withStyle:(FSShowImageInfoItemViewStyle)style
{
    self = [super initWithFrame:frame];
    {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _iconImageView.backgroundColor = [UIColor redColor];
        [self addSubview:_iconImageView];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 30)];
        [self addSubview:_contentLabel];
        _contentLabel.text = @"收藏 20";
        [self addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        if (style == FSShowImageInfoItemViewStyleAction)
        {
            _iconImageView.frame = CGRectMake(0, 0, 35, 35);
            _contentLabel.frame = CGRectMake(40, 0, 100, 30);
            _contentLabel.text = @"写评论";
        }
    }
    return self;
}

- (void)setIcon:(NSString *)icon withContent:(NSString *)content
{
    _iconImageView.image = [UIImage imageNamed:icon];
    _contentLabel.text = content;
}

- (void)setupContentLabelColor
{
    _contentLabel.textColor = [UIColor blueColor];
}

- (void)clickEvent:(id)sender
{
    if ([_delegate respondsToSelector:@selector(fsShowImageInfoItemViewDidClick:)])
    {
        [_delegate fsShowImageInfoItemViewDidClick:self];
    }
}


@end
