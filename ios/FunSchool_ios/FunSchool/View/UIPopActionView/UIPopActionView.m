//
//  UIPopActionView.m
//  尚通OA
//
//  Created by pgzj on 15/7/2.
//  Copyright (c) 2015年 SongYuJie. All rights reserved.
//

#import "UIPopActionView.h"

@implementation UIPopActionView

+ (void)showGridMenuWithitemTitles:(NSArray *)itemTitles
                            images:(NSArray *)images
                      Selectimages:(NSArray *)Selectimages
                     selectedHandle:(void(^)(NSInteger index))PopMenuActionHandler;
{
    UIPopActionMenuView* PopAction = [[UIPopActionMenuView alloc]initGridMenuWithitemTitles:itemTitles images:images Selectimages:Selectimages];
    
    [PopAction show];
    PopAction.PopMenuActionHandler = ^(NSInteger index){
        PopMenuActionHandler(index);
    };
}

@end
