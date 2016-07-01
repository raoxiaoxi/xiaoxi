//
//  UIAlertViewTool.m
//  EOC营销通
//
//  Created by YYQ on 15/12/12.
//  Copyright © 2015年 尚通科技. All rights reserved.
//

#define IAIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#import "UIAlertViewTool.h"
#import <objc/runtime.h>

@interface UIAlertViewTool()<UIAlertViewDelegate>

@end
@implementation UIAlertViewTool
+ (id)showAlertWithTitle:(NSString *)title message:(NSString *)message
         completionBlock:(void (^)(NSUInteger buttonIndex, UIAlertViewTool *alertView))block
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    if (!cancelButtonTitle && !otherButtonTitles) {
        return nil;
    }
    UIAlertViewTool *alertView = [[self alloc] initWithTitle:title
                                                 message:message
                                         completionBlock:block
                                       cancelButtonTitle:cancelButtonTitle
                                       otherButtonTitles:otherButtonTitles];
    [alertView show];
    
    return alertView;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0)
{
    void (^block)(NSUInteger buttonIndex, UIAlertView *alertView) = objc_getAssociatedObject(self, "AlertViewToolBlockCallback");
    if (block) {
        block(buttonIndex, self);
    }
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
    completionBlock:(void (^)(NSUInteger buttonIndex, UIAlertViewTool *alertView))block
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    objc_setAssociatedObject(self, "AlertViewToolBlockCallback", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self = [self initWithTitle:title
                           message:message
                          delegate:self
                 cancelButtonTitle:nil
                 otherButtonTitles:nil])
    {
        
        if (cancelButtonTitle)
        {
            [self addButtonWithTitle:cancelButtonTitle];
            self.cancelButtonIndex = [self numberOfButtons] - 1;
        }
        if (otherButtonTitles) {
            [self addButtonWithTitle:otherButtonTitles];
            self.cancelButtonIndex = [self numberOfButtons];
        }
    }
    return self;
}

@end
