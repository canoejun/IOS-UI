//
//  TwoViewController.m
//  导航栏控制器
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "TwoViewController.h"
#import "ViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    
}
- (IBAction)clickToBack:(id)sender {
    
    
//    ViewController * oVC = [ViewController new];
//
//    [self.navigationController popToViewController:oVC animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController dismissViewControllerAnimated:YES completion:^{
//        nil;
//    }];
    
    
}


@end
