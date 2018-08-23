//
//  ZJEachSetting.h
//  tableview
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJEachSetting : NSObject
/** 设置的名字  */
@property (nonatomic,copy) NSString * settingName;
/** 设置的图片名字  */
@property (nonatomic,copy) NSString * iconName;

+(instancetype)ZJEachSettingWithname:(NSString *)settingName iconname:(NSString *)iconName;

@end
