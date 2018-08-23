//
//  ZJShopView.h
//  购物车实战
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJShop.h"

@class ZJShop;
@interface ZJShopView : UIView

/** 模型属性  */
@property (nonatomic,strong) ZJShop * shop;

// 构造方法
- (instancetype)initWithShop: (ZJShop *)shop;
+ (instancetype)shopViewWithShop: (ZJShop *)shop;

@end
