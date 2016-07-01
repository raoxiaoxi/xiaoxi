//
//  CFAPIClient.m
//  ChineseFit
//
//  Created by Eason Feng on 13-8-12.
//

#import "CFAPIClient.h"
#import "AFNetworking.h"
#import "Utility.h"
#import "AFDownloadRequestOperation.h"
#import "LoginViewController.h"
#import "FSTabBarViewController.h"
#import "LoadingView.h"

@implementation CFAPIClient

+(CFAPIClient *)sharedInstance {
    static CFAPIClient *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [self alloc];
    });
    
    return sharedInstance;
}

- (void)requestWithMethod:(NSString *)method withPath:(NSString *)url withParams:(NSMutableDictionary *)params onCompletion:(JSONResponseBlock)completionBlock onFailure:(ErrorBack)onfailure
{
    [self requestWithPath:url withParams:params showLoading:YES ShowLoadFrame:CGRectZero onCompletion:completionBlock onFailure:onfailure];
}

- (void)requestWithPath:(NSString *)url
             withParams:(NSMutableDictionary *)params
          ShowLoadFrame:(CGRect)ShowLoadFrame
           onCompletion:(JSONResponseBlock)completionBlock
              onFailure:(ErrorBack)onfailure
{
    [self requestWithPath:url withParams:params showLoading:YES ShowLoadFrame:ShowLoadFrame onCompletion:completionBlock onFailure:onfailure];
}

- (void)requestWithPath:(NSString *)url
             withParams:(NSMutableDictionary *)params
            showLoading:(BOOL)showLoading
           onCompletion:(JSONResponseBlock)completionBlock
              onFailure:(ErrorBack)onfailure
{
    [self requestWithPath:url withParams:params showLoading:showLoading ShowLoadFrame:CGRectZero onCompletion:completionBlock onFailure:onfailure];
}

- (void)requestWithPath:(NSString *)url
             withParams:(NSMutableDictionary *)params
            showLoading:(BOOL)showLoading
          ShowLoadFrame:(CGRect)ShowLoadFrame
           onCompletion:(JSONResponseBlock)completionBlock
              onFailure:(ErrorBack)onfailure
{
    
    if (!params) {
        params = [[NSMutableDictionary alloc] init];
    }
    if ([self GetLoadingStatue:url]) {
        //表示该url正在发送请求。则丢弃
        return;
    }
    [self SetLoadingStatue:YES LoadingUrl:url];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //当前没有加载的时候
        if([self GetLoadingStatue:url])
        {
//            Loadingview = [[UILoadingView alloc]init];
//            [Loadingview show];
        }
    });
    
    
    //为其绑定sessionId
//    if ([UserInfoUtility sharedInstance].LocalsessionId) {
//        [params setObject:[UserInfoUtility sharedInstance].LocalsessionId forKey:@"sessionId"];
//    }
//    else
//    {
//        debugLog(@"sessionid = nil");
//    }
    NSString* strurl = [NSString stringWithFormat:@"%@%@",APIHost,url];
    NSMutableString *postString = [strurl mutableCopy];
    [postString appendString:@"?"];
    NSArray *allKeys = [params allKeys];
    for (int i = 0; i < [allKeys count]; i++) {
        NSString *key = [allKeys objectAtIndexedSubscript:i];
        NSString *value = [params objectForKey:key];
        [postString appendFormat:@"%@=%@",key,value];
        if (i != [allKeys count] - 1) {
            [postString appendString:@"&"];
        }
    }
    [postString appendFormat:@"%u",arc4random()%9999999];
    
    debugLog(@"strurl = %@",postString);
//    if (![url isEqualToString:LoginURL] && [UserInfoUtility sharedInstance].LocalsessionId.length == 0) {
//        //不为登录请求。并且sessionid为空都进行抛弃
//        return;
//    }
    [[Utility getManager] POST:strurl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self SetLoadingStatue:NO LoadingUrl:url];
        [[UILoadingView sharedInstance] hide];
        NSString* strcode = [responseObject objectForKey:@"status"];
      
        NSInteger code = [strcode intValue];
        if (code < -999)
        {
            [self relogin:responseObject];
            //登陆超时重新登录
            if(completionBlock)
                completionBlock(nil);
        }
        else
        {
            if(completionBlock)
                completionBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self SetLoadingStatue:NO LoadingUrl:url];
        [[UILoadingView sharedInstance] hide];
        
        
        NSDictionary* errdic = [NSDictionary dictionaryWithObject:[error localizedDescription] forKey:@"error"];
        NSString* strerr = [errdic objectForKey:@"error"];
        if ([strerr isEqualToString:@"Could not connect to the server."]) {
            [Utility showTitle:@"网络连接失败！"];
            LoginViewController *login=[[LoginViewController alloc] init];
            UINavigationController* norcurret = [Utility getCurrentVC];
            if ([norcurret isKindOfClass:[LoginViewController class]]) {
                return ;
            }
            [norcurret presentViewController:login animated:YES completion:^{
                
            }];
            return;
        }
        else if([strerr isEqualToString:@"未能连接到服务器。"])
        {
            [Utility showTitle:@"网络连接失败！"];
            LoginViewController *login=[[LoginViewController alloc] init];
            UINavigationController* norcurret = [Utility getCurrentVC];
            if ([norcurret isKindOfClass:[LoginViewController class]]) {
                return ;
            }
            [norcurret presentViewController:login animated:YES completion:^{
                
            }];
            return;
        }
        else if([strerr isEqualToString:@"请求超时。"])
        {
            [Utility showTitle:strerr];
        }
        if (onfailure)
            onfailure(@"error");
