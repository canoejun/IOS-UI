//
//  ChangeableImageView.m
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ChangeableImageView.h"

@implementation ChangeableImageView
-(void)showNormalImage{
    self.image = [UIImage imageNamed:self.noramalImageName];
}
-(void)showWrongImage{
    self.image = [UIImage imageNamed:self.wrongImageName];
}
@end
