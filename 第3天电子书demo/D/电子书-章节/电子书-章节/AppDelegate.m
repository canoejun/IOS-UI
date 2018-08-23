//
//  AppDelegate.m
//  电子书-章节
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
    
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.创建一个启动起来默认加载的界面 UIViewController
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.view.backgroundColor = [UIColor whiteColor];
    
    //3.创建导航栏控制器 只要有界面切换就一定需要导航栏控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    //设置导航条的颜色
    nav.navigationBar.barTintColor = [UIColor redColor];
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
    
    //4.配置导航栏控制器为窗口的rootViewController
    self.window.rootViewController = nav;
    
    //5.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end







