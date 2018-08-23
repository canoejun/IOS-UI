//
//  ViewController.m
//  新浪微博小功能页面窗口
//
//  Created by 张俊 on 2018/8/4.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

#define kOffset 20
#define kHeight 90
#define kWidth 90
#define kPadding ((self.view.frame.size.width-20-20-3*kWidth)*0.5)

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray * itemsViewArray;
@property (nonatomic,strong) NSMutableArray * imagesNameArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemsViewArray = [[NSMutableArray alloc]initWithCapacity:3];
    
    for (int i = 0; i < 3; i++) {
        UIView * tempView = [[UIView alloc]initWithFrame:CGRectMake(kOffset + (kWidth + kPadding)*i, self.view.frame.size.height + 10, kWidth, kHeight)];
        tempView.layer.cornerRadius = kWidth * 0.5;
//        tempView.backgroundColor = [UIColor orangeColor];
        tempView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"12"]];
        
        [self.view addSubview:tempView];
        [_itemsViewArray addObject:tempView];
    }
    
    
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //先获取动画的对象
    for (int i = 0; i < self.itemsViewArray.count; i++) {
        UIView * aview = [self.itemsViewArray objectAtIndex:i];
        [UIView animateWithDuration:2 delay:i*0.2 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
            aview.center = CGPointMake(aview.center.x, 200);
//            [NSTimer scheduledTimerWithTimeInterval:0.001 repeats:YES block:^(NSTimer * _Nonnull timer) {
//                aview.transform = CGAffineTransformRotate(aview.transform, 2/180.0*M_PI);
//            }];
            
        } completion:nil];
    }
    
}

@end
