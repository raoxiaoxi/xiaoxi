//
//  CFAPIClient.h
//  ChineseFit
//
//  Created by Eason Feng on 13-8-12.
//

//#import "AFHTTPClient.h"

#import "AFURLRequestSerialization.h"

typedef void (^JSONResponseBlock) (NSDictionary* json);
typedef void (^ErrorBack) (NSString* errorCode);
typedef void (^ImageResponseBlock) (UIImage* image);

@interface CFAPIClient : NSObject

+(CFAPIClient *)sharedInstance;

//原本请求
- (void)requestWithMethod:(NSString *)method withPath:(NSString *)url withParams:(NSMutableDictionary *)params onCompletion:(JSONResponseBlock)completionBlock onFailure:(ErrorBack)onfailure;

//新增参数showloadingframe loading布局位置
//是否显示位置
- (void)requestWithPath:(NSString *)url
             withParams:(NSMutableDictionary *)params
          ShowLoadFrame:(CGRect)ShowLoadFrame
           onCompletion:(JSONResponseBlock)completionBlock
              onFailure:(ErrorBack)onfailure;

//新增参数 showloading
- (void)requestWithPath:(NSString *)url
             withParams:(NSMutableDictionary *)params
            showLoading:(BOOL)showLoading
           onCompletion:(JSONResponseBlock)completionBlock
              onFailure:(ErrorBack)onfailure;


+ (void)AFNetWorkDownLoadInfo:(NSString*)SavePath
                  DownloadUrl:(NSURL*)url
             Downloadcallback:(void(^)(float percentDone, float DownData, float TotalData))back
              DownloadSuccess:(void(^)())DownSuccess
               NetWorkfailure:(void(^)())NetWorkfailureBack;

+ (void)AFNetWorkUploadInfoURL:(NSString*)url
                    parameters:(NSMutableDictionary*)parameters
                       ShowMsg:(BOOL)showMsg
                   ShowLoading:(BOOL)showLoading
                    uploadFile:(void (^)(id <AFMultipartFormData> formData))block
                uploadcallback:(void(^)(id responseObject))back
                 SessionStatue:(void(^)(BOOL isfailure))failureBack
                NetWorkfailure:(void(^)())NetWorkfailureBack;
@end
