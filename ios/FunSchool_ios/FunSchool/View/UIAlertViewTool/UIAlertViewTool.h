//
//  UIAlertViewTool.h
//  EOC营销通
//
//  Created by YYQ on 15/12/12.
//  Copyright © 2015年 尚通科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertViewTool : UIAlertView
+ (id)showAlertWithTitle:(NSString *)title
                 message:(NSString *)message
         completionBlock:(void (^)(NSUInteger buttonIndex, UIAlertViewTool *alertView))block
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSString *)otherButtonTitles, ...;
@end
