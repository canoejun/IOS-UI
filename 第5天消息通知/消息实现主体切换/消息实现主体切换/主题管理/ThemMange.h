//
//  ThemMange.h
//  消息实现主体切换
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemMange : NSObject

//主题颜色
@property (nonatomic,strong) NSString * themName;

//记录显示的哪一张照片
-(UIImage *)getThemeImage:(NSString *)imageName;

//主题管理是单例
+(ThemMange*)sharedInstance;




@end
