//
//  AppDelegate.m
//  FunSchool
//
//  Created by xiaoxi1989 on 16/6/27.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "AppDelegate.h"
#import "FSTabBarViewController.h"
#import "FSNavigationController.h"
@interface AppDelegate ()
{
    UINavigationController *nav;
    FSTabBarViewController *tabBarViewController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (NSFoundationVersionNumber_iOS_7_0) { // 判断是否是IOS7
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//状态栏字体白色
    //    __weak NSString* i = @"312";
    //    __block NSString* s = @"455";
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        NSLog(@"i=%@",i);
    //        NSLog(@"s=%@",s);
    //    });
    //    i = @"5555";
    //    s = @"3333";
    //
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //为Nav添加背景色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    //引导图
//    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
//    NSString *VersionString = plistDic[@"CFBundleShortVersionString"];//当前版本号
//    NSString *oldVersionString = [[NSUserDefaults standardUserDefaults]objectForKey:@"CFBundleShortVersionString"];//原版本号
//    if (![oldVersionString isEqualToString:VersionString])
//    {
//        LoginViewController *login = [[LoginViewController alloc]init];
//        login.isDelegateRoot = YES;
//        [self.window setRootViewController:login];
//        [Utility SetPassword:nil];
//        [self.window makeKeyAndVisible];
//        UIWelcomeView* welcomeView = [[UIWelcomeView alloc]init];
//        [welcomeView show];
        
        
        //第一次登陆
//    }else{
//        NSString* pwd = [Utility GetPassword];
//        if (pwd == nil) {
//            //退出登录状态
//            LoginViewController *login = [[LoginViewController alloc]init];
//            login.isDelegateRoot = YES;
//            [self.window setRootViewController:login];
//        }
//        else
//        {
//            
//            //后台登录处理
//            NSString *loginName = [Utility GetUserAccent];
//            NSString *password = [Utility GetPassword];
//            
//            [[UserInfoUtility sharedInstance]Login:loginName password:password completion:^(BOOL Success, NSDictionary *json) {
//            }];
        
    
            tabBarViewController = [[FSTabBarViewController alloc]init];
            FSNavigationController* NavContoller = [[FSNavigationController alloc]initWithRootViewController:tabBarViewController];
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
//            [[UINavigationBar appearance] setBackgroundColor:[UIColor orangeColor]];
            [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
            [self.window setRootViewController:NavContoller];
//            [UserInfoUtility sharedInstance].isDelegateRoot = YES;
    
//        }
        [self.window makeKeyAndVisible];
//    }
    
  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
