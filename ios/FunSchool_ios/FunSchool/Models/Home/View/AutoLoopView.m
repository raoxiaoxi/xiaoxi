//
//  AutoLoopView.m
//  AutoLoopScrollView
//
//  Created by liuxiaofeng on 16/5/3.
//  Copyright © 2016年 Soonbuy. All rights reserved.
//

#import "AutoLoopView.h"
#import "UIImageView+WebCache.h"

@interface AutoLoopView ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *pictureScrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong) NSMutableArray *myPicViewArr;
@property (nonatomic,strong) NSMutableArray *myPicArr;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) BOOL lock;
@end

#define PageCtlWidth  40
#define PageCtlHeight 20
#define PWidth  self.bounds.size.width
#define PHeight  self.bounds.size.height

@implementation AutoLoopView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self pictureScrollView];
        [self pageControl];
        self.lock = NO;
    }
    return self;
}

-(NSTimer *)timer{
    if (_timer==nil) {
        _timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer setFireDate:[NSDate distantFuture]];
    }
    return _timer;
}


-(UIScrollView *)pictureScrollView{
    if (_pictureScrollView==nil) {
        _pictureScrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _pictureScrollView.pagingEnabled = YES;
        _pictureScrollView.showsHorizontalScrollIndicator = NO;
        _pictureScrollView.showsVerticalScrollIndicator = NO;
        _pictureScrollView.bounces = NO;
        _pictureScrollView.delegate =self;
        [self addSubview:_pictureScrollView];
    }
    return _pictureScrollView;
}

-(UIPageControl *)pageControl{
    if (_pageControl==nil) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - PageCtlHeight, self.bounds.size.width, PageCtlHeight)];
        _pageControl.numberOfPages = self.myPicArr.count;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [self addSubview:_pageControl];
    }
    return _pageControl;
}

-(NSMutableArray *)myPicViewArr{
    if (_myPicViewArr==nil) {
        _myPicViewArr = [NSMutableArray array];
    }
    return _myPicViewArr;
}
-(NSMutableArray *)myPicArr{
    if (_myPicArr==nil) {
        _myPicArr = [NSMutableArray array];
    }
    return _myPicArr;
}

#define placeholder [UIImage imageNamed:@""]

- (void)setScrollerByPicArr:(NSArray *)picArr{
    [self.myPicArr removeAllObjects];
    [self.myPicArr addObjectsFromArray:picArr];
    NSInteger count = self.myPicViewArr.count;
    NSInteger picCount  = picArr.count;
    if (picCount>count-2) {
        for (int i = 0; i<picArr.count-(count-2); i++) {
            UIImageView *pic = [[UIImageView alloc]init];
            pic.userInteractionEnabled = YES;
            [self.myPicViewArr addObject:pic];
            [self.pictureScrollView addSubview:pic];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPicAction:)];
            [pic addGestureRecognizer:tap];
        }
    }
    for (int i =0; i<picArr.count+2; i++) {
        UIImageView *PicImage = self.myPicViewArr[i];
        NSString *imageUrl;
        if (i==0) {
            imageUrl =  [picArr lastObject];
            PicImage.tag = picArr.count-1;
        }else if (i==picArr.count+1){
            imageUrl = [picArr firstObject];
            PicImage.tag = 0;
        }else{
            imageUrl = picArr[i-1];
            PicImage.tag = i-1;
        }
        PicImage.frame = CGRectMake(i*PWidth, 0, PWidth,PHeight);
        [PicImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:placeholder];
    }
    self.pictureScrollView.contentSize = CGSizeMake((picArr.count+2)*PWidth, 0);
    self.pictureScrollView.contentOffset = CGPointMake(PWidth, 0);
    self.pageControl.numberOfPages = self.myPicArr.count;
    [self starTimer];
}


#pragma mark - scrollView
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //偏离位置
    if (scrollView.contentOffset.x == 0)
    {
        self.pictureScrollView.contentOffset = CGPointMake(self.bounds.size.width * self.myPicArr.count, 0);
    }
    else if(scrollView.contentOffset.x == self.bounds.size.width * (self.myPicArr.count + 1) )
    {
        self.pictureScrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    }
    
    //小圆点
    int currentPage = scrollView.contentOffset.x / self.bounds.size.width;
    if (currentPage == 0)
    {
        self.pageControl.currentPage = self.myPicArr.count - 1;
    }
    else if(currentPage == self.myPicArr.count + 1)
    {
        self.pageControl.currentPage = 0;
    }
    else
    {
        self.pageControl.currentPage = currentPage - 1;
    }
}

/**用户将要开始拖拽的时候调用*/
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //停止定时器
    [self.timer setFireDate: [NSDate distantFuture]];
}

/**用户将要停止拖拽的时候调用*/
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开始定时器
    if (!self.lock) {
        [self performSelector:@selector(starTimer) withObject:nil afterDelay:2.0f];
        self.lock = YES;
    }
}

- (void)starTimer{
    self.lock = NO;
    [self.timer setFireDate:[NSDate distantPast]];
}

#pragma mark - 定时器滚动轮播图
-(void)nextPage
{
    NSInteger index;
    if (self.pageControl.currentPage == self.pageControl.numberOfPages-1)
    {
        self.pageControl.currentPage = 0;
        index = 1;
    }else{
        self.pageControl.currentPage = self.pageControl.currentPage + 1;
        index = self.pageControl.currentPage+1;
    }
    [self.pictureScrollView setContentOffset:CGPointMake(self.bounds.size.width * index, 0) animated:YES];
}


- (void)tapPicAction:(UITapGestureRecognizer *)sender{
    
    if ([self.delegate respondsToSelector:@selector(tapPictureTag:)]) {
        [self.delegate tapPictureTag:sender.view.tag];
    }
}

-(void)dealloc{
    [self.timer invalidate];
}





@end
