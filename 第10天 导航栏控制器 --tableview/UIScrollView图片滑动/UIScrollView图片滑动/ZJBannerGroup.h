//
//  ZJBannerGroup.h
//  UIScrollView图片滑动
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJBannerGroup : NSObject
/** 标题栏目数组的名称  */
@property (nonatomic,copy) NSString * lanmu;
/** 每个栏目的图片和名称  */
@property (nonatomic,copy) NSArray * banner;

+(instancetype)ZJBannerGroupWithDic:(NSDictionary *)dic;

@end
