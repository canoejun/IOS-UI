//
//  ViewController.m
//  UILable
//
//  Created by 张俊 on 2018/8/4.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    文本自适应
    //size：计算的参考尺寸 必须高度或者是宽度确定
    NSString * text = @"the controller's view is loaded into memory.This method is called after the view controller has loaded its view hierarchy into memory. This method is called regardless of whether the view hierarchy was loaded from a nib ";
    //    指定计算文本宽高时 指定所用字体的字号和字体
    NSDictionary * attDic = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGSize realSize =  [text boundingRectWithSize:CGSizeMake(self.view.bounds.size.width-40, 30000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil].size;
    
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30, 40,self.view.bounds.size.width-60,realSize.height)];
    label.text = text;
//    换行方式
    label.lineBreakMode = NSLineBreakByWordWrapping;
//    设置字体颜色
    label.textColor = [UIColor purpleColor];
//    设置字体和字号
//    label.font = [UIFont fontWithName:@"Menlo" size:17];
//    或者是
    label.font = [UIFont systemFontOfSize:16 weight:20];
    label.font = [UIFont systemFontOfSize:17];
//    NSLog(@"%@",[UIFont familyNames]);
    
//    对齐方式
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
////    设置阴影
    label.layer.shadowColor = [UIColor blackColor].CGColor;
    label.layer.shadowOffset =  CGSizeMake(50, 50);
    label.layer.shadowRadius = 50;
    label.layer.shadowOpacity = 1;
        //两个的shadow不一样子的，一个是图层的，一个是文字的
//    label.shadowColor = [UIColor blackColor];
//    label.shadowOffset = CGSizeMake(50, 50);
    
    
    

    
    
    
    
    
    
}








@end













