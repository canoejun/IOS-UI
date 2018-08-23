//
//  AppDelegate.m
//  Ebook
//
//  Created by 张俊 on 2018/8/3.
//  Copyright © 2018年 zhangjun. All rights reserved.
//


#import "AppDelegate.h"
#import "MainViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
//   2. 为窗口提供一个默认界面    因为是将就是UIViewController的一个子类
    MainViewController * mainVC = [MainViewController new];
    mainVC.view.backgroundColor = [UIColor brownColor];

//    3.为主窗口添加viewcontroller
//    self.window.rootViewController = mainVC;
//    添加导航栏控制器 用于界面之间的切换
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    
//    4.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
