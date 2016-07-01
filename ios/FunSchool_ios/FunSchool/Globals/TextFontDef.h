//
//  TextFontDef.h
//  EOC营销通
//
//  Created by YYQ on 15/11/27.
//  设置各个界面的textFont

#ifndef TextFontDef_h
#define TextFontDef_h




#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif


#define HTTPPOSTMETHOD @"POST"
#define HTTPGETMETHOD @"GET"

#define kScreenwidth [UIScreen mainScreen].bounds.size.width
#define kScreenheight [UIScreen mainScreen].bounds.size.height


//CRM 个人 办公等主界面Cell的字体大小
#define CellFont 15.3
//导航栏标题大小
#define NavTextFont 17

/**首页**/

// 日期
#define DATE_TIME_TITLE (26.)
// 天气和地区
#define WEATHER_TITLE (18.)
// 工作统计,今日工作
#define WORK_STATISTICS_TITLE (16.)

//马上安排
#define WORK_Immediately_Arrange (16.)

// 小泡泡上的字
#define MESSAGE_TIP (10.)
// 工作统计类型名
#define WORK_STATISTICS_TYPENAME (14.)
/**企信**/

/**CRM**/
//跟进记录 来自客户［XX］
#define CRMCellFromClientsFont 10
//跟进记录 评论内容字体大小 和用户名字体大小
#define CRMReviewtextFont 14
//客户 客户池cell中标题大小为 CellFont


/**办公**/
//通讯录txet的大小
#define AddressBookTextFont 14.5
//工作报告列表cell名称和时间大小
#define workCellNamefont 16
#define workCellTimefont 12


//工作简报text的大小
#define workNewsletterCellfont 13

//工作报告详情中的标题字体大小
#define workCellDetailsTitlefont 15
//工作报告详情中的内容的字体大
#define workCellDetailsContentfont 13
//外勤签到
#define FieldsigntitleFont  15.3
//日程

//任务

//公告
//公告列表cell大号 部门名称
#define NoticeBigFont 15.3
//公告列表cell小号 时间 来自于销售部..
#define NoticeSmallFont 12
//知识库 cell 中名称的大小
#define KnowledgeBaseCellTypeNameFont 15.3
//知识库 cell 中时间的大小
#define KnowledgeBaseCellTimeFont 12.3

/**个人**/
//个人信息
//和CellFont一致
//公司管理 公司名称 和解除公司绑定字体大小
#define CompanyControlsNameFont 15
//公司管理 企业编号字体大小
#define CompanyControlsTitleFont 12
//安全验证
#define SecurityVerificationFont 13

//设置
//EOC营销通字体大小
#define setupLogotextFont 14
//设置左边title字体大小
#define setupLeftFont 15.3
//设置右边title字体大小
#define setupRightFont 14.3
//帮助与反馈 H5写的无法调整 由PHP组调整
//关于电话字体大小
#define Aboutfont  15
//服务条款字体大小
#define AboutEnrollmentfont  11

//名片夹
//导入通讯录列表
#define ExportToAddressBookCellHight 75

#endif /* TextFontDef_h */
