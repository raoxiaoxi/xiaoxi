//
//  LoginViewController.m
//  Mobile
//
//  Created by pgzj on 15/4/28.
//  Copyright (c) 2015年 yuyanqiu. All rights reserved.
//

#import "LoginViewController.h"
//#import "UIWelcomeView.h"
#import "AudioToolbox/AudioToolbox.h"
//#define X   20
//#define Y   120
#import "Utility.h"
#import "FSTabBarViewController.h"
//#import "UIVersionUpdateView.h"

//判断网络连接正常需要加入的头文件
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import <arpa/inet.h>
@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UIScrollView *_MianScrollView;
    UITextField *_textFiledAccounts;
    UITextField *_textFiledPassword;
    UIButton *SavePwdBtn;
    CGFloat ImageW ;
    CGFloat ImageH ;
    
}
@property (weak, nonatomic)UIImageView *loginView;
//@property (weak,nonatomic)UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic,weak)UIButton *selectedBtn;//按钮选中
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    [self creatScrollView];
    [Utility SetPassword:nil];
}

- (void)creatScrollView
{
    _MianScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenwidth, kScreenheight)];
    _MianScrollView.contentSize = CGSizeMake(0, kScreenheight);
    _MianScrollView.showsHorizontalScrollIndicator = NO;
    _MianScrollView.showsVerticalScrollIndicator = NO;
    _MianScrollView.scrollEnabled = NO;
    //_MianScrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;//滚动视图键盘下弹
    [_MianScrollView setBackgroundColor: O_COLOR(248, 248, 248, 0.9)];
    [self.view addSubview:_MianScrollView];
    [self creatUI];
}

//快速设置UITextField的参数
- (UITextField *)QuicklySetUpUITextField:(UITextField *)textField UIFont:(UIFont *)Font
{
    textField.keyboardType= UIKeyboardTypeDefault;//用于输入电子邮件地址的键盘
    textField.returnKeyType = UIReturnKeyDone;
    textField.borderStyle = UITextBorderStyleNone;//边框设置
    [textField setTextColor:[UIColor grayColor]];
    textField.font = Font;
    textField.clearButtonMode = UITextFieldViewModeAlways;//小叉叉
    //    textField.borderStyle = UITextBorderStyleRoundedRect;
    //    textField.layer.cornerRadius=3.0f;
    //    textField.layer.masksToBounds=YES;
    //    textField.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    //    textField.layer.borderWidth= 1.0f;
    textField.autocapitalizationType =UITextAutocapitalizationTypeNone; //不自动大写
    return textField;
}

