//
//  XMGCar.m
//  索引条
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "XMGCar.h"

@implementation XMGCar

+(instancetype)carWithDic:(NSDictionary *)dic{
    XMGCar * car = [self new];
    [car setValuesForKeysWithDictionary:dic];
    return car;
}
@end
