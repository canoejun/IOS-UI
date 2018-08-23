//
//  ViewController.m
//  UIScrollView
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *testScrollView;
/** 测试的scrollview  */
@property (nonatomic,strong) UIScrollView * scrolV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*************************小菊花加载**************************/
    UIActivityIndicatorView * indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = CGPointMake(self.testScrollView.center.x, -30);
//    比较特殊需要添加动画效果
    [indicatorView startAnimating];
    [self.testScrollView addSubview:indicatorView];
    
    
    
    UIScrollView * scrolV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 200, 100)];
    self.scrolV = scrolV;
    [self.view addSubview:scrolV];
    NSLog(@"stroyboard里面的 %@  代码创建的 %@",_testScrollView.subviews,scrolV.subviews);
    
//    1.设置UIImageView
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sierra21"]];
    [self.testScrollView addSubview:imageView];
//    设置contentsize
    self.testScrollView.contentSize = imageView.frame.size;
    
    
    
    UIImageView * imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sierra21"]];
    [scrolV addSubview:imageView1];
    //    scrolV.delegate = self;
    scrolV.backgroundColor = [UIColor blueColor];
    scrolV.contentSize = imageView1.frame.size;
    
    NSLog(@"stroyboard里面的 %@  代码创建的 %@",_testScrollView.subviews,scrolV.subviews);
    
    
    
    /*************************注意**************************/
    /*
     *  1.通过代码创建的scrollview一开始为nil,加一个视图才会增加一个对象
        2.加载不等于显示，在加载的时候，滚动条不会显示出来的，只有在appear里面才能够显示出来的，这时候subviews会变成多个，而stroyboard里面是一次性全部显示出来的
     */
    

    
    
//    设置是否有滑动的弹簧效果
//    self.testScrollView.bounces = NO;
    
//    水平和垂直方向是否存在弹簧效果       默认是NO
    /*
     *  设置以后虽然并没有什么变化，但是一般是用于网络请求的时候采用是加载刷新
     见注释小菊花
     
     不管有没有设置contentsize，那么总是会有弹簧效果（网络下拉刷新）
     */
//    self.testScrollView.alwaysBounceVertical = YES;
//    self.testScrollView.alwaysBounceHorizontal = NO;
//
////    是否展示滚动条
//    self.testScrollView.showsVerticalScrollIndicator = NO;
//    self.testScrollView.showsHorizontalScrollIndicator = NO;

    /*
     *  不要通过subviews索引值去访问scrollVIew的子控件，然后去删除，因为你不会确定哪一个能够被访问到   打印的子控件是包括滚动条的
     */
//    NSLog(@"%@",_testScrollView.subviews);
    
    
//    程序启动直接显示的不是图片的左上角了，而是相对于图片的左上角偏移 x200 y100
//    内容的偏移量
//    _testScrollView.contentOffset = CGPointMake(200, 100);
//    系统自己调用的方式提供动画
//    [_testScrollView setContentOffset:CGPointMake(200, 100) animated:YES];
    /*
    CGPoint offset = _testScrollView.contentOffset;
    offset.y = 0;
//    _testScrollView.contentOffset = offset;
//    */
////    等价于这样子   OC中不能够直接修改成员属性中结构体的变量，而是通过间接的赋值来改变
//    _testScrollView.contentOffset = CGPointMake(_testScrollView.contentOffset.x, 0);
    
    
//    内边距       就相当于是扩大了contentsize的尺寸，使得用户可以看见后面的背景
//    _testScrollView.contentInset
    
    
#pragma mark ------ 监听事件（代理或者是addtarget） ------
//    继承于UIControl的直接添加addtarget监听事件            其他的都是可以采用代理的方式进行监听
    UITextField;//特殊  即能够通过代理又能够通过addtarget方法进行事件的监听
/*
 //    小控件
 UISegmentedControl * s = [[UISegmentedControl alloc]initWithItems:@[@123,@4325,@23,@234]];
 s.center = CGPointMake(0, 500);
 [self.view addSubview:s];
 */
    

    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     NSLog(@"stroyboard里面的 %@  代码创建的 %@",_testScrollView.subviews,_scrolV.subviews);
}


#pragma mark ------ 协议里面的方法 ------
////scrollview正在滑动的时候
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"fvdfsbnfn");
//}
//
//
#pragma mark ------ 当判断一个视图是否停止拖动的时候，需要从这两个方法进行结合判断，否则就是不严谨的 ------
//
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    if (decelerate == NO) {
//        NSLog(@"用户已经停止拖拽scrollview，而且停止转动");
//    }else{
//        NSLog(@"用户已经停止拖拽scrollview，但是还是由于惯性在滚动，减速");
//    }
//}
//
////scrollview停止减速的时候，也就是说是停止移动的时候
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"scrollview减速完毕以后会调用，停止滚动");
//}


@end










