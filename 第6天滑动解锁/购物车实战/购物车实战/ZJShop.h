//
//  ZJShop.h
//  购物车实战
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJShop : NSObject
/** 图片名称  */
@property (nonatomic,copy) NSString * icon;
/** 商品的名称  */
@property (nonatomic,copy) NSString * name;



-(instancetype)initWithDic:(NSDictionary *)dict;
+(instancetype)shopWithDic:(NSDictionary *)dict;
@end