-(void)creatUI
{
    UIColor *LineColor = O_COLOR(210 , 210, 210, 1);
//    CGFloat X =10;
    CGFloat  ImageHeight;
    CGFloat  JoinedButtonH;//申请加入已有公司间距
    CGFloat LoginHeight;//登录按钮高度
    CGFloat Spacing;
    if (iphone4S) {
        ImageHeight = 8;
        LoginHeight = 14;
        JoinedButtonH = 25;
        Spacing = 50;
    }
    else if (iphone5s) {
        ImageHeight = 27 + 103/4;
        LoginHeight = 14;
        JoinedButtonH = 30;
        Spacing = 50;
    }
    else if (iphone6)
    {
        ImageHeight = 47 + 103/2;
        LoginHeight = 20;
        JoinedButtonH = 20;
        Spacing = 50;
    }
    else if (iphone6P)
    {
        ImageHeight = 70 + 103/2 ;
        LoginHeight = 20;
        JoinedButtonH = 20;
        Spacing = 60;
    }
    ImageW = 70;
    ImageH = 70;
    
    UIImageView *LogoImage = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenwidth-ImageW)/2,ImageHeight+25, ImageW, ImageH)];
    [LogoImage setImage:[UIImage imageNamed:@"oa_about"]];
    [_MianScrollView addSubview:LogoImage];
    
    CGFloat ClolorViewH = 100;
    UIView *ClolorView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(LogoImage.frame)-1+Spacing-4, kScreenwidth, ClolorViewH)];
    [ClolorView setBackgroundColor:[UIColor whiteColor]];
    [_MianScrollView addSubview:ClolorView];
    
    //线
    UIView* Line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenwidth, 0.5)];
    Line.backgroundColor = LineColor;
    [ClolorView addSubview:Line];
    
    
    UIImageView *ImageAccounts = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20-4, 33/2, 33/2)];
    [ImageAccounts setImage: [UIImage imageNamed:@"Login_Accounts.png"]];
    [ClolorView addSubview:ImageAccounts];
    
    
    _textFiledAccounts= [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(ImageAccounts.frame)+10,2, kScreenwidth-CGRectGetMaxX(ImageAccounts.frame)-10, ClolorViewH/2-1)];
    [self QuicklySetUpUITextField:_textFiledAccounts UIFont:[UIFont systemFontOfSize:16]];
    _textFiledAccounts.placeholder = @"请输入用户名";
    _textFiledAccounts.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [ClolorView addSubview:_textFiledAccounts];
    //线
    UIView* Line1 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(ImageAccounts.frame), CGRectGetMaxY(_textFiledAccounts.frame)-1/2, kScreenwidth-CGRectGetMinX(ImageAccounts.frame), 0.5)];
    Line1.backgroundColor = LineColor;
    [ClolorView addSubview:Line1];
    
    
    UIImageView *ImagePassword = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20+CGRectGetMaxY(Line1.frame)-4, 33/2, 33/2)];
    [ImagePassword setImage: [UIImage imageNamed:@"Initialize_Lock"]];
    [ClolorView addSubview:ImagePassword];
    
    _textFiledPassword= [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(ImagePassword.frame)+10,CGRectGetMaxY(_textFiledAccounts.frame), kScreenwidth-CGRectGetMaxX(ImagePassword.frame)-10, ClolorViewH/2)];
    [self QuicklySetUpUITextField:_textFiledPassword UIFont:[UIFont systemFontOfSize:16]];
    _textFiledPassword.placeholder = @"请输入密码";
    //密码输入框要隐藏输入字符，以黑点代替
    _textFiledPassword.secureTextEntry = TRUE;
    _textFiledPassword.secureTextEntry = YES;//安全文本输入
    [ClolorView addSubview:_textFiledPassword];
    
    //线
    UIView* Line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_textFiledPassword.frame)-0.5, kScreenwidth, 0.5)];
    Line2.backgroundColor = LineColor;
    [ClolorView addSubview:Line2];
    
    
    //记住密码功能
    UILabel *rememberPwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenwidth-120,CGRectGetMaxY(ClolorView.frame)+10, 60, 40)];
    rememberPwdLabel.text = @"记住密码";
    rememberPwdLabel.numberOfLines =1;
    rememberPwdLabel.textColor = [UIColor orangeColor];
    rememberPwdLabel.font=[UIFont systemFontOfSize:14];
    [_MianScrollView addSubview:rememberPwdLabel];
    
    SavePwdBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenwidth-60,CGRectGetMaxY(ClolorView.frame)+10, 40, 40)];
    [SavePwdBtn setImage:[UIImage imageNamed:@"rember_pwd_normal"] forState:UIControlStateNormal];
    [SavePwdBtn setImage:[UIImage imageNamed:@"rember_pwd_select"] forState:UIControlStateSelected];
    [SavePwdBtn addTarget:self action:@selector(SavePwdBtnCilck:) forControlEvents:UIControlEventTouchUpInside];
    NSString* LocalPwd = [Utility GetLocalPassword];
    NSString* Accent   = [Utility GetUserAccent];
    //记住用户名和密码
    if (Accent)
    {
        _textFiledAccounts.text = Accent;
    }
    if (LocalPwd)
    {
        _textFiledPassword.text = LocalPwd;
        SavePwdBtn.selected = YES;
    }
    [_MianScrollView addSubview:SavePwdBtn];
    
    CGFloat LoginBtnY = CGRectGetMaxY(SavePwdBtn.frame)+LoginHeight;
    UIButton *LoginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    LoginBtn.frame = CGRectMake(20,LoginBtnY-5, kScreenwidth-40, 80/2);
    [self QuicklySetUpUIButton:LoginBtn UIButtonTitle:@"登录"];
    [_MianScrollView addSubview:LoginBtn];
    //点击登录
    [LoginBtn addTarget:self action:@selector(loginbtnClick:) forControlEvents:UIControlEventTouchUpInside];

    //点击背景图片则回收键盘
    self.view.userInteractionEnabled =YES;
    _MianScrollView.userInteractionEnabled = YES;
    //定义轻击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [_MianScrollView addGestureRecognizer:tap];
    _textFiledAccounts.delegate = self;
    _textFiledPassword.delegate = self;
}


- (void)SavePwdBtnCilck:(UIButton *)button
{
    [self.view endEditing:YES];
    button.selected = ! button.selected;
}

//Return点击回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

