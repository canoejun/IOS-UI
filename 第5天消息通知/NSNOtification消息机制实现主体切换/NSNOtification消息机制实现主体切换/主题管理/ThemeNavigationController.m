//
//  ThemeNavigationController.m
//  主题切换
//
//  Created by PengXiaodong on 2018/8/9.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ThemeNavigationController.h"
#import "Constants.h"
#import "ThemeManager.h"

@interface ThemeNavigationController ()

@end

@implementation ThemeNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadImage) name:kThemeDidChangeNotificationName object:nil];
    
    self.imageName = @"1.png";
}

- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    
    [self loadImage];
}

- (void)loadImage{
    UIImage *img = [[ThemeManager sharedInstance] getThemeImage:self.imageName];
    
    [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}
@end






