//
//  ViewController.m
//  2.PIN解锁版本二
//
//  Created by PengXiaodong on 2018/8/8.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) PINLockView *pinView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pinView = [[PINLockView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_pinView];
    
    //1.获得应用程序的消息中心对象
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    //2.注册消息 监听一个消息
    /*
     1.observer 谁来监听这个消息
     2.selector:消息触发了要去做什么事情
     3.object: 注册消息的时候 是否需要向消息中心传递点数据
     */
    [center addObserver:self selector:@selector(test:) name:@"testNotificationName" object:nil];
    
//    [center addObserverForName:@"testNotificationName" object:nil queue:[[NSOperationQueue alloc] init] usingBlock:^(NSNotification * _Nonnull note) {
//        NSString *uName = [note.object objectForKey:@"name"];
//
//        NSString *pwd = [note.object objectForKey:@"pwd"];
//
//        NSLog(@"%@", note.name);
//
//        NSLog(@"消息触发了");
//    }];
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








