//
//  FSFiveStarView.h
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSStarView.h"
@class FSFiveStarView;
@protocol FSFiveStarViewDelegate<NSObject>
- (void)fsFiveStarView:(FSFiveStarView *)view didClickView:(FSStarView *)starView atIndex:(NSInteger)index;
@end
@interface FSFiveStarView : UIView<FSStarViewDelegate>
{
    NSMutableArray *_starsArray;
    float _scale;
}

@property(nonatomic,assign)NSInteger star;

- (id)initWithFrame:(CGRect)frame scale:(float)scale;
@end