#ifdef DEBUG
        [Utility showTitle:strerr];
#endif
        //completionBlock([NSDictionary dictionaryWithObject:[error localizedDescription] forKey:@"error"]);
    }];
}

- (void)relogin:(NSDictionary*)responseObject
{
    
    //后台登录处理
//    NSString *loginName = [Utility GetUserAccent];
//    NSString *password = [Utility GetPassword];
//    [Utility SetUserAccent:nil];
//    [Utility SetPassword:nil];
//    [[UserInfoUtility sharedInstance]Login:loginName password:password completion:^(BOOL Success, NSDictionary *json) {
//        if (Success) {
//            if (loginName) {
//                [Utility SetUserAccent:loginName];
//                [Utility SetPassword:password];
//            }
//        }
//        else
//        {
//            NSString* msg = [responseObject objectForKey:@"msg"];
//            if ([msg isEqualToString:@"未登录"]) {
//                msg = @"登录已失效，请重新登录!";
//                [Utility showTitle:msg];
//            }
//            else
//            {
//                [Utility showTitle:msg];
//            }
//            LoginViewController *login=[[LoginViewController alloc] init];
//            UINavigationController* norcurret = [Utility getCurrentVC];
//            if ([norcurret isKindOfClass:[LoginViewController class]]) {
//                return ;
//            }
//            [[NSNotificationCenter defaultCenter] postNotificationName:logoutviewchange object:nil];
//            [norcurret presentViewController:login animated:YES completion:^{
//                
//            }];
//
//        }
//    }];
}

+ (void)AFNetWorkDownLoadInfo:(NSString*)SavePath
                  DownloadUrl:(NSURL*)url
             Downloadcallback:(void(^)(float percentDone, float DownData, float TotalData))back
              DownloadSuccess:(void(^)())DownSuccess
               NetWorkfailure:(void(^)())NetWorkfailureBack
{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:3600];
    
    AFDownloadRequestOperation *operation = [[AFDownloadRequestOperation alloc] initWithRequest:request targetPath:SavePath shouldResume:YES];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        DownSuccess();
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NetWorkfailureBack();
        NSLog(@"Error: %@", error);
    }];
    [operation setProgressiveDownloadProgressBlock:^(NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile) {
        float percentDone = (totalBytesReadForFile/(float)totalBytesExpectedToReadForFile)*100;
        
        float DownData = (float)totalBytesReadForFile/1024/1024.0;
        float TotalData = (float)totalBytesExpectedToReadForFile/1024/1024.0;
        if (back) {
            back(percentDone,DownData,TotalData);
        }
    }];
    [operation start];
}

+ (void)AFNetWorkUploadInfoURL:(NSString*)url
                    parameters:(NSMutableDictionary*)parameters
                       ShowMsg:(BOOL)showMsg
                   ShowLoading:(BOOL)showLoading
                    uploadFile:(void (^)(id <AFMultipartFormData> formData))block
                uploadcallback:(void(^)(id responseObject))back
                 SessionStatue:(void(^)(BOOL isfailure))failureBack
                NetWorkfailure:(void(^)())NetWorkfailureBack
{
//    if ([[UserInfoUtility sharedInstance] LocalsessionId]) {
//        if (parameters == nil) {
//            parameters = [NSMutableDictionary dictionary];
//        }
//        [parameters setObject:[[UserInfoUtility sharedInstance] LocalsessionId] forKey:@"sessionId"];
//    }
//    else
//    {
//        //debugLog(@"sessionid = nil");
//    }
    UILoadingView *Loading = [[UILoadingView alloc]init];
    
    [Loading setTitleLond:@"上传中..."];
    [Loading show];
    NSString* strurl = [NSString stringWithFormat:@"%@%@",APIHost,url];
    debugLog(@"%@",strurl);
    [[Utility getManager] POST:strurl parameters:parameters constructingBodyWithBlock:block success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //服务器返回数据
        [Loading hide];
        //[Utility showTitle:@"上传成功"];
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        if (code != 0)
        {
            
        }
        else
        {
            if (responseObject)
                back(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //网络问题发送失败或者接口错误
        [Loading hide];
        [Utility showAlertimageViewTitle:@"上传失败"];
    }];
}

- (void)SetLoadingStatue:(BOOL)isLoading LoadingUrl:(NSString*)Loading
{
    NSString *str = [NSString stringWithFormat:@"%d",isLoading];
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:Loading];
    [settings setObject:str forKey:Loading];
}

- (BOOL)GetLoadingStatue:(NSString*)Loading;
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    BOOL IsLoading = [[settings objectForKey:Loading]intValue] ? YES : NO;
    [settings removeObjectForKey:Loading];
    return IsLoading;
}

@end
