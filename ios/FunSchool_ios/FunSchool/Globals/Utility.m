//
//  Utility.m
//

#import "Utility.h"
#import "MyAlertView.h"
#import "LoadingView.h"
#import "Toast+UIView.h"
@implementation Utility

+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

//对图片尺寸进行压缩--
+(UIImage*)imageWithImage:(UIImage*)image scaledToWidth:(NSInteger)Width
{
    
    CGSize imagesize;
    
    imagesize.height = (image.size.height/image.size.width)*Width;
    imagesize.width = Width;
    
    UIGraphicsBeginImageContext(imagesize);
    [image drawInRect:CGRectMake(0,0,imagesize.width,imagesize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

+(UIImage*)imageWithImage:(UIImage*)image scaledToHeight:(NSInteger)Height
{
    CGSize imagesize;
    
    imagesize.height = Height;
    imagesize.width = (image.size.width/image.size.height)*Height;;
    
    UIGraphicsBeginImageContext(imagesize);
    [image drawInRect:CGRectMake(0,0,imagesize.width,imagesize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (BOOL)validateIP:(NSString*)IP
{
    NSString*IPRegecx = @"\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b";
    NSPredicate *nspiP = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",IPRegecx];
    return [nspiP evaluateWithObject:IP];
}

+ (NSUInteger) unicodeLengthOfString: (NSString *) text {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    NSUInteger unicodeLength = asciiLength / 2;
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return unicodeLength;
}

+ (CGSize)GetContentSize:(NSInteger)Font Msg:(NSString*)Msg Width:(NSInteger)width
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:Font]};
    CGSize contentSize=[Msg boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return contentSize;
}

#pragma mark---时间戳转化
+ (NSString *)Date2String:(NSString *)date
{
    if (date == nil) {
        return nil;
    }
    NSString *string = [NSString stringWithFormat:@"%@",date];
    NSString *subString = [string substringToIndex:10];
    int a = [subString intValue];
    long b=a+28800;//8小时时差28800
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:b];
    NSString *mysubString = [NSString stringWithFormat:@"%@",confromTimesp];
    date = [mysubString substringToIndex:19];
    NSString *dataString = [date substringToIndex:10];
    return dataString;
}

+ (NSString *)Date3String:(NSString *)date
{
    if (date == nil) {
        return nil;
    }
    NSString *string = [NSString stringWithFormat:@"%@",date];
    NSString *subString = [string substringToIndex:10];
    int a = [subString intValue];
    long b=a+28800;//8小时时差28800
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:b];
    NSString *mysubString = [NSString stringWithFormat:@"%@",confromTimesp];
    date = [mysubString substringToIndex:19];
    NSString *dataString = [date substringToIndex:16];
    return dataString;
}

+ (NSString*)Date2Stringhydmh:(NSString *)date Fmt:(NSString*)fmt
{
    NSInteger IntDateString = [date longLongValue]/1000.0;
    NSDate *DATE = [NSDate dateWithTimeIntervalSince1970:IntDateString];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:fmt];
    NSString* DateString = [formatter stringFromDate:DATE];
    return DateString;
}

+ (NSDate*)ConvertDateFromString:(NSString*)uiDate withfmt:(NSString*)fmt
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:fmt];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

+ (void)SetUserName:(NSString*)LocaluserName
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    [userdef setObject:LocaluserName forKey:@"LocaluserName"];
    [userdef synchronize];
}

//获取用户名
+ (NSString*)GetUserName
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSString* userName = [userdef objectForKey:@"LocaluserName"];
    return userName;
}

/**
 *  部门
 */
+ (void)SetDeptName:(NSString*)deptName
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    [userdef setObject:deptName forKey:@"deptName"];
    [userdef synchronize];
}

/**
 *  获取部门
 */
+ (NSString*)GetDeptName
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSString* deptName = [userdef objectForKey:@"deptName"];
    return deptName;
}



+ (NSString*)GetUserAccent
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    NSString* strsessionId = [sessionId objectForKey:@"LocalUserAccent"];
    return strsessionId;
}

+ (void)SetUserAccent:(NSString*)Accent
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    [sessionId setObject:Accent forKey:@"LocalUserAccent"];
    [sessionId synchronize];
}

//登陆密码存储
+ (NSString *)GetPassword
{
    NSUserDefaults *Password = [NSUserDefaults standardUserDefaults];
    NSString* strPassword= [Password objectForKey:@"Password"];
    return strPassword;
}

