//
//  ViewController.m
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "PINUnlockedView.h"
#import "GestureUnlockView.h"

@interface ViewController()
@property (nonatomic,strong) PINUnlockedView * plvView;
@property (nonatomic,strong) GestureUnlockView * glvView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"1" forKey:@"UnlockType"];
    [userDefaults setObject:nil forKey:@"password"];//清空密码
//    清空本次程序所有的默认条件
    [userDefaults removePersistentDomainForName:[[NSBundle mainBundle]bundlePath]];
    
//    用户设置的是什么类型
    NSString * unlockType = [userDefaults objectForKey:@"UnlockType"];
    if ([unlockType isEqualToString:@"1"]) {
        self.glvView = [[GestureUnlockView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_glvView];
        //    因为会循环引用
        __weak typeof(_glvView)weakGlvView = _glvView;
        _glvView.block = ^(BOOL success) {
            if (success == YES) {
                //             删除视图  进入到下一个界面
                [UIView animateWithDuration:1 animations:^{
                    weakGlvView.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [weakGlvView removeFromSuperview];
                }];
                
            }else{
                return ;
            }
        };
    }else{
        self.plvView = [[PINUnlockedView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_plvView];
        //    因为会循环引用
        __weak typeof(_plvView)weakPlvView = _plvView;
        _plvView.block = ^(BOOL success) {
            if (success == YES) {
                //     因为直接在这个界面上调用视图，视图需要返回给这个界面一个值，需要让这个界面进行判断 所以这时候需要一个返回值
                //    这时候后可以调用block或者是delegate进行回调
                //             删除视图  进入到下一个界面
                [UIView animateWithDuration:1 animations:^{
                    weakPlvView.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [weakPlvView removeFromSuperview];
                }];
                
            }else{
                return ;
            }
        };
    }
}


@end
