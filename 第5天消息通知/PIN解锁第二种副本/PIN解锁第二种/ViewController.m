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
    
    /*
    
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
    */
    
    
    #pragma mark ------ 消息中心的方式进行数据传递 ------
    //    1.获取应用程序的消息中心对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    
    
    //    2.注册消息 监听一个消息
    /*
     1.observer:谁来监听这个消息
     2.selector:消息触发了要去做什么事情
     3.object：注册消息的时候 是否需要参数
     */
    [center addObserver:self selector:@selector(test:) name:@"testNotificationName" object:nil];
    
    //    3.发送消息
        [center postNotificationName:@"name" object:@"jack"];
    //    center postNotificationName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#> userInfo:<#(nullable NSDictionary *)#>
    //    NSNotification封装消息的内容
    //    - name 消息的名称
    //    - object 消息的内容
    //    - userInfo 其他数据
    //
    
    
    
}
//    如果不需要参数
//    - （void）test{};
//    如果需要参数
//    - (void) test: (NSNotification *)noti{}
-(void)test{
    
}
- (void)test:(NSNotification *)notifi{
    /*
     {name = testNotificationName; object = jack}
     */
    NSString *uName = [notifi.object objectForKey:@"name"];
    
    NSString *pwd = [notifi.object objectForKey:@"pwd"];
    
    NSLog(@"%@", notifi.name);
    
    
    NSLog(@"消息触发了");
    

}




@end