+ (void)SetPassword:(NSString*)Password
{
    NSUserDefaults *PasswordDef = [NSUserDefaults standardUserDefaults];
    if (Password == nil) {
        [PasswordDef removeObjectForKey:@"Password"];
    }
    else
    {
        [PasswordDef setObject:Password forKey:@"Password"];
    }
    [PasswordDef synchronize];
}

//保存密码存储
+ (NSString *)GetLocalPassword
{
    NSUserDefaults *Password = [NSUserDefaults standardUserDefaults];
    NSString* strPassword= [Password objectForKey:@"LocalPassword"];
    return strPassword;
}

+ (void)SetLocalPassword:(NSString*)Password
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    if (Password == nil) {
        [sessionId removeObjectForKey:@"LocalPassword"];
    }
    else
    {
        [sessionId setObject:Password forKey:@"LocalPassword"];
    }
    
    [sessionId synchronize];
}

+ (void)SetifPriv:(NSInteger)ifPriv
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    if (ifPriv == 0) {
        ifPriv = -1;
    }
    NSString* strifPriv = [NSString stringWithFormat:@"%ld",(long)ifPriv];
    [sessionId setObject:strifPriv forKey:@"LocalifPriv"];
    [sessionId synchronize];
}

+ (NSInteger)GetifPriv
{
    NSUserDefaults *stdifPriv = [NSUserDefaults standardUserDefaults];
    NSString* strLocalifPriv = [stdifPriv objectForKey:@"LocalifPriv"];
    return [strLocalifPriv intValue];
}

+ (NSString *)stringFromDate:(NSDate *)date withfmt:(NSString*)fmt
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:fmt];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}



+ (void)SetPathArray:(NSArray*)patharray Array:(NSString*)pathstr
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    [sessionId setObject:patharray forKey:pathstr];
    [sessionId synchronize];
}

//递归查找父对象
+ (UIViewController*)traverforuiviewcontroller:(UIView*)parent
{
    id next = [parent nextResponder];
    if ([next isKindOfClass:[UIViewController class]]) {
        return next;
    }else if([next isKindOfClass:[UIView class]])
    {
        return [self traverforuiviewcontroller:next];
    }
    else
        return nil;
}

+ (void)showTitle:(NSString*)Title
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window makeToast:[NSString stringWithFormat:@"%@",Title]duration:1 position:@"center"];
}

+ (void)showAlertimageViewTitle:(NSString *)title
{
    [[UILoadingView sharedInstance]hidewithoutanmi];
    MyAlertView  *AlertView = [[MyAlertView alloc]init];
    [AlertView setMyselfAlertView:title];
}

+ (UINavigationController *)getCurrentVC
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    return (UINavigationController*)window.rootViewController;
}

+ (NSString *)getCacheDirectory{
    NSArray *arrPaths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath=[[arrPaths objectAtIndex:0] stringByAppendingString:@"DocCach"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath]) {
        NSError *error=nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    return cachePath;
}

