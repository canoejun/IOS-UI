//
//  ViewController.m
//  手势解锁的划线版
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "TestLine.h"
#import "GestureLineVersionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    TestLine * line = [[TestLine alloc]initWithFrame:self.view.bounds];
//    line.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:line];
    
    GestureLineVersionView * glv = [[GestureLineVersionView alloc]initWithFrame:self.view.bounds];
    glv.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:glv];
    
}




@end







