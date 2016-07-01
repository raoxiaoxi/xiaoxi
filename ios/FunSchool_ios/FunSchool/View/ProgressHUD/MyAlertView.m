//
//  MyAlertView.m
//  NewAlert
//
//  Created by pgzj on 15/10/29.
//  Copyright © 2015年 daiqi. All rights reserved.
//

#import "MyAlertView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation MyAlertView

- (void)setMyselfAlertView:(NSString *)myTitle
{
    self.frame = CGRectMake(ScreenWidth/2-100, ScreenHeight/2-70, 200, 140);
    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    self.layer.cornerRadius = 10;
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2-36/2, 30, 36, 36)];
    icon.image = [UIImage imageNamed:@"repate_toast"];
    [self addSubview:icon];
    UILabel *titleLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 180, 60)];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.numberOfLines = 2;
    titleLB.font = [UIFont systemFontOfSize:17];
    titleLB.text = myTitle;
    titleLB.textColor = [UIColor whiteColor];
    [self addSubview:titleLB];
    [self setHidden:NO];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(StopShow) userInfo:nil repeats:NO];
    UIWindow *window = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) window];
    for (UIView *view in [window subviews]) {
        if ([view isKindOfClass:[MyAlertView class]]) {
            [view removeFromSuperview];
        }
    }
    [window addSubview:self];
    
}

- (void)dealloc
{
    
}

- (void)StopShow
{
    [self setHidden:YES];
    [self removeFromSuperview];
}
@end
