//
//  ViewController.m
//  testdaohangl
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark ------ 掌握要求 ------
    //    window-> UITableBarController->UINavigationCOntroller->viewContrller
    //    1.自定义视图2.导航栏控制器3.tabBarController4.UITableview5.数据请求6.多线程
    
    
    //      在视图控制器中  如果添加了导航栏控制器
    //    使用self.naviagtionContrller来访问这个导航栏控制器
    //    更改导航栏的背景图片 或者背景颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBar_BG"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    //    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NavigationBar_BG"]];
    //    [self.navigationController.navigationBar addSubview:imageView];
    
    
    //    添加按钮 UINavigationItem left right 中间的标题视图
    //UIBarButtonItem类型
    //创建返回按钮
    //    使用自己的一个UIButton按钮作为这个BarButtonitem
//             1. UIBarButtonItem * back = [[UIBarButtonItem alloc]initWithCustomView:<#(nonnull UIView *)#>];
    
//        创建一个有标题的UIBarButtonItem
//        UIBarButtonItem * back = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//        self.navigationItem.leftBarButtonItem = back;
    
    //    创建一个有图片的按钮
    //    分开两步进行写 为了防止让图片在导航栏渲染的时候被渲染了，还是采用跟原来的颜色
    UIImage * image = [[UIImage imageNamed:@"NavigationBar_Btn_Back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * back = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = back;
    
    //    创建右边的按钮
    //    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavigationBar_Btn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    //    自定义一个按钮  添加到导航栏的右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 35);
    //    [btn setImage:[UIImage imageNamed:@"NavigationBar_Btn"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"NavigationBar_Btn"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * nexbnt = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = nexbnt;
    
    
//    标题
    self.navigationItem.title = @"djiagove";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};//标题的颜色
//    显示图片 按钮 UIView
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NavigationBar_Logo"]];
    self.navigationItem.titleView = imageView;
    
    
    
    
//     太麻烦了，最好是在storyboard中创建   代码里面创建的东西会直接覆盖storyboard里面的添加的东西
//     1.默认的工具条是隐藏的
    self.navigationController.toolbarHidden = NO;
    
//  2.在toolbar上面添加均分的东西
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    3.在toolbar上添加按钮
    UIBarButtonItem * copyBtn = [[UIBarButtonItem alloc]initWithTitle:@"copy" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.toolbarItems = @[flexible,copyBtn,flexible];
    
}
-(void)next{
//    NSLog(@"next");
    SecondViewController * svc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
    
    
}
-(void)back{
//    NSLog(@"返回");
    SecondViewController * svc = [[SecondViewController alloc]init];
    [self.navigationController popToViewController:svc animated:YES];
}

@end