static AFHTTPRequestOperationManager *manager;
+ (AFHTTPRequestOperationManager *)getManager{
    if (nil ==manager) {
        manager= [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //[manager.responseSerializer setDefaultHeader:@"Accept" value:@"application/json"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    }
    return manager;
}

#if TARGET_IPHONE_SIMULATOR
#elif TARGET_OS_IPHONE
static BMKLocationService *BMKMapmanager;
+ (BMKLocationService*)GetBMKMapView{
    if (nil ==BMKMapmanager) {
        BMKMapmanager = [[BMKLocationService alloc]init];
        [BMKMapmanager startUserLocationService];
    }
    return BMKMapmanager;
}
#endif

+ (void)setExtraCellLineHidden: (UITableView *)tableView{
    //隐藏多余的线
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [tableView setTableHeaderView:view];
}

/***表格视图线条颜色和背景颜色改变***/
+ (void)TableViewSeparatorColor :(UITableView *)tableview
{
    [tableview setSeparatorColor:O_COLOR(236, 240, 243, 1)];//cell线条颜色
    [tableview setBackgroundView:nil];
    [tableview setBackgroundColor:O_COLOR(235 ,235 ,244 ,1)];//设置多行显示表格视图的背景颜色
}

#pragma mark--UIColor 转UIImage
+ (UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



//提供足迹调用的本地纪录
+ (NSArray*)GetFootmarkHisory
{
    NSUserDefaults *sessionId = [NSUserDefaults standardUserDefaults];
    NSString* FootMarkHistoryKey = [NSString stringWithFormat:@"FootmarkHisory%@",[Utility GetUserName]];
    NSArray *DateArray = [sessionId objectForKey:FootMarkHistoryKey];
    NSMutableArray* newDateArray = [NSMutableArray arrayWithArray:DateArray];
    for(int i = 0; i<newDateArray.count ; i++)
    {
        NSDictionary* DateFootDetailDic = [newDateArray objectAtIndex:i];
        NSArray* DateFootDetail = [DateFootDetailDic objectForKey:@"FootmarkDateHistory"];
        NSArray *reverObjarray = [[DateFootDetail reverseObjectEnumerator] allObjects];
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:DateFootDetailDic];
        [dic setObject:reverObjarray forKey:@"FootmarkDateHistory"];
        [newDateArray removeObject:DateFootDetailDic];
        [newDateArray addObject:dic];
    }
    NSComparator cmptr = ^(NSDictionary* obj1, NSDictionary* obj2)
    {
        NSString* stringData1 = [obj1 objectForKey:@"FootmarkDateTime"];
        NSString* stringData2 = [obj2 objectForKey:@"FootmarkDateTime"];
        NSDate * date1 = [Utility ConvertDateFromString:stringData1 withfmt:@"yyyy-MM-dd"];
        NSDate * date2 = [Utility ConvertDateFromString:stringData2 withfmt:@"yyyy-MM-dd"];
        NSDate *newData = [date1 earlierDate:date2];
        if (newData == date1) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if (newData == date2) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    
    NSArray *newArray = [newDateArray sortedArrayUsingComparator:cmptr];
    return newArray;
}

+ (NSInteger)CompareWithTime:(NSDate*)date2 LastTime:(NSDate*)date1
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:date1 toDate:date2 options:0];
    
    NSInteger sec = [d hour]*3600+[d minute]*60+[d second];
    return sec;//差距秒数
}

//写入本地时间纪录
//*************Type是新闻。公告。流程之类的
+ (void)SetFootmarkHisoryType:(NSString*)Type DetailInfo:(NSString*)Title
{
    NSString* Msg;
    if (Title == nil) {
        Msg= [NSString stringWithFormat:@"查看了%@",Type];
    }
    else if([Type isEqualToString:@"签到"])
    {
        Msg= [NSString stringWithFormat:@"进行了%@:地址为%@",Type,Title];
    }
    else
    {
        Msg= [NSString stringWithFormat:@"查看了%@:%@",Type,Title];
    }
    //本地今日日期
    NSDate *  nowTime = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *  locationDataString = [dateformatter stringFromDate:nowTime];
    
    [dateformatter setDateFormat:@"HH:mm"];
    NSString *  locationDhhmm = [dateformatter stringFromDate:nowTime];
    
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    
    NSString* FootMarkHistoryKey = [NSString stringWithFormat:@"FootmarkHisory%@",[Utility GetUserName]];
    //存放日期字典
    NSArray *DateArray = [userdefault objectForKey:FootMarkHistoryKey];
    
    
    NSMutableArray* newDateArray = [NSMutableArray arrayWithArray:DateArray];
    //日期字典
    NSMutableDictionary* newDateDic = [NSMutableDictionary dictionary];
    //存放日期纪录列表
    NSArray* DateHistoryArray;
    NSDictionary* DateDic;
    for(DateDic in newDateArray)
    {
        NSString* DateTime = [DateDic objectForKey:@"FootmarkDateTime"];
        if (DateTime && [locationDataString isEqualToString:DateTime]) {
            DateHistoryArray = [DateDic objectForKey:@"FootmarkDateHistory"];
            //找到对应的历史元素
            [newDateArray removeObject:DateDic];
            break;
        }
    }
    if (DateHistoryArray == nil || DateDic == nil) {
        //没有找到日期，创建字典
        DateHistoryArray = [NSArray array];
    }
    else
    {
        //找到之后将上次时间提取
        for(NSDictionary* dic in DateHistoryArray)
        {
            NSString* FootmarkDateTimeDicInfo = [dic objectForKey:@"FootmarkDateTimeDicInfo"];
            NSString* FootmarkDateTimelocationDhhmm = [dic objectForKey:@"FootmarkDateTimelocationDhhmm"];
            if ([FootmarkDateTimeDicInfo isEqualToString:Msg]) {
                NSDate* LastDate = [dateformatter dateFromString:FootmarkDateTimelocationDhhmm];
                NSInteger TimeCach = [Utility CompareWithTime:nowTime LastTime:LastDate];
                if (TimeCach < 300) {
                    //小于5分钟的同一件事不记录在内
                    return;
                }
            }
        }
    }
    //重新添加载入的字典
    [newDateArray addObject:newDateDic];
    //录入日志字典
    NSMutableDictionary* FootmarkDateTimeDic = [NSMutableDictionary dictionary];
    //信息
    [FootmarkDateTimeDic setObject:Msg forKey:@"FootmarkDateTimeDicInfo"];
    //时间
    [FootmarkDateTimeDic setObject:locationDhhmm forKey:@"FootmarkDateTimelocationDhhmm"];
    //今日日期加入
    NSMutableArray* newDateHistoryArray = [NSMutableArray arrayWithArray:DateHistoryArray];
    [newDateHistoryArray addObject:FootmarkDateTimeDic];
    
    //[newDateDic setObject:DateTime forKey:@"FootmarkDateTime"];

    //字典录入日期
    [newDateDic setObject:locationDataString forKey:@"FootmarkDateTime"];
    //录入日期今日字典
    [newDateDic setObject:newDateHistoryArray forKey:@"FootmarkDateHistory"];
    
    //存储
    
    [userdefault setObject:newDateArray forKey:FootMarkHistoryKey];
    [userdefault synchronize];
}

//删除日期
+ (void)RemoveDateHistory:(NSString*)Date
{
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    //存放日期字典
    NSString* FootMarkHistoryKey = [NSString stringWithFormat:@"FootmarkHisory%@",[Utility GetUserName]];
    
    NSArray *DateArray = [userdefault objectForKey:FootMarkHistoryKey];
    NSMutableArray* newDateArray = [NSMutableArray arrayWithArray:DateArray];
    for(NSDictionary* DateDic in newDateArray)
    {
        NSString* DateTime = [DateDic objectForKey:@"FootmarkDateTime"];
        if ([DateTime isEqualToString:Date]) {
            [newDateArray removeObject:DateDic];
            [userdefault setObject:newDateArray forKey:FootMarkHistoryKey];
            [userdefault synchronize];
            return;
        }
    }
}

//删除历史纪录单条
+ (void)RemoveFootmarkHistory:(NSDictionary*)FootDateilDic
{
    //查看时间
    NSString* Time = [FootDateilDic objectForKey:@"FootmarkDateTimelocationDhhmm"];
    //查看详情
    NSString* FootDetail = [FootDateilDic objectForKey:@"FootmarkDateTimeDicInfo"];
    
    
    //本地今日日期
    NSDate *  nowTime = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *  locationDataString = [dateformatter stringFromDate:nowTime];
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    NSString* FootMarkHistoryKey = [NSString stringWithFormat:@"FootmarkHisory%@",[Utility GetUserName]];
    
    //存放日期字典
    NSArray *DateArray = [userdefault objectForKey:FootMarkHistoryKey];
    
    
    NSMutableArray* newDateArray = [NSMutableArray arrayWithArray:DateArray];

    //存放日期纪录列表
    NSArray* DateHistoryArray;
    for(NSDictionary* DateDic in newDateArray)
    {
        DateHistoryArray = [DateDic objectForKey:@"FootmarkDateHistory"];
        //今日日期加入
        NSMutableArray* newDateHistoryArray = [NSMutableArray arrayWithArray:DateHistoryArray];
        for(NSDictionary* dateHistory in newDateHistoryArray)
        {
            //查看时间
            NSString* oldTime = [dateHistory objectForKey:@"FootmarkDateTimelocationDhhmm"];
            //查看详情
            NSString* oldFootDetail = [dateHistory objectForKey:@"FootmarkDateTimeDicInfo"];
            if ([oldTime isEqualToString:Time] && [oldFootDetail isEqualToString:FootDetail]) {
                [newDateHistoryArray removeObject:dateHistory];
                [newDateArray removeObject:DateDic];
                
                //存储
                
                //日期字典
                NSMutableDictionary* newDateDic = [NSMutableDictionary dictionary];
                [newDateDic setObject:locationDataString forKey:@"FootmarkDateTime"];
                [newDateDic setObject:newDateHistoryArray forKey:@"FootmarkDateHistory"];
                [newDateArray addObject:newDateDic];
                [userdefault setObject:newDateArray forKey:FootMarkHistoryKey];
                [userdefault synchronize];
                return;
            }
        }
    }
}

//每次更新进行版本检查是否
+ (void)SetLoginUpdate:(BOOL)update
{
    [[NSUserDefaults standardUserDefaults] setBool:!update forKey:@"SetLoginUpdate"];
}

+ (BOOL)GetLoginUpdate
{
    return ![[NSUserDefaults standardUserDefaults] boolForKey:@"SetLoginUpdate"];
}

+ (void)BarEffectStyle:(BOOL)hide
{
    UIWindow *window = [(AppDelegate *)[[UIApplication sharedApplication]delegate]window];
    if (hide) {
        for (UIView *view in [window subviews]) {
            if ([view isKindOfClass:[UIVisualEffectView class]]) {
                UIVisualEffectView* effectview = (UIVisualEffectView*)view;
                [UIView animateWithDuration:0.3f animations:^(void){
                    effectview.alpha = 0;
                }completion:^(BOOL finish){
                    [effectview removeFromSuperview];
                }];
            }
        }
    }
    else
    {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        effectview.frame = CGRectMake(0, 0, kScreenwidth, kScreenheight);
        [effectview setTag:1999];
        [window insertSubview:effectview atIndex:1];
        effectview.alpha = 0;
        
        [UIView animateWithDuration:0.4f animations:^(void){
            effectview.alpha = 1;
        }completion:^(BOOL finish){
            //禁止弹键盘
            [[[UIApplication sharedApplication]keyWindow]endEditing:YES];
        }];
    }
    
}

//时间年月日转化
+(NSString *)DateWithDateString:(NSDate *)Date Fmt:(NSString *)fmt
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:fmt];//@"yyyy年MM月"
    NSString *dateString=[dateFormatter stringFromDate:Date];
    return dateString;
}

