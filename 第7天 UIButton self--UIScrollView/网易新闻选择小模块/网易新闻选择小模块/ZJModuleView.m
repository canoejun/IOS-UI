//
//  ZJModuleView.m
//  网易新闻选择小模块
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJModuleView.h"

@interface ZJModuleView ()
/** 删除按钮  */
@property (nonatomic,strong) UIButton * deleteButton;
@end

@implementation ZJModuleView

-(instancetype)initWithModule:(NSString*)moduleName{
    if (self = [super init]) {
//        设置这个视图的属性
        [self setBackgroundImage:[UIImage imageNamed:@"ring"] forState:UIControlStateNormal];
        [self setTitle:moduleName forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        添加删除按钮
        self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.deleteButton setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        self.deleteButton.hidden = YES;
        [self addSubview:_deleteButton];
    }
    return self;
    
}
+(instancetype)moduleWithString:(NSString *)moduleName{
    return [[ZJModuleView alloc]initWithModule:moduleName];
}


-(void)layoutSubviews{
    [super layoutSubviews];
//    设置大小
    self.deleteButton.frame = CGRectMake(0, 0, 20, 20);
}


//设置能够外界调用的事件
-(UIButton*)deleteButton{
    return _deleteButton;
    
}

-(NSString*)anttentionMessage{
    return self.titleLabel.text;
}


@end
