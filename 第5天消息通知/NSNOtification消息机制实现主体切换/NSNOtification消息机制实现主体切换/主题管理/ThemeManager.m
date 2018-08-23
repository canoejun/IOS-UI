//
//  ThemeManager.m
//  主题切换
//
//  Created by PengXiaodong on 2018/8/9.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *instance = nil;

@implementation ThemeManager

+ (ThemeManager *)sharedInstance{
    if (instance == nil){
        instance = [[ThemeManager alloc] init];
        
        //提供一个默认的
        instance.themeName = @"粉色";
    }
    return instance;
}

- (UIImage *)getThemeImage:(NSString *)imageName{
    //图片路径
    //程序的更路径/theme/主题/imageName
    //1.获取程序的根路径
    NSString *path = [[NSBundle mainBundle] resourcePath];
    
    //2. 拼接路径
    NSString *imagePath = [NSString stringWithFormat:@"%@/theme/%@/%@",path, self.themeName, imageName];
    
    //3. 获取图片
    UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
    
    return img;
}
@end











