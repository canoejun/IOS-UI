//
//  CALayer+LayerCOlor.h
//  自动布局
//
//  Created by 张俊 on 2018/8/15.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


/*
 *  使用扩展类别方法进行设置，在storyboard里面进行kvc进行方法的设置
 */
@interface CALayer (LayerCOlor)

-(void)setBorderCGColor:(UIColor*)borderColor;

@end
