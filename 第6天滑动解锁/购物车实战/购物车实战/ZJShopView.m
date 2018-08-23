//
//  ZJShopView.m
//  购物车实战
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJShopView.h"

@interface ZJShopView ()
/** tupian  */
@property (nonatomic,strong) UIImageView * iconView;
/** biaoti  */
@property (nonatomic,strong) UILabel * titleLabel;
@end

@implementation ZJShopView
// 构造方法
- (instancetype)initWithShop: (ZJShop *)shop{
    if (self = [super init]) {
        [self setUp];
        self.shop = shop;
    }
    return self;
}
+ (instancetype)shopViewWithShop: (ZJShop *)shop{
    return [[self alloc]initWithShop:shop];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    // 创建商品的UIImageView对象
    self.iconView = [[UIImageView alloc] init];
    //        iconView.frame = CGRectMake(0, 0, width, width);
    _iconView.backgroundColor = [UIColor blueColor];
    [self addSubview:_iconView];
    
    // 创建商品标题对象
    self.titleLabel = [[UILabel alloc] init];
    //        titleLabel.frame = CGRectMake(0, width, width, height - width);
    _titleLabel.backgroundColor = [UIColor yellowColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter; // 居中
    [self addSubview:_titleLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
//    NSLog(@"%f   %f",width,height);
    
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}


-(void)setShop:(ZJShop *)shop{
    _shop = shop;
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
    
}

@end







