//
//  LogInUtility.m
//

#import "UserInfoUtility.h"
//#import "LogInViewController.h"
//#import "UIVersionUpdateView.h"
@implementation UserInfoUtility

+(UserInfoUtility *)sharedInstance {
    static UserInfoUtility *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [self alloc];
    });
    
    return sharedInstance;
}

- (void)setJSONDic:(NSDictionary*)dict
{
    self.deptName = dict[@"deptName"];
    self.ifPriv = [dict[@"ifPriv"]intValue];
    self.roleName = dict[@"roleName"];
    self.userid = [NSString stringWithFormat:@"%@",dict[@"userId"]];
    self.userName = dict[@"userName"];
    self.listid = [NSString stringWithFormat:@"%@",dict[@"listId"]];

    [Utility SetUserName:dict[@"userName"]];
    [Utility SetDeptName:dict[@"deptName"]];
    [Utility SetifPriv:[dict[@"ifPriv"]intValue]];
    self.imAccent = dict[@"imUserName"];
    self.imPassWord = dict[@"imPassWord"];
    
    self.LocalsessionId = dict[@"sessionId"];
}


+ (void)LoginName:(NSString*)loginName password:(NSString*)password
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    if (loginName) {
        [sessionId setObject:loginName forKey:@"LoginName"];
    }
    else
    {
        [sessionId removeObjectForKey:@"LoginName"];
    }
    if (password) {
        [sessionId setObject:password forKey:@"password"];
    }
    else
    {
        [sessionId removeObjectForKey:@"password"];
    }
    [sessionId synchronize];
}



//通讯录本地化
- (void)setLocalMailPanlListCompletion:(NSArray*)completionArray
{
//    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
//    NSMutableArray* MailPanlListArray = [NSMutableArray array];
//    for(FriendModel* model in completionArray)
//    {
//        NSDictionary* dicaddressmodel = [model getDic];
//        [MailPanlListArray addObject:dicaddressmodel];
//    }
//    [userdefault setObject:MailPanlListArray forKey:@"MailPanlListArray"];
}

- (NSMutableArray*)GetLocalMailPanList
{
    NSMutableArray* modelArray = [NSMutableArray array];
    
//    NSArray* MailPanlListArray = [[NSUserDefaults standardUserDefaults]arrayForKey:@"MailPanlListArray"];
//    for (NSDictionary* dicmodel in MailPanlListArray) {
//        FriendModel* model = [[FriendModel alloc]init];
//        [model setDic:dicmodel];
//        [modelArray addObject:model];
//    }
    return modelArray;
}

////向服务器发送RegistrationID
//- (void)sendRegistrationID
//{
//    if ([UserInfoUtility sharedInstance].registrationID.length != 0) {
//        //向服务发送regid
//        NSMutableDictionary* params = [NSMutableDictionary dictionary];
//        [params setObject:[UserInfoUtility sharedInstance].registrationID forKey:@"cid"];//RegistrationID
//        [params setObject:@"1" forKey:@"dev_type"];
//        
//        [[CFAPIClient sharedInstance]requestWithPath:UpdateUserAppidURL withParams:params ShowLoadFrame:NavCFAPIClient(kScreenwidth/2 - 40) onCompletion:^(NSDictionary *json) {
//            debugLog(@"res = %@",json);
//        } onFailure:^(NSString *errorCode){
//        }];
//    }
//}
//
///**版本更新相关信息存储*/
//
////获取人员列表信息
//- (void)createMemberPost
//{
//    // 1.拼接请求参数
//    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
//    
//    [[CFAPIClient sharedInstance] requestWithMethod:HTTPPOSTMETHOD  withPath:GetSysUserDepartListURL withParams:params onCompletion:^(NSDictionary *json) {
//        NSDictionary *dict = json;
//        NSArray *list= dict[@"userList"];
//        NSArray *deptList = dict[@"deptList"];
//        [Utility SetPathArray:list Array:@"userarray"];
//        [Utility SetPathArray:deptList Array:@"deptarray"];
//    } onFailure:^(NSString *errorCode) {
//        
//    }];
//}
//
//- (void)GetDictValues
//{
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:LogInSuccess object:nil];
//    [self.userInfoList removeAllObjects];
//    //获取通讯录
//    [self GetMailPanlListCompletion:^(bool Success) {
//        
//    }];
//    //登陆im
//    [self loginIM];
//    
//    [self sendRegistrationID];
//    
//    //获取会议室类型
//    [self GetRoomList];
//    //获取成员和部门列表
//    [self GetDepartMemberList];
//}
//
////登录
//- (void)Login:(NSString*)LoginName password:(NSString*)password completion:(void(^)(BOOL Success, NSDictionary* json))completion
//{
////    [UserInfoUtility OpenID:nil Type:nil enterpriseId:[[NSUserDefaults standardUserDefaults] objectForKey:@"enterpriseId"]];
//    if (LoginName == nil || password == nil) {
//        return;
//    }
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    [params setObject:LoginName forKey:@"user.userName"];
//    [params setObject:password forKey:@"user.userPwd"];
//    [params setObject:@"skSOzRVDCJ7V8ut6v5aCO9" forKey:@"appId"];
//    [params setObject:@"Wf9ptDbGf37cGYBfHugXD3" forKey:@"appKey"];
//    [params setObject:@"1" forKey:@"dev_type"];
//    
//    [[CFAPIClient sharedInstance] requestWithMethod:HTTPPOSTMETHOD  withPath:LoginURL withParams:params onCompletion:^(NSDictionary *json) {
//        debugLog(@"res = %@",json);
//        NSDictionary *dict = json;
//        
//        NSInteger errorcode = [[json objectForKey:@"status"]intValue];
//        NSLog(@"dict=%@",dict[@"msg"]);
//        if (dict[@"sessionId"] == nil) {
//            completion(NO,json);
//            LoginViewController* loginview = [[LoginViewController alloc]init];
//            [self.RootViewController presentViewController:loginview animated:YES completion:^{
//                NSString* msg = dict[@"msg"];
//                if (msg != nil) {
//                    if ([msg isEqualToString:@"未登录"]) {
//                        msg = @"登录已失效，请重新登录!";
//                    }
//                    [Utility showTitle:msg];
//                    [Utility SetPassword:nil];
//                }
//            }];
//        }
//        else
//        {
//            [self setJSONDic:json];
//            completion(YES,json);
//            
//            [self GetDictValues];
//            if ([Utility GetLoginUpdate] && errorcode == 1) {
//#ifdef AppSotreUpdate
//#else
//                [self checkVersion];
//#endif
//            }
////            [SamTonFlowSDK setUserId:[UserInfoUtility sharedInstance].userid];//设置用户ID（每次请求数据前传入）
//            [SamTonFlowSDK setUserId:@"21228041-54C6-475E-93E5-A9AAD71C6EFE"];//每次请求数据前传入
//
//        }
//    } onFailure:^(NSString *errorCode) {
//        
//    }];
//}
//
//}

@end
