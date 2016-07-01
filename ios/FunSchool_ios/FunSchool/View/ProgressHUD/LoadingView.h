//
//  DoctorLoadingView.h
//  DoctorClient
//
//  Created by 刘伟 on 14-6-24.
//  Copyright (c) 2014年 com.avcon. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UILoadingView : UIView{
    UIActivityIndicatorView *_activityIndicatorView;
    UIButton *_cancelButton;
    UIView *_backgroundView;
    
}

+ (UILoadingView *)sharedInstance;
@property (nonatomic,assign)BOOL isLoading;

@property (nonatomic,strong)NSString* TitleLond;

@property (nonatomic, assign)NSInteger MaxTimeCount;

@property (nonatomic,unsafe_unretained) BOOL canCanceled;

@property (nonatomic,strong) NSOperation *requestOperation;



- (void)show;
- (void)hide;
- (void)hidewithoutanmi;
@end





