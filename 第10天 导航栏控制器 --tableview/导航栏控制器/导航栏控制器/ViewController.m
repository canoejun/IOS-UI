//
//  ViewController.m
//  导航栏控制器
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
}
- (IBAction)clickToNext:(id)sender {
//    这是自己创建的界面，需要直接进入storyboard中创建的界面
//    TwoViewController * tVC = [TwoViewController new];
    
//    首先找到mainstoryboard
    UIStoryboard * mainBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    通过唯一表示进行查找，然后得出来那个控制器
    TwoViewController * tVC = [mainBoard instantiateViewControllerWithIdentifier:@"fuck"];
    
    [self.navigationController pushViewController:tVC animated:YES];
    
}


@end












