//
//  ViewController.m
//  UIScrollView图片滑动
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "ZJBannerGroup.h"
#import "ZJBanner.h"

#define kLanMu 1


@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *bannerText;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 储存banner图标信息的数组  */
@property (nonatomic,strong) NSMutableArray * bannerArray;

@end

@implementation ViewController

//懒加载plist文件的内容
-(NSMutableArray *)bannerArray{
    if (_bannerArray == nil) {
//       1.获取文件
        NSArray * tempArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"banner.plist" ofType:nil]];
//        2.用模型解析数据
        self.bannerArray = [NSMutableArray array];
        for (NSDictionary * tempDic in tempArr) {
            [_bannerArray addObject:[ZJBannerGroup ZJBannerGroupWithDic:tempDic]];
        }
    }
    return _bannerArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    
//    首先设置文本内容
    ZJBannerGroup * group = [ZJBannerGroup new];
    group = self.bannerArray[kLanMu];
    ZJBanner * banner = [ZJBanner new];
    banner = group.banner[self.pageControl.currentPage];
    self.bannerText.text = banner.str;
    
    #pragma mark ------ 设置pagecontrol ------
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPage =  self.scrollView.contentOffset.x/self.scrollView.frame.size.width+0.5;
//    self.pageControl.defersCurrentPageDisplay = YES;
//    [self.pageControl updateCurrentPageDisplay];
    self.pageControl.numberOfPages = group.banner.count;
//    添加监听事件
    [self.pageControl addTarget:self action:@selector(jumpToNextPage) forControlEvents:UIControlEventValueChanged];

    
    
//    1.将图片加入到视图中
    for (int  i = 0; i < group.banner.count; i++) {
        banner = group.banner[i];
        UIImageView * imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:banner.img]];
        imageView.frame = CGRectMake(0 + self.scrollView.frame.size.width*i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [_scrollView addSubview:imageView];
    }
//    2.设置scrollview contentsize
    self.scrollView.contentSize = CGSizeMake(group.banner.count * self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView bringSubviewToFront:self.pageControl];
    self.scrollView.pagingEnabled = YES;
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self showText];
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    
}

-(void)showText{
    self.pageControl.currentPage =  self.scrollView.contentOffset.x/self.scrollView.frame.size.width+0.5;
    //   显示文本信息
    ZJBannerGroup * group = [ZJBannerGroup new];
    group = self.bannerArray[kLanMu];
    ZJBanner * banner = [ZJBanner new];
    banner = group.banner[self.pageControl.currentPage];
    self.bannerText.text = banner.str;
}

-(void)jumpToNextPage{
    self.scrollView.contentOffset = CGPointMake((_pageControl.currentPage+1)*self.scrollView.frame.size.width, 0);
}

@end








