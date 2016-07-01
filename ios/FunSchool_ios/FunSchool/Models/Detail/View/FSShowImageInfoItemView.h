//
//  FSShowImageInfoItemView.h
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    FSShowImageInfoItemViewStyleAction,
    FSShowImageInfoItemViewStyleShowMessage
}FSShowImageInfoItemViewStyle;
@class FSShowImageInfoItemView;

@protocol FSShowImageInfoItemViewDelegate <NSObject>
// 点击事件
- (void)fsShowImageInfoItemViewDidClick:(FSShowImageInfoItemView *)view;
@end
@interface FSShowImageInfoItemView : UIButton
{
    UIImageView *_iconImageView; // 显示的图标
    UILabel *_contentLabel; // 显示的内容
}

@property(nonatomic,assign)id <FSShowImageInfoItemViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withStyle:(FSShowImageInfoItemViewStyle)style;
- (void)setupContentLabelColor;
- (void)setIcon:(NSString *)icon withContent:(NSString *)content;
@end
