//
//  ViewController.m
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "PINUnlockedView.h"

@interface ViewController()
@property (nonatomic,strong) PINUnlockedView * plvView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.plvView = [[PINUnlockedView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_plvView];
    
    
    
    __weak typeof(_plvView)weakPlvVIew = _plvView;
    _plvView.block = ^(BOOL sucess) {
        if (sucess == YES) {
            [weakPlvVIew removeFromSuperview];
        }
    };
//    因为会循环引用
//    __weak typeof(_plvView)weakPlvView = _plvView;
//    _plvView.block = ^(BOOL success) {
//        if (success == YES) {
////             删除视图  进入到下一个界面
//            [UIView animateWithDuration:1 animations:^{
//                weakPlvView.alpha = 0.0;
//            } completion:^(BOOL finished) {
//                [weakPlvView removeFromSuperview];
//            }];
//
//        }else{
//            return ;
//        }
//    };
    
//     因为直接在这个界面上调用视图，视图需要返回给这个界面一个值，需要让这个界面进行判断 所以这时候需要一个返回值
//    这时候后可以调用block或者是delegate进行回调
    

}




@end
