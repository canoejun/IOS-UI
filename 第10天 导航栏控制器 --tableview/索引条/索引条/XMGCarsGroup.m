//
//  XMGCarsGroup.m
//  索引条
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "XMGCarsGroup.h"
#import "XMGCar.h"

@implementation XMGCarsGroup

+(instancetype)XMGCarsGroupWith:(NSDictionary *)dic{
    XMGCarsGroup * group = [self new];
    group.title = dic[@"title"];
    NSMutableArray * tempArr = [NSMutableArray array];
    for (NSDictionary * tempDic in dic[@"cars"]) {
        [tempArr addObject:[XMGCar carWithDic:tempDic]];
    }
    group.cars = tempArr;
    
    return group;
}

@end
