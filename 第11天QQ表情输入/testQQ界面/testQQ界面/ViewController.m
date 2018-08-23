//
//  ViewController.m
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/18.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ViewController.h"
#import "OperationView.h"

@interface ViewController ()
@property (nonatomic, strong) OperationView *opView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //需要显示一个输入框 创建输入框
    self.opView = [OperationView showOperationViewWithFrame:CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 60) andFather:self.view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.opView hideKeyboard];
}
@end







