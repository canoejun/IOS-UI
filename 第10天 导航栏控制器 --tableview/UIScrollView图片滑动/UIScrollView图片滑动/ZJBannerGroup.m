//
//  ZJBannerGroup.m
//  UIScrollView图片滑动
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJBannerGroup.h"
#import "ZJBanner.h"

@implementation ZJBannerGroup

+(instancetype)ZJBannerGroupWithDic:(NSDictionary *)dic{
    ZJBannerGroup * group = [self new];
    group.lanmu = dic[@"lanmu"];
//    用个数组储存
    NSMutableArray * tempArr = [NSMutableArray array];
    for (NSDictionary * tempDic in dic[@"banner"]) {
        [tempArr addObject: [ZJBanner ZJBannerWithDic:tempDic]];
    }
    group.banner = tempArr;
    return group;
}

@end
