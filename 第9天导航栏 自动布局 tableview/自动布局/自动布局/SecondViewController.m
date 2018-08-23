//
//  SecondViewController.m
//  自动布局
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "SecondViewController.h"
#import "SDAutoLayout.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * redView = [[UIView alloc]initWithFrame:CGRectZero];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        <#code#>
    //    }];
    
    redView.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(self.view, 80).heightIs(130).widthRatioToView(self.view, 0.4);
}

@end
