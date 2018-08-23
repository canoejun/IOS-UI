//
//  SecondViewController.m
//  Ebook
//
//  Created by 张俊 on 2018/8/3.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
-(void)viewDidLoad{
//    self.view.backgroundColor = [UIColor orangeColor];
    UIView * svc = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    svc.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:svc];
}
@end
