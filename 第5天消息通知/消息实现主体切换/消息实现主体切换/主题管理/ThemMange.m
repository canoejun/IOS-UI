//
//  ThemMange.m
//  消息实现主体切换
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ThemMange.h"

//为了保证是单例对象 这时候需要定义一个静态的全局变量
static ThemMange * instance = nil;

@implementation ThemMange


//主题管理是单例
+(ThemMange*)sharedInstance{
    if (instance == nil) {
        instance = [[ThemMange alloc]init];
        
        instance.themName = @"粉色";
    }
    return instance;
}





//记录显示的哪一张照片
-(UIImage *)getThemeImage:(NSString *)imageName{
//    图片的路径
//    程序的根路径/theme/主题/imagename
    
//    获取根路径下的位置
    NSString * path = [[NSBundle mainBundle]resourcePath];
    
//    找到需要的照片
    NSString * imagePath = [NSString stringWithFormat:@"%@/theme/%@/%@",path,self.themName,imageName];
    
//    获取图片
    UIImage * targetImage = [UIImage imageWithContentsOfFile:imagePath];
    
    return targetImage;
}





@end













