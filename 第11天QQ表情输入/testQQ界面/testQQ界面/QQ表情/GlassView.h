//
//  GlassView.h
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/19.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlassView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;

+ (GlassView *)glassViewWithFrame:(CGRect)frame container:(UIView *)containerView;

@end














