//
//  XMGCar.h
//  索引条
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGCar : NSObject

/** 每一辆车的图标  */
@property (nonatomic,copy) NSString * icon;
/** 每一辆车的车名  */
@property (nonatomic,copy) NSString * name;

+(instancetype)carWithDic:(NSDictionary *)dic;
@end
