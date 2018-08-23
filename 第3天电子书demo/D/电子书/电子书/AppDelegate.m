//
//  AppDelegate.m
//  电子书
//
//  Created by PengXiaodong on 2018/8/5.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建一个主界面
    MainViewController *mainVC = [[MainViewController alloc] init];
    
    //创建导航栏控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    nav.navigationBar.barTintColor = [UIColor redColor];
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    //配置窗口的rootViewController为nav
    self.window.rootViewController = nav;
    
    //显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end










