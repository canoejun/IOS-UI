//
//  EbookView.h
//  ebook2
//
//  Created by 张俊 on 2018/8/6.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EbookView : UIView

//需要外部设置的属性
@property (nonatomic,strong) NSString * text;
@property (nonatomic,assign) UIFont * fontsize;

@end
