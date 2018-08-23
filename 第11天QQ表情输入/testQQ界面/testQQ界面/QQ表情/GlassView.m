//
//  GlassView.m
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/19.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "GlassView.h"

@implementation GlassView

+ (GlassView *)glassViewWithFrame:(CGRect)frame container:(UIView *)containerView{
    GlassView *gv = [[[NSBundle mainBundle] loadNibNamed:@"GlassView" owner:nil options:nil] lastObject];
    [containerView addSubview:gv];
    
    return gv;
}

@end











