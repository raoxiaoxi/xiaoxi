//
//  LoginViewController.h
//  Mobile
//
//  Created by pgzj on 15/4/28.
//  Copyright (c) 2015年 yuyanqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
-(BOOL) connectedToNetwork;
@property (nonatomic)BOOL isDelegateRoot;
@end
