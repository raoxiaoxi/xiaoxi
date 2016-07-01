//
//  FSIconCountView.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/30.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "FSIconCountView.h"

@implementation FSIconCountView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2.5, 20, 20)];
        imageView.backgroundColor = [UIColor blackColor];
        [self addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 2.5, 50, 20)];
        label.text = @"(32)";
        [self addSubview:label];
    }
    return self;
}
@end
