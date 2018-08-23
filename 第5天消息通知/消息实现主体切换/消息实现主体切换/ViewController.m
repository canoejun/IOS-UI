//
//  ViewController.m
//  消息实现主体切换
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "ThemMange.h"
#import "ThemeImageView.h"
#import "Constants.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray * themeMutableArray;
@property (nonatomic,assign) int   index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    首先创建两张能够显示主题的图片
    ThemeImageView * v1 = [[ThemeImageView alloc]initWithFrame:CGRectMake(50, 200, 100, 50)];
    v1.imageName = @"1.png";
    [self.view addSubview:v1];
    
    
    ThemeImageView * v2 = [[ThemeImageView alloc]initWithFrame:CGRectMake(200, 200, 100, 50)];
    v2.imageName = @"2.png";
    [self.view addSubview:v2];
    
    self.index = 0;
    self.themeMutableArray  = [NSMutableArray arrayWithObjects:@"黑色",@"蓝色",@"粉色",nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
        [ThemMange sharedInstance].themName = [_themeMutableArray objectAtIndex:_index];
    
    if (_index++ == 2) {
        _index = 0;
    }
//    [ThemMange sharedInstance].themName = @"蓝色";
//    发通知
    [[NSNotificationCenter defaultCenter]postNotificationName:kThemeDidChangedNofitication object:nil];
    
    
}





@end









