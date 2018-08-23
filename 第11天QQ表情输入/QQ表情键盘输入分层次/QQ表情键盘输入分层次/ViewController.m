//
//  ViewController.m
//  QQ表情键盘输入分层次
//
//  Created by 张俊 on 2018/8/18.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "OperaionView.h"

@interface ViewController ()
/** 操作视图的位置  */
@property (nonatomic,strong) OperaionView * operation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.operation = [OperaionView showOperationViewWithFrame:CGRectMake(0, self.view.frame.size.height-60,self.view.frame.size.width,60) andContainView:self.view];
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.operation hidekeyboard];
}


@end







