//
//  ThemeImageView.m
//  主题切换
//
//  Created by PengXiaodong on 2018/8/9.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ThemeImageView.h"
#import "Constants.h"
#import "ThemeManager.h"

@implementation ThemeImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil){
        //监听消息
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadImage) name:kThemeDidChangeNotificationName object:nil];
    }
    return self;
}

- (void)setImageName:(NSString *)aImageName{
    _imageName = aImageName;
    
    [self loadImage];
}

- (void)loadImage{
    //向themeManager获取对应主题的图片
    UIImage *img = [[ThemeManager sharedInstance] getThemeImage:self.imageName];
    
    //改变显示的图片
    self.image = img;
}

@end








