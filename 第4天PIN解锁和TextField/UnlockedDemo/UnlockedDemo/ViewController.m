//
//  ViewController.m
//  UnlockedDemo
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "PINUnlockedView.h"
#import "GestureUnlockedView.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * choice = @"1";
//    1 是PIN解锁  其他的是滑动解锁
    if ([choice isEqualToString:@"1"]) {
        PINUnlockedView * plv = [[PINUnlockedView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:plv];
    }else{
        GestureUnlockedView * glv = [[GestureUnlockedView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:glv];
    }
    
}


@end











