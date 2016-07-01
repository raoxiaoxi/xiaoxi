//
//  HomeSearchBar.h
//  FunSchool
//
//  Created by YYQ on 16/6/29.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol HomeSearchBarDelegate <NSObject>
- (void)SetHomeSearchBar:(UITextField *)textField;
@end

@interface HomeSearchBar : UITextField <UITextFieldDelegate>
+ (instancetype)searchBar;
@property(nonatomic,assign)id <HomeSearchBarDelegate> SearchBardelegate;

@end
