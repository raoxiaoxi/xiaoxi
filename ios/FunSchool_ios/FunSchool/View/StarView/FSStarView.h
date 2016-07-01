//
//  FSStarView.h
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    FSStarViewStyleHighlight,// 选中
    FSStarViewStyleNormal,// 正常
}FSStarViewStyle;

@class FSStarView;

@protocol FSStarViewDelegate <NSObject>

// 点击星星
- (void)fsStarView:(FSStarView *)view;


@end
@interface FSStarView : UIButton
{
}
@property(nonatomic,retain)UIImageView *starImageView;
@property(nonatomic,assign)FSStarViewStyle style;
@property(nonatomic,assign)id<FSStarViewDelegate> delegate;
@property(nonatomic,assign)NSInteger index;

- (id)initWithScale:(CGFloat)scale;
@end
