//
//  UIPopActionMenuView.h
//  尚通OA
//
//  Created by pgzj on 15/7/2.
//  Copyright (c) 2015年 SongYuJie. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIPopActionMenuView : UIView
- (id)initGridMenuWithitemTitles:(NSArray *)itemTitles
                          images:(NSArray *)images
                    Selectimages:(NSArray *)Selectimages;

- (void)show;
@property(nonatomic,copy)void (^PopMenuActionHandler)(NSInteger index);
@end
