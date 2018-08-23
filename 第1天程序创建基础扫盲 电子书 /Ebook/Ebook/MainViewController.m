//
//  MainViewController.m
//  Ebook
//
//  Created by 张俊 on 2018/8/3.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
//界面如何布局
//UIViewController的执行流程
//- (instancetype)init{
//    self = [super init];
//
//    if (self != nil) {
//        NSLog(@"init");
//    }
//
//    return self;
//}

//loadView方法
//- (void)loadView{
//    NSLog(@"load view");
//}

//viewDidLoad
- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    UIView *  orangeView = [[UIView alloc]initWithFrame:CGRectMake(50, 20+44+50, 200, 300)];
    orangeView.backgroundColor = [UIColor orangeColor];
    orangeView.clipsToBounds = YES;
    [self.view addSubview:orangeView];
    
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, orangeView.frame.size.width+40, orangeView.frame.size.height-40)];
    redView.backgroundColor = [UIColor redColor];
    [orangeView addSubview:redView];
    
    UIView * blackView = [[UIView alloc]initWithFrame:CGRectMake(100, 70, 200, 150)];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
}

//viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

//viewDidAppear
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.创建下一个界面
    SecondViewController *svc = [[SecondViewController alloc] init];
    
    //2.推送到下一个界面
    [self.navigationController pushViewController:svc animated:YES];
}



@end
