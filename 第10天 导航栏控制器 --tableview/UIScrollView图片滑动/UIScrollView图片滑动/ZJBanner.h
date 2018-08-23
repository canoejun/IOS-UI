//
//  ZJBanner.h
//  UIScrollView图片滑动
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJBanner : NSObject

/** 标题名称  */
@property (nonatomic,copy) NSString * str;
/** 图片名称  */
@property (nonatomic,copy) NSString * img;

+(instancetype)ZJBannerWithDic:(NSDictionary *)dic;
@end
