//
//  LogInUtility.h
//

#import <Foundation/Foundation.h>


@interface UserInfoUtility : NSObject
+ (UserInfoUtility *)sharedInstance;
- (void)setDic:(NSDictionary*)dict;
@property (nonatomic,copy)NSString* roleName;//公司名称
@property (nonatomic,copy)NSString* baseUrl;//头像网址

@property (nonatomic,assign)NSInteger ifPriv;
@property (nonatomic)NSString* userid;//用户id
@property (nonatomic)NSString* listid;//listid
@property (nonatomic,copy)NSString* userName;//用户名
@property (nonatomic,copy)NSString* deptName;//部门名称
@property (nonatomic,copy)NSString* UserPassword;//密码

@property (nonatomic,copy)NSString* imAccent;//账号
@property (nonatomic,copy)NSString* imPassWord;//密码



//- (FriendModel*)FindModelFromuserId:(NSString*)userId;
//- (FriendModel*)FindModelFromlistId:(NSString*)listId;

+ (void)LoginName:(NSString*)loginName password:(NSString*)password;
//****************************************************************************
//相关联的字典表
//****************************************************************************
//登录相关
- (void)GetDictValues;

//发送设备注册id
- (void)sendRegistrationID;
//数据库本地化
- (NSMutableArray*)GetLocalMailPanList;
//登录
- (void)Login:(NSString*)LoginName password:(NSString*)password completion:(void(^)(BOOL Success, NSDictionary* json))completion;
//是否是直接登录的方式
@property (nonatomic)BOOL isDelegateRoot;
//****************************************************************************
//极光推送
@property (nonatomic,retain)NSString* registrationID;

//****************

//***作为所有界面的头部视图*************************************************************************
@property (nonatomic,retain)UIViewController* RootViewController;
//****************************************************************************
//第三方登录
@property (nonatomic)BOOL isotherLogin;
//****************************************************************************

/**版本更新相关信息存储*/
//自己头像的默认图
@property (nonatomic,strong)UIImage *NormalImage;

//****************************************************************************
//内存公用数据
//部门列表
@property (nonatomic,strong)NSMutableArray *DepartList;
//人员列表
@property (nonatomic,strong)NSMutableArray *MemberList;
//会议室列表
@property (nonatomic,strong)NSMutableArray *MeetingRoomList;
//会议类型列表
@property (nonatomic,strong)NSMutableArray *MeetingTypeList;
//LocalsessionId
@property (nonatomic,strong)NSString* LocalsessionId;
//****************************************************************************
@end
