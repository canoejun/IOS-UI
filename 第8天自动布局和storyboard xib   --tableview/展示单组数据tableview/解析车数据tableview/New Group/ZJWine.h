//
//  ZJWine.h
//  解析车数据tableview
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJWine : NSObject

/** 名字  */
@property (nonatomic,copy) NSString * wineNameString;
/** 图标  */
@property (nonatomic,copy) NSString * iconNameString;
/** 价格  */
@property (nonatomic,copy) NSString * price;

+(instancetype)wineWithDic:(NSDictionary*)dict;

@end
