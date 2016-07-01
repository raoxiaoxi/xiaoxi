//
//  UIPopActionMenuView.m
//  尚通OA
//
//  Created by pgzj on 15/7/2.
//  Copyright (c) 2015年 SongYuJie. All rights reserved.
//

#import "UIPopActionMenuView.h"

@implementation UIPopActionMenuView
{
    UIView* bgoverWindowView;
    NSMutableArray* BtnArray;
}

- (id)initGridMenuWithitemTitles:(NSArray *)itemTitles
                          images:(NSArray *)images
                    Selectimages:(NSArray *)Selectimages
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenwidth, kScreenheight);
        bgoverWindowView = [[UIView alloc]initWithFrame:self.frame];
        bgoverWindowView.backgroundColor = [UIColor blackColor];
        bgoverWindowView.alpha = 0.7;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TouchViewRecv)];
        [bgoverWindowView addGestureRecognizer:tapGesture];
        
        
        [self addSubview:bgoverWindowView];
        BtnArray = [NSMutableArray array];
        NSInteger Tag = 1;
        for(NSString* Title in itemTitles)
        {
            UIImage* imge  = [images objectAtIndex:Tag-1];
            UIImage* Simge = [Selectimages objectAtIndex:Tag-1];
            UIButton* PopMenuBtn = [[UIButton alloc]init];
            [PopMenuBtn setImage:imge forState:UIControlStateNormal];
            [PopMenuBtn setImage:Simge forState:UIControlStateHighlighted];
            [PopMenuBtn setBackgroundColor:[UIColor clearColor]];
            [PopMenuBtn setTag:Tag];
            [PopMenuBtn addTarget:self action:@selector(ClickPopMenuBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel* BtnTitle = [[UILabel alloc]init];
            [BtnTitle setBackgroundColor:[UIColor clearColor]];
            [BtnTitle setText:Title];
            BtnTitle.font = [UIFont systemFontOfSize:15];
            [BtnTitle setTextColor:[UIColor whiteColor]];
            [BtnTitle setTextAlignment:NSTextAlignmentCenter];
            [BtnTitle setTag:50];
            [PopMenuBtn addSubview:BtnTitle];
            Tag++;
            [BtnArray addObject:PopMenuBtn];
            [self addSubview:PopMenuBtn];
            PopMenuBtn.frame = CGRectMake(kScreenwidth/2, kScreenheight, 1, 1);
        }
        UIWindow *window = [(AppDelegate *)[[UIApplication sharedApplication]delegate]window];
        [window addSubview:self];
    }
    return self;
}

- (void)BtnAnimateShow
{
    CGFloat BtnWidth = 60;
    CGFloat BtnHeight = BtnWidth;
    UIFont  *TitleFont = Font(12);
    CGFloat BtnXspace = kScreenwidth/4;
    CGFloat BtnYspace = -BtnWidth/2;
    CGFloat BtnX = (kScreenwidth-BtnWidth*[BtnArray count])/([BtnArray count]+1);
    CGFloat OldBtnX = BtnX;
    CGFloat BtnY = kScreenheight - 140;
    
    CGFloat AnimateY = 0;
    for(UIButton* MenuBtn in BtnArray)
    {
        UILabel* BtnTitle = (UILabel*)[MenuBtn viewWithTag:50];
        [BtnTitle setFont:TitleFont];
        BtnTitle.frame = CGRectMake(0, BtnHeight+5, BtnWidth, BtnHeight/4);
        NSInteger Count = MenuBtn.tag;
        AnimateY = BtnY - 40*arc4random()%Count;
        MenuBtn.frame = CGRectMake(BtnX, AnimateY, BtnWidth, BtnHeight);
        BtnX = BtnX + BtnXspace + BtnWidth;
        if (Count%4 == 0) {
            BtnX = OldBtnX;
            AnimateY += BtnYspace;
        }
    }
}

- (void)ClickPopMenuBtn:(UIButton*)btn
{
    self.PopMenuActionHandler(btn.tag);
    [self hide];
}

- (void)show
{
    [self AnimateHide:NO RemoveView:NO];
}

- (void)hide
{
    [self AnimateHide:YES RemoveView:YES];
}

- (void)AnimateHide:(BOOL)hide RemoveView:(BOOL)isRemoveView
{
    CGFloat AnimateTime;
    if (hide) {
        AnimateTime = 0.3;
    }
    else
    {
        AnimateTime = 0.4;
    }
    [UIView animateWithDuration:AnimateTime animations:^(void){
        if (hide) {
            for(UIButton* MenuBtn in BtnArray)
            {
                MenuBtn.frame = CGRectMake(kScreenwidth/2, kScreenheight, 30, 30);
                UILabel* BtnTitle = (UILabel*)[MenuBtn viewWithTag:50];
                BtnTitle.alpha = 0;
                MenuBtn.alpha = 0;
            }
        }
        else
        {
            [self BtnAnimateShow];
        }
    }completion:^(BOOL finish){
        if (finish) {
            if (isRemoveView) {
                UIWindow *window = [(AppDelegate *)[[UIApplication sharedApplication]delegate]window];
                for (UIView *view in [window subviews]) {
                    if ([view isKindOfClass:[UIPopActionMenuView class]]) {
                        [view removeFromSuperview];
                    }
                }
            }
        }
    }];
}

- (void)TouchViewRecv
{
    self.PopMenuActionHandler(-1);
    [self hide];
}
@end
