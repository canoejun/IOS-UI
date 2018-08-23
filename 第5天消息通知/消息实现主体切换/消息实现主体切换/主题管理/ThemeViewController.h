//
//  ThemeViewController.h
//  消息实现主体切换
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>


//记住需要在main.storyboard里面进行修改内容  将默认的contrller 改成你自己继承的controller
@interface ThemeViewController : UINavigationController

@property (nonatomic,strong) NSString * imagename;
@end