/**
 *  适配HTML代码的CSS
 *
 *  @param HtmlString HTML标签语句的字符串
 *  @param textFont   文字的大小
 *
 *  @return 返回带有CSS适配的HTML字符串
 */
+ (NSString *)SetCSSScreenAdaptationWithHTMLString:(NSString *)HtmlString textFont:(CGFloat )textFont
{
    NSString *CssString = [NSString stringWithFormat:@"<html> \n"
                           "<head> \n"
                           "<style type=\"text/css\"> \n"
                           " body {margin:20px !important;color:#23161d;font-size: %f;margin-left:auto;margin-right: auto;text-align: left;line-height:50px;padding: 0;width: 98%%;height:100%% ;}\n"
                           "img{width:98%% !important;height:100%% !important; margin: 0 auto !important;}\n"
                           "span{ letter-spacing:2px !important;line-height:150%% !important; color:#23161d;font-size: %f !important;}\n"
                           "</style> \n"
                           "</head>\n"
                           "<body>%@</body> \n"
                           "</html>",textFont,textFont,HtmlString];//!important;强制执行  %% 为转义为％
    return CssString;
}

+ (NSString *)getDiffTime:(long long)time withCurrentTime:(long long )currentTime
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:currentTime/1000];
    NSTimeInterval timeInterval = [nowDate timeIntervalSinceDate:date];
    if (timeInterval<60) {
        return [NSString stringWithFormat:@"%lld秒前",(long long)timeInterval];
    }
    else if (timeInterval < 60*60)
    {
        return [NSString stringWithFormat:@"%lld分前",((long long)timeInterval)/60];
    }
    else if (timeInterval < 24*60*60)
    {
        return [NSString stringWithFormat:@"%lld小时前",((long long)timeInterval)/60/60];
    }
    else
    {
        return [NSString stringWithFormat:@"%lld天前",((long long)timeInterval)/60/60/24];
    }
}

#pragma mark -相机、相册权限
+ (BOOL)isGetCameraPermission
{
    BOOL isCameraValid = YES;
    //ios7之前系统默认拥有权限
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        if (authStatus == AVAuthorizationStatusDenied)
        {
            isCameraValid = NO;
        }
    }
    return isCameraValid;
}



@end
