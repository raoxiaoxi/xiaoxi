//
//  DoctorLoadingView.m
//  DoctorClient
//
//  Created by 刘伟 on 14-6-24.
//  Copyright (c) 2014年 com.avcon. All rights reserved.
//

#import "LoadingView.h"
#import "AppDelegate.h"
#import "Utility.h"
//#import "UIView+i7Rotate360.h"

@implementation UILoadingView
{
    NSTimer *Time;
    NSInteger TimeCount;
    UILabel* TitleLonding;
    NSInteger _MaxTime;
    UIImageView *_loadImage;
}

+ (UILoadingView *)sharedInstance {
    static UILoadingView *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenwidth, kScreenheight);
        _canCanceled = YES;
        _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
        _backgroundView.layer.cornerRadius = 5.0;
        _backgroundView.center = self.center;
        [self addSubview:_backgroundView];
        _backgroundView.backgroundColor = [UIColor clearColor];
//        _loadImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 60, 60)];
//        _loadImage.image = [UIImage imageNamed:@"LoadingImage"];
//        [_backgroundView addSubview:_loadImage];
        
        
        [_backgroundView setBackgroundColor:[UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:.9]];
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.frame = CGRectMake(41.5, 20, _activityIndicatorView.frame.size.width, _activityIndicatorView.frame.size.height);
        [_backgroundView addSubview:_activityIndicatorView];
//
        
        TitleLonding = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 100, 40)];
        [TitleLonding setBackgroundColor:[UIColor clearColor]];
        [TitleLonding setText:@"请稍候..."];
        [TitleLonding setNumberOfLines:2];
        [TitleLonding setFont:Font(14)];
        [TitleLonding setTextAlignment:NSTextAlignmentCenter];
        [TitleLonding setTextColor:[UIColor whiteColor]];
        [_backgroundView addSubview:TitleLonding];
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setImage:[UIImage imageNamed:@"Patient_Smalldeletebutton.png"] forState:UIControlStateNormal];
        _cancelButton.frame = CGRectMake(104,-4, 20, 20);
        [_cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.hidden = YES;
        [_backgroundView addSubview:_cancelButton];
    }
    //创建定时器
    Time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TimeLoad) userInfo:nil repeats:YES];
    [Time setFireDate:[NSDate distantFuture]];
    TimeCount = 0;
    _MaxTime = 15;
    
    return self;
}

//- (void)headPhotoAnimation
//{
//    [_loadImage rotate360WithDuration:0.5 repeatCount:100 timingMode:i7Rotate360TimingModeLinear];
//    _loadImage.animationDuration = 0.5;
//    _loadImage.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"LoadingImage"],
//                                  [UIImage imageNamed:@"LoadingImage"],[UIImage imageNamed:@"LoadingImage"],
//                                  [UIImage imageNamed:@"LoadingImage"],[UIImage imageNamed:@"LoadingImage"],
//                                  [UIImage imageNamed:@"LoadingImage"], nil];
//    _loadImage.animationRepeatCount = 1;
//    [_loadImage startAnimating];
//}

-(void)setMaxTimeCount:(NSInteger)MaxTimeCount
{
    if (MaxTimeCount == 0) {
        _MaxTime = 15;
    }
    else
        _MaxTime = MaxTimeCount;
}

- (void)TimeLoad
{
    TimeCount++;
    if (TimeCount == _MaxTime) {
        
        [Time setFireDate:[NSDate distantFuture]];
        [self hide];
        //        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"温馨提示"
        //                                                       message:@"网络连接失败"
        //                                                      delegate:nil
        //                                             cancelButtonTitle:@"好的" otherButtonTitles:nil];
        //        [alert show];
        
        //_cancelButton.hidden = NO;
    }
}

-(void)setCanCanceled:(BOOL)canCanceled{
    _canCanceled = canCanceled;
    _cancelButton.hidden = !_canCanceled;
}

-(void)cancel{
    //[_requestOperation cancel];
    [self hide];
    //    if (_delegate != nil && [_delegate respondsToSelector:@selector(loadingViewDidCanceled)]) {
    //        [_delegate loadingViewDidCanceled];
    //    }
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"hide" object:nil];
}

- (void)dealloc
{
    [Time setFireDate:[NSDate distantFuture]];
    [Time invalidate];
}

- (void)show{
    TimeCount = 0;
    //开启定时器
    [Time setFireDate:[NSDate distantPast]];
    UIWindow *window = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) window];
    for (UIView *view in [window subviews]) {
        if ([view isKindOfClass:[UILoadingView class]]) {
            [view removeFromSuperview];
        }
    }
    //[self headPhotoAnimation];
    
    [_activityIndicatorView startAnimating];
    [window addSubview:self];
    _backgroundView.transform = CGAffineTransformIdentity;
    _backgroundView.transform = CGAffineTransformScale(_backgroundView.transform, 1.1, 1.1);
    self.isLoading = YES;
    
}

- (void)hide{
    self.isLoading = NO;
    [Time setFireDate:[NSDate distantFuture]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //当前没有加载的时候
        TitleLonding.text = @"请稍候...";
        _backgroundView.transform = CGAffineTransformScale(_backgroundView.transform, .8, .8);
        [_activityIndicatorView stopAnimating];
        [self removeFromSuperview];
    });
    //    [UIView animateWithDuration:.05 animations:^{
    //
    //    }completion:^(BOOL finish){
    //    }];
}

- (void)hidewithoutanmi
{
    self.isLoading = NO;
    [Time setFireDate:[NSDate distantFuture]];
    TitleLonding.text = @"请稍候...";
    [_activityIndicatorView stopAnimating];
    [self removeFromSuperview];
}

- (void)setTitleLond:(NSString *)TitleLond
{
    if (TitleLonding) {
        TimeCount = 0;
        TitleLonding.text = TitleLond;
    }
}
@end
