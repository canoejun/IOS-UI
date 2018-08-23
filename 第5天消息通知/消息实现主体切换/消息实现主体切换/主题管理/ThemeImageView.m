
//
//  ThemeImageView.m
//  消息实现主体切换
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ThemeImageView.h"

@implementation ThemeImageView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        监听消息
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadImage) name:kThemeDidChangedNofitication object:nil];
        
    }
    return self;
}
//一开始就得给一个显示的图片
//在set方法中进行重写
-(void)setImageName:(NSString *)aImageName{
    _imageName = aImageName;
    
//    将显示的照片传给管理器，告诉他显示什么内容
    [self loadImage];
}



-(void)loadImage{
//    想主题中获取相应的图片
    self.image = [[ThemMange sharedInstance]getThemeImage:_imageName];
}






@end















