//
//  ZJSettingGroups.h
//  tableview
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJSettingGroups : NSObject
/** 头部标题  */
@property (nonatomic,strong) NSString * headerNameString;
/** 尾部标题  */
@property (nonatomic,strong) NSString * footerNameString;
/** 每一组所有的设置  */
@property (nonatomic,strong) NSArray * eachSettingArray;
//@property (nonatomic,strong) NSDictionary * eachSettingDict;



//-(instancetype)initWithZJSettingGroupheader:(NSString *)header andFooter:(NSString *)footer andEachSetting:(NSDictionary *)eachSettingDic;
//+(instancetype)ZJSettingGroupsheader:(NSString *)header andFooter:(NSString *)footer andEachSetting:(NSDictionary *)eachSettingDic;

@end
