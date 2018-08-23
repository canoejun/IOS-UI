//
//  AppDelegate.m
//  IOS程序创建
//
//  Created by 张俊 on 2018/8/3.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "AppDelegate.h"
#import "MianViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//程序运行起来的第二个方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //     定义程序的界面加载 加载哪个界面
//    配置界面的加载
    
    /*
     当一个程序加载起来以后，首先会产生一个窗口（窗户）并将这个窗口设置为主窗口，放置产生多个窗口，然后必须在窗口里面添加默认的控制器（相当于世界rootviewcontroller），然后将控制器控制的视图显示出来（rootviewcontroller.view）
     */
    
//    1.创建窗口
    self.window = [[UIWindow alloc]init];
//    _window.frame = CGRectMake(30, 30, 200, 200);
    _window.frame = [UIScreen mainScreen].bounds;
    
    //    2.将窗口设置为主要的
    [self.window makeKeyAndVisible];
    
    MianViewController *  mainVc = [[MianViewController alloc]init];
    mainVc.view.backgroundColor = [UIColor brownColor];
//    将mainVC设置为窗口的root view controller
    _window.rootViewController = mainVc;
    

    return YES;
}

/* 这些都可以删除
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
*/

@end
