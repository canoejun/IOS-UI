//
//  AppDelegate.m
//  EbookBeta
//
//  Created by 张俊 on 2018/8/5.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    窗口开好
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    2.创建controller 并加载到窗口，使之默认的界面
    MainViewController * mainVC = [[MainViewController alloc]init];
    mainVC.view.backgroundColor = [UIColor orangeColor];
    
//    3.创建导航栏控制器   导航栏控制器就是控制界面之间的切换关系   只要有界面切换就一定需要导航栏控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    
//    4.配置导航栏控制器为窗口的rootViewController
    self.window.rootViewController = nav;
    //导航条颜色
    nav.navigationBar.barTintColor = [UIColor magentaColor];
    //导航条字体的颜色和大小
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    
    
    
//    5.显示窗口
    [self.window makeKeyAndVisible];
    
    
    
    
    
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
