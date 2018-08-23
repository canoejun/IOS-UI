//
//  ZJWine.m
//  解析车数据tableview
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJWine.h"

@implementation ZJWine

+(instancetype)wineWithDic:(NSDictionary*)dict{
    ZJWine * wine = [[ZJWine alloc]init];
//    从plist文件中解析的时候可以采用这种方式进行解析，但是如果里面嵌套了其他的字典，那么会导致借此出来不正确，这时候不能够使用，只能够单独解析
//    [wine setValuesForKeysWithDictionary:dict];
    wine.wineNameString = dict[@"name"];
    wine.iconNameString = dict[@"image"];
    wine.price = dict[@"money"];
    return wine;
}

@end
