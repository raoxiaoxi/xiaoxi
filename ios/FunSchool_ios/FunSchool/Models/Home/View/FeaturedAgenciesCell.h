//
//  FeaturedAgenciesCell.h
//  FunSchool
//  精选机构
//  Created by YYQ on 16/6/28.
//  Copyright © 2016年 raoxiaoxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FeaturedAgenciesCell;
@protocol FeaturedAgenciesCellDelegate <NSObject>
- (void)SetImageClickSkipping:(FeaturedAgenciesCell *)cell;
@end
@interface FeaturedAgenciesCell : UITableViewCell
{
    NSMutableArray *_CellImageArray;
    NSMutableArray *_CelllabelArray;
}
- (void)SetImageButtonWithimageArray:(NSArray*)imageArray LabelTitle:(NSArray *)titleArray imageTag:(int)imageTag;
@property(nonatomic,assign)id <FeaturedAgenciesCellDelegate> delegate;
@property(nonatomic,retain)UIImageView *itemImageView;


@end
