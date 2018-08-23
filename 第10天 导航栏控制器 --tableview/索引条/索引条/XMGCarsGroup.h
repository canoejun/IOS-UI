//
//  XMGCarsGroup.h
//  索引条
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGCarsGroup : NSObject

/** 保存车组的数组  */
@property (nonatomic,strong) NSArray * cars;
/** 每一组车的头部标题  */
@property (nonatomic,copy) NSString * title;

+(instancetype)XMGCarsGroupWith:(NSDictionary *)dic;

@end
