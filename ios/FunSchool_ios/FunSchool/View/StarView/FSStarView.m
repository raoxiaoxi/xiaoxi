//
//  FSStarView.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSStarView.h"

@implementation FSStarView

- (id)initWithScale:(CGFloat)scale
{
    self = [super init];
    if(self)
    {
        _starImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25*scale, 25*scale)];
        _starImageView.image = [UIImage imageNamed:@""];
        _starImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:_starImageView];
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}



- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _starImageView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
}

- (void)setStyle:(FSStarViewStyle)style
{
    _style = style;
    if(style == FSStarViewStyleHighlight)
    {
        _starImageView.image = [UIImage imageNamed:@""];
        _starImageView.backgroundColor = [UIColor blueColor];
    }
    else if (style == FSStarViewStyleNormal)
    {
        _starImageView.image = [UIImage imageNamed:@""];
        _starImageView.backgroundColor = [UIColor redColor];
    }
}


- (void)click:(id)sender
{
    if([_delegate respondsToSelector:@selector(fsStarView:)])
    {
        [_delegate fsStarView:self];
    }
}
@end
