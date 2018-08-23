//
//  ColumItem.m
//  Storyboard和xib
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ColumItem.h"

@implementation ColumItem

/*
 *  如果要在其他的视图里面直接添加这个自定义视图的话，那么在这里只需要重写awakefromnib方法
 */
//当程序加载的时候，会自动调用这个   不会再调用init和initwithframe
-(void)awakeFromNib{
    [super awakeFromNib];
    
//    谁调用这个控件，那么就是谁是self
    self.backgroundColor = [UIColor redColor];
    ColumItem * item = [[[NSBundle mainBundle]loadNibNamed:@"ColumItem" owner:nil options:nil]lastObject];
    [self addSubview:item];
}

-(void)layoutSubviews{
    self.frame = CGRectMake(0, 20, 40, 40);
    
    
}


@end











