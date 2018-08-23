//
//  ThemeViewController.m
//  消息实现主体切换
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ThemeViewController.h"
#import "Constants.h"
#import "ThemMange.h"

@interface ThemeViewController ()

@end

@implementation ThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadImage) name:kThemeDidChangedNofitication object:nil];
    
    self.imagename = @"1.png";
    
}

-(void)setImagename:(NSString *)aImagename{
    _imagename = aImagename;
    
    [self loadImage];
}

-(void)loadImage{
    [self.navigationBar setBackgroundImage:[[ThemMange sharedInstance]getThemeImage:self.imagename] forBarMetrics:UIBarMetricsDefault];
    
    
}


@end








