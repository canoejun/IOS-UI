//
//  TestViewController.m
//  自动布局
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry.h"
#import "SDAutoLayout.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *greenTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *greenLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    
    
    
}

-(void)test{
#pragma mark ------ 用苹果自己提供的方式进行自动布局 ------
    /*
     *  1.首先必须将这个控件创建好，然后添加到一个视图上
     */
    UIView * redView = [[UIView alloc]initWithFrame:CGRectZero];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    /*
     *  2.添加约束
     *  万能公式：view1.attr1 = view2.attr2 * multiplier + constant
     */
    //   左
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
    
}

- (IBAction)buttonDidClicked:(UIButton *)sender {
    self.greenLeadingConstraint.constant = 200;
    self.greenTopConstraint.constant = 400;
    self.widthConstraint.constant = 150;
}

@end
