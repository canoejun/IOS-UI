//
//  ZJModuleView.h
//  网易新闻选择小模块
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJModuleView : UIButton

-(instancetype)initWithModule:(NSString*)moduleName;
+(instancetype)moduleWithString:(NSString *)moduleName;

-(UIButton*)deleteButton;
-(NSString*)anttentionMessage;

@end
