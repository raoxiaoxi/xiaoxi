//
//  FSFiveStarView.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSFiveStarView.h"
#import "FSStarView.h"
#define STAR_WIDTH (30)
#define STAR_HEIGHT (30)
#define STAR_SPACE (0)
@implementation FSFiveStarView

- (id)initWithFrame:(CGRect)frame scale:(float)scale
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _scale = scale;
        _starsArray = [[NSMutableArray alloc] init];
    }
    [self appendStar];
    return self;
}

- (void)appendStar
{
    for (int i = 0; i < 5; i++) {
        FSStarView *view = [[FSStarView alloc] initWithScale:_scale];
        view.frame = CGRectMake(0, 0, STAR_WIDTH*_scale, STAR_HEIGHT);
        view.center = CGPointMake(STAR_WIDTH/2*_scale + i*STAR_WIDTH*_scale + STAR_SPACE*i*_scale, self.frame.size.height/2);
        [self addSubview:view];
        view.delegate = self;
        view.index = i;
        [_starsArray addObject:view];
    }
}

- (void)fsStarView:(FSStarView *)view
{
    self.star = view.index;
}

- (void)fsFiveStarView:(FSFiveStarView *)view didClickView:(FSStarView *)starView atIndex:(NSInteger)index
{
    
}

- (void)setStar:(NSInteger)star
{
    _star = star;
    for(int i = 0; i< _starsArray.count;i++)
    {
        FSStarView *view = _starsArray[i];
        if (i <= star) {
            view.style = FSStarViewStyleHighlight;
        }
        else
        {
            view.style = FSStarViewStyleNormal;
        }
    }
}

@end
