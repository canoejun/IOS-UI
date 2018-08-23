//
//  CALayer+LayerCOlor.m
//  自动布局
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "CALayer+LayerCOlor.h"

@implementation CALayer (LayerCOlor)
-(void)setBorderCGColor:(UIColor*)borderColor{
    self.borderColor = borderColor.CGColor;
}
@end
