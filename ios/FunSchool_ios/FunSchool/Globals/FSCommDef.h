//
//  FSCommDef.h
//

#ifndef __FS_FSCommDef_h
#define __FS_FSCommDef_h

#define kScreenwidth  [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height
#define Font(Size)   [UIFont systemFontOfSize:Size]
#define COLOR(R,G,B,A)([UIColor colorWithRed:strtol(R,nil,16)/255.0f green:strtol(G,nil,16)/255.0f blue:strtol(B,nil,16)/255.0f alpha:A])
#define O_COLOR(R,G,B,A)([UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A])
#define ISIOS7  ([[[UIDevice currentDevice]systemVersion]floatValue] < 8.0)
#define iphone4S ([[UIScreen mainScreen] bounds].size.height == 480)
#define iphone5s ([[UIScreen mainScreen] bounds].size.height == 568)
#define iphone6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define iphone6P ([[UIScreen mainScreen] bounds].size.height == 736)
//加圈
#define Border(view){view.layer.borderColor = [UIColor blackColor].CGColor;view.layer.borderWidth=0.5f;view.layer.masksToBounds=YES;}
#define Radiucorner(view){view.layer.cornerRadius = 6;view.layer.masksToBounds=YES;}
#define OrangeColor COLOR("ff","69","28",1.0)
#define Radiucorner_Radiu(view, Radiu){view.layer.cornerRadius = Radiu;view.layer.masksToBounds=YES;}
#define DisableGrayColor O_COLOR(189, 189, 195, 1.0)
#define TableViewGrayColor O_COLOR(231, 231, 238, 1)

#define BlueColor [UIColor colorWithRed:80/255. green:153/255. blue:253/255. alpha:1]
#define GrayColor O_COLOR(244, 244, 244, 1)

//cell点击后的颜色
#define CellSelectedBackgroundColor O_COLOR(239, 243, 246, 1)

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define Comjson(json) (json == nil)? @"0":json
//比较为空就=@“”
#define ComSring(json) (json == nil)? @"":json

//上部位loading界面处理位置
#define NavCFAPIClient(X) CGRectMake(X, 38, 10, 10)
//#define AppSotreUpdate

#endif
