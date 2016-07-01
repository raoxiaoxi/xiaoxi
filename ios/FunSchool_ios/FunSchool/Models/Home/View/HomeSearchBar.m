//
//  HomeSearchBar.m
//  FunSchool
//
//  Created by YYQ on 16/6/29.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import "HomeSearchBar.h"
#import "UIView+Extension.h"
#define kScreenwidth [UIScreen mainScreen].bounds.size.width
@implementation HomeSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.size = CGSizeMake(kScreenwidth-20, 30);
        self.x = 10;
        self.y = 10;
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"搜索机构、课程、地点";
        UIImage *image =[UIImage imageNamed:@"searchbar_textfield_background"];
        // 左端盖宽度
        NSInteger leftCapWidth = image.size.width * 0.5f;
        // 顶端盖高度
        NSInteger topCapHeight = image.size.height * 0.5f;
        // 重新赋值
        image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
        self.background = image;
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.contentMode = UIViewContentModeCenter;
        searchIcon.size = CGSizeMake(30, 30);
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc] init];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //开始编辑时触发，文本字段将成为first responder
    [self endEditing:YES];
    if ([_SearchBardelegate respondsToSelector:@selector(SetHomeSearchBar:)]) {
        [_SearchBardelegate SetHomeSearchBar:textField];
    }
}

@end
