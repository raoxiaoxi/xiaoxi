//
//  Utility.h
//

#import <Foundation/Foundation.h>
//#import <BaiduMapAPI/BMapKit.h>
#import <objc/runtime.h>
#import <Photos/Photos.h>
#import <CommonCrypto/CommonDigest.h>
#import <AddressBook/AddressBook.h>
#ifndef __Utility_h
#define __Utility_h

@interface Utility : NSObject
//对图片进行圆形绘制
+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;
//对图片进行尺寸压缩
+(UIImage*)imageWithImage:(UIImage*)image scaledToWidth:(NSInteger)Width;
+(UIImage*)imageWithImage:(UIImage*)image scaledToHeight:(NSInteger)Height;

//判断是否为ip
+ (BOOL)validateIP:(NSString*)IP;
//计算字符长度
+ (NSUInteger) unicodeLengthOfString: (NSString *) text;
//计算文字高宽
+ (CGSize)GetContentSize:(NSInteger)Font Msg:(NSString*)Msg Width:(NSInteger)width;
//时间轴转换
+ (NSString *)Date2String:(NSString *)date;

//会议专用时间轴转换
+ (NSString *)Date3String:(NSString *)date;
//时间轴转换hymydmh
+ (NSString*)Date2Stringhydmh:(NSString *)date Fmt:(NSString*)fmt;

//时间数据转换
+ (NSDate*)ConvertDateFromString:(NSString*)uiDate withfmt:(NSString*)fmt;

//登陆账号
+ (void)SetUserAccent:(NSString*)Accent;
+ (NSString*)GetUserAccent;

//保存密码存储
+ (NSString *)GetLocalPassword;
+ (void)SetLocalPassword:(NSString*)Password;

//登陆密码存储
+ (NSString *)GetPassword;
+ (void)SetPassword:(NSString*)Password;

//登录用户名
+ (void)SetUserName:(NSString*)LocaluserName;
+ (NSString*)GetUserName;

//部门
+ (void)SetDeptName:(NSString*)deptName;
+ (NSString*)GetDeptName;


//有没有审批权限-1表示无。1表示有
+ (void)SetifPriv:(NSInteger)ifPriv;
+ (NSInteger)GetifPriv;

//时间转换
+ (NSString *)stringFromDate:(NSDate *)date withfmt:(NSString*)fmt;
//递归查找父对象
+ (UIViewController*)traverforuiviewcontroller:(UIView*)parent;

//获取路径
+ (NSString *)getCacheDirectory;

+ (void)SetPathArray:(NSArray*)patharray Array:(NSString*)pathstr;
//调试信息
+ (void)showTitle:(NSString*)Title;
+ (void)showAlertimageViewTitle:(NSString *)title;
//获得当前显示的vc
+ (UINavigationController *)getCurrentVC;
//网络处理
+ (AFHTTPRequestOperationManager *)getManager;

//提供足迹调用的本地纪录
+ (NSArray*)GetFootmarkHisory;
//写入本地时间纪录
//*************Type是新闻。公告。流程之类的
+ (void)SetFootmarkHisoryType:(NSString*)Type DetailInfo:(NSString*)Title;
//删除当天历史纪录
+ (void)RemoveDateHistory:(NSString*)Date;
//删除历史纪录单条
+ (void)RemoveFootmarkHistory:(NSDictionary*)dic;
//*************************************

//每次更新进行版本检查是否
+ (void)SetLoginUpdate:(BOOL)update;
+ (BOOL)GetLoginUpdate;


+ (NSString *)getUserFaceCacheDirectory;
//毛玻璃处理
+ (void)BarEffectStyle:(BOOL)hide;
+ (void)setExtraCellLineHidden: (UITableView *)tableView;
+ (void)TableViewSeparatorColor :(UITableView *)tableview;
//创建颜色
+ (UIImage*)createImageWithColor:(UIColor*) color;


//时间年月日转化
+ (NSString *)DateWithDateString :(NSDate*)Date Fmt:(NSString*)fmt;


/**
 *  适配HTML代码的CSS
 *
 *  @param HtmlString HTML标签语句的字符串
 *  @param textFont   文字的大小
 *
 *  @return 返回带有CSS适配的HTML字符串
 */
+ (NSString *)SetCSSScreenAdaptationWithHTMLString:(NSString *)HtmlString textFont:(CGFloat )textFont;
+ (NSString *)getDiffTime:(long long)time withCurrentTime:(long long )currentTime;

#pragma mark -相机、相册权限
+ (BOOL)isGetCameraPermission;




@end
#endif