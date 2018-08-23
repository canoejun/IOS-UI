//
//  ZJShop.m
//  购物车实战
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJShop.h"

@implementation ZJShop
-(instancetype)initWithDic:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
    
}
+(instancetype)shopWithDic:(NSDictionary *)dict{
    return [[self alloc]initWithDic:dict];
}

@end
