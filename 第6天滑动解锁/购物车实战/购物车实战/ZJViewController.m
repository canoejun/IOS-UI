//
//  ZJViewController.m
//  购物车实战
//
//  Created by 张俊 on 2018/8/11.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ZJViewController.h"
#import "ZJShop.h"
#import "ZJShopView.h"

@interface ZJViewController ()
//购物车
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
//添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;
//删除按钮
@property (weak, nonatomic) IBOutlet UIButton *remove;

/** 数据数组  */
@property (nonatomic,strong) NSMutableArray * dataArr;
@end

@implementation ZJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
 *  懒加载
 */
-(NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
       NSString * path = [[NSBundle mainBundle]pathForResource:@"shopdata.plist" ofType:nil];
        NSArray * dataA = [NSArray arrayWithContentsOfFile:path];        for (NSDictionary * dic in dataA) {
            ZJShop * shop = [ZJShop shopWithDic:dic];
            [_dataArr addObject:shop];
        }
    }
    return _dataArr;
}

/*
 *  添加按钮做的事情
 */
- (IBAction)add:(UIButton *)button {
   
    
    NSInteger allCols = 3;
    CGFloat height = 100;
    CGFloat width = 80;
    CGFloat widthMargin = (self.shopCarView.frame.size.width-allCols * width)/(allCols-1);
    CGFloat heightMargin = (self.shopCarView.frame.size.height-2*height)/1;
    NSInteger index = [self.shopCarView subviews].count;
    CGFloat x = (width + widthMargin)*(index%allCols);
    CGFloat y = (height + heightMargin)*(index/allCols);
    
    
    /*******************添加视图 设置数据********************/
//    ZJShopView * shopView = [[ZJShopView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    ZJShopView * shopView = [ZJShopView shopViewWithShop:self.dataArr[index]];
    shopView.frame = CGRectMake(x, y, width, height);
    [_shopCarView addSubview:shopView];
    
    [self.remove setImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    self.remove.enabled = YES;
    if (index == 5) {
        self.addButton.enabled = NO;
        [self.addButton setImage:[UIImage imageNamed:@"add_disabled"] forState:UIControlStateNormal];
    }
}



/*
 *  删除按钮做的事情
 */
- (IBAction)remove:(UIButton *)button {
    
    [[[self.shopCarView subviews]lastObject] removeFromSuperview];
    if (self.shopCarView.subviews.count == 0) {
         [self.remove setImage:[UIImage imageNamed:@"remove_disabled"] forState:UIControlStateNormal];
        self.remove.enabled = NO;
    }
    [self.addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    self.addButton.enabled = YES;
    
}

@end








