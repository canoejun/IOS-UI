//
//  EBookView.h
//  电子书
//
//  Created by PengXiaodong on 2018/8/5.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBookView : UIView

/*
 接收外部传递过来的数据
 */
@property (nonatomic, copy) NSString *text;

/*
 设置字体
 */
@property (nonatomic, strong) UIFont *font;

/*
 是否需要动画
 */
@property (nonatomic, assign) BOOL animated;

@end










