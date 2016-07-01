//
//  OneWeekFeaturedCell.m
//  FunSchool
//
//  Created by YYQ on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "OneWeekFeaturedCell.h"

@implementation OneWeekFeaturedCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    }
    return self;
}

- (void)SetAutoLoopWithImageArray:(NSArray *)imageArray
{
    [self.loop setScrollerByPicArr:imageArray];
}

-(AutoLoopView *)loop{
    if (_loop==nil) {
        _loop = [[AutoLoopView alloc]initWithFrame:CGRectMake(0, 0, kScreenwidth, 100)];
        _loop.backgroundColor = [UIColor whiteColor];
        _loop.delegate = self;
        [self addSubview:_loop];
    }
    return _loop;
}

-(void)tapPictureTag:(NSInteger)tag{
    NSLog(@"%d",(int)tag);
    
}

@end
