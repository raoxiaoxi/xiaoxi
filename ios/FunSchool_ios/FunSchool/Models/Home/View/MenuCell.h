//
//  MenuCell.h
//  FunSchool
//
//  Created by YYQ on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuCell;
@protocol MenuCellDelegate <NSObject>
- (void)SetbuttonClickSkipping:(NSString *)title;
@end
@interface MenuCell : UITableViewCell
{
    NSMutableArray *_CellbuttonArray;
    NSMutableArray *_CelllabelArray;
}

@property(nonatomic,assign)id <MenuCellDelegate> delegate;
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UIButton *button;
@end
