//
//  ThemeManager.h
//  主题切换
//
//  Created by PengXiaodong on 2018/8/9.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeManager : NSObject
//1. 能够记录当前的主题
@property (nonatomic, strong) NSString *themeName;

//2. 能够获取某张图片在当前主题下对应的图片 1.png
- (UIImage *)getThemeImage:(NSString *)imageName;

//3. 提供一个类方法 快速获取一个对象 保证只有一个
+ (ThemeManager *)sharedInstance;

@end










