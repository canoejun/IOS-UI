//
//  ZJBanner.m
//  UIScrollView图片滑动
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJBanner.h"

@implementation ZJBanner

+(instancetype)ZJBannerWithDic:(NSDictionary *)dic{
    ZJBanner * item = [ZJBanner new];
    [item setValuesForKeysWithDictionary:dic];
    return item;
}

@end
