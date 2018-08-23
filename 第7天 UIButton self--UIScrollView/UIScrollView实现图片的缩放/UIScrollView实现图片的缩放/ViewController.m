//
//  ViewController.m
//  UIScrollView实现图片的缩放
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/** UIScrollView的缩放图片  */
@property (nonatomic,strong) UIImageView * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.添加图片
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CD53893A2FFF22357C8F0F28871DC40D"]];
    
    [self.scrollView addSubview:_imageView];
//    2.设置contentsize
    self.scrollView.contentSize = self.imageView.frame.size;
    
//    3.设置代理，实现监听 各种手势
    self.scrollView.delegate = self;
    
//    4.设置缩放比例   调用代理事件缩放哪一个控件
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.3;
    
    
#pragma mark ------ 自动分页功能 ------
//    创建多个imageView，然后拼接在一起，然后设置contentsize是图片大小，直接能够滚动
        //苹果默认提供的分页功能
    //分页的标准是以scrollview尺寸为标准，然后计算页数的
    self.scrollView.pagingEnabled = YES;
    
    
//    添加页数显示   要是View的子控件，如果是scrollview的子控件的话，那么会导致随着界面的滑动而滑动，从而显示不出来的
//    UIPageControl * p = [UIPageControl alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
    
    
    
}

#pragma mark ------ UIScrollView代理事件 ------
//告诉scrollView缩放哪一个子控件
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    
    return self.imageView;
}


@end










