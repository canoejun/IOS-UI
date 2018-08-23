//
//  ZJEachSetting.m
//  tableview
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJEachSetting.h"

@implementation ZJEachSetting

+(instancetype)ZJEachSettingWithname:(NSString *)settingName iconname:(NSString *)iconName{
    ZJEachSetting * temp = [[self alloc ]init];
    temp.settingName = settingName;
    temp.iconName = iconName;
    return temp;
}

@end
