//
//  UIPopActionView.h
//  尚通OA
//
//  Created by pgzj on 15/7/2.
//  Copyright (c) 2015年 SongYuJie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPopActionMenuView.h"
@interface UIPopActionView : UIView

+ (void)showGridMenuWithitemTitles:(NSArray *)itemTitles
                            images:(NSArray *)images
                      Selectimages:(NSArray *)Selectimages
                    selectedHandle:(void(^)(NSInteger index))PopMenuActionHandler;


@end