-(void)dealTap:(UITapGestureRecognizer *)tap
{
    //回收键盘
    [self.view endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
//    [UserInfoUtility sharedInstance].LocalsessionId = nil;
    [super viewDidAppear:animated];
}


-(void)loginbtnClick:(UIButton *)button
{
    // 3.2.让整个登录界面停止跟用户交互
    //self.view.userInteractionEnabled = NO;
    if(![self connectedToNetwork])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"网络连接失败,请查看网络是否连接正常！" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
        //self.view.userInteractionEnabled = YES;
    }
    else
    {
        //       dev_type  iOS传1，安卓传0 区分设备
        //启动活动指示器
        //_activityIndicatorView = [self.view addmyActivityIndicatorView:CGRectMake(3*X,Y+4*X+20+60, 2*X, X*2)];
        if ([_textFiledAccounts.text isEqualToString:@""])
        {
            [Utility showTitle:@"请填写账号!"];
            return;
        }
//        [[UserInfoUtility sharedInstance]Login:_textFiledAccounts.text password:_textFiledPassword.text completion:^(BOOL Success, NSDictionary *json) {
//            if (Success) {
//                
//                NSString* resTitle = [json objectForKey:@"msg"];
//                //登陆成功取消节面
//                if (self.isDelegateRoot) {
//                    [self PresRootVc:resTitle];
//                }
//                else
//                {
//                    [self dismissViewControllerAnimated:YES completion:^{
//                        [[NSNotificationCenter defaultCenter] postNotificationName:LogInSuccess object:nil];
//                        if (resTitle != nil) {
//                            [Utility showTitle:resTitle];
//                        }
//                        if ([Utility GetLoginUpdate]) {
//#ifdef AppSotreUpdate
//#else
//                            [self checkVersion];
//#endif
//                        }
//                    }];
//                }
//                [Utility SetPassword:_textFiledPassword.text];
//                [Utility SetUserAccent:_textFiledAccounts.text];
//                if (SavePwdBtn.selected) {
//                    [Utility SetLocalPassword:_textFiledPassword.text];
//                }
//                else
//                {
//                    [Utility SetLocalPassword:nil];
//                }
//            }
//            else
//            {
//                if (json[@"sessionId"]==nil) {
//                    NSString* msg = json[@"msg"];
//                    if (msg != nil) {
//                        if ([msg isEqualToString:@"用户名密码错误!"]) {
//                            msg = @"对不起，您的用户名或密码输入有误!";
//                        }
//                        [Utility showTitle:msg];
//                    }
//                    else
//                    {
//                        msg = @"对不起，您的用户名或密码输入有误!";
//                        [Utility showTitle:msg];
//                    }
//                    //[_activityIndicatorView stopAnimating];
//                    //震动
//                    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
//                    // 2.发抖
//                    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
//                    anim.repeatCount = 1;
//                    anim.values = @[@-10, @10, @-10];
//                    [_loginView.layer addAnimation:anim forKey:nil];
//                    
//                }
//            }
//        }];
    }
}

- (void)checkVersion
{
    //检查新版本
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setObject:@"1" forKey:@"platform"];
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *oldVersionString = plistDic[@"CFBundleShortVersionString"];//当前版本号
    
    [params setObject:oldVersionString forKey:@"version_no"];
    
//    [[CFAPIClient sharedInstance] requestWithMethod:HTTPPOSTMETHOD  withPath:VersionUpdateURL withParams:params onCompletion:^(NSDictionary *json) {
//        debugLog(@"res = %@",json);
//        NSString* Remark = [json objectForKey:@"remark"];
//        NSString* VerupdateUrl = [json objectForKey:@"url"];
//        if (VerupdateUrl == nil) {
//            //当前已是最新版本不需要更新
//            return;
//        }
//        UIWindow *window = [(AppDelegate *)[[UIApplication sharedApplication]delegate]window];
//        for (UIView *view in [window subviews]) {
//            if ([view isKindOfClass:[UIVersionUpdateView class]]) {
//                return;
//            }
//        }
//        
//        UIVersionUpdateView * updateVersion = [[UIVersionUpdateView alloc]init];
//        updateVersion.Remark = Remark;
//        updateVersion.VerupdateUrl = VerupdateUrl;
//        [updateVersion show];
//    } onFailure:^(NSString *errorCode) {
//        
//    }];
}

- (void)PresRootVc:(NSString*)msg
{
    FSTabBarViewController* tabBarViewController = [[FSTabBarViewController alloc]init];
    UINavigationController* NavContoller = [[UINavigationController alloc]initWithRootViewController:tabBarViewController];
    UIFont* font;
    if (iphone4S) {
        font = Font(18);
    }
    else
    {
        
        font = Font(20);
    }
    
    [NavContoller.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                        [UIColor whiteColor], NSForegroundColorAttributeName,
                                                        font, NSFontAttributeName,
                                                        nil]];
    
    [NavContoller.navigationBar setBackgroundImage:[UIImage imageNamed:@"bar"] forBarMetrics:UIBarMetricsDefault];
    
    
    //[self.window setRootViewController:NavContoller];
    [self presentViewController:NavContoller animated:YES completion:^{
        if (msg != nil) {
            [Utility showTitle:msg];
        }
    }];
}

- (void)AccountChange
{
    //清除密码框数据
    [_textFiledPassword setText:@""];
}

#pragma mark ---判断网络是否连接正常
-(BOOL) connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

#pragma mark--快速设置按钮
- (UIButton *)QuicklySetUpUIButton :(UIButton *)button UIButtonTitle:(NSString *)text
{
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    UIImage *whiteColorImage = [Utility createImageWithColor:OrangeColor];
    UIImage *blueColorImage = [Utility createImageWithColor:OrangeColor];
    [button setBackgroundImage:whiteColorImage forState:UIControlStateNormal];
    [button setBackgroundImage:blueColorImage forState:UIControlStateHighlighted];
    Radiucorner(button)//圆角
    [button setTitle:text forState:UIControlStateNormal];
    [button.titleLabel setTextAlignment:NSTextAlignmentNatural];
    [button setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    return button;
}

@end
