//
//  ViewController.m
//  UIView动画
//
//  Created by 张俊 on 2018/8/4.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView * redview;
@property (nonatomic,strong) UIView * balckView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redview = [[UIView alloc]initWithFrame:CGRectMake(140, 200, 100, 100)];
    _redview.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redview];
    
//    self.balckView = [[UIView alloc]initWithFrame:CGRectMake(140, 200, 200, 100)];
//    _balckView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_balckView];
}
//渐变  alpha 0全透明 1不透明
-(void)test1{
//    _redview.alpha = 0;
    self.redview.transform = CGAffineTransformIdentity;
    
}


-(void)test2{
    [UIView animateWithDuration:1 animations:^{
        //         放大
        self.redview.frame =CGRectMake(150, 200, self.redview.frame.size.width*2, self.redview.frame.size.height*2);
    }];
}
-(void)test3{
    [UIView animateWithDuration:1 animations:^{
//        翻书的效果
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.redview cache:NO];
    } completion:^(BOOL finished) {
        [self.redview removeFromSuperview];
    }];
}


//弹簧效果   只要是动画那么就能够使用
-(void)test4{
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.redview.transform = CGAffineTransformTranslate(self.redview.transform, 0, 20);
    } completion:^(BOOL finished) {
        
    }];
   
}

-(void)test5{
//    旋转
    [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.redview.transform = CGAffineTransformRotate(self.redview.transform,2/180.0* M_PI);
    }];
    
}

-(void)heartBeat{
//   可以让重复的方法
    [NSTimer scheduledTimerWithTimeInterval:0.7 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [UIView animateWithDuration:0.4 animations:^{
            self.redview.transform = CGAffineTransformScale(self.redview.transform, 1.3, 1.3);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
//                没有make的方法可以执行多次，有make的只能够执行一次
                self.redview.transform = CGAffineTransformScale(self.redview.transform, 1/1.3, 1/1.3);
            } completion:nil];
        }];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    [UIView animateWithDuration:0.6 animations:;^{
//        _redview.alpha = 0;
//    }];
    
//    [self test2];
//    self.balckView.transform = CGAffineTransformScale(self.balckView.transform, 2, 2);
    
//    [self heartBeat];
    [self test5];
    
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    使用Block动画
    [UIView animateWithDuration:1 animations:^{
//        具体属性的变化 最终状态在这里
        _redview.alpha = 1;
    }];
//    NSLog(@"%ld",CFGetRetainCount(CFBridgingRetain(_redview)));
}





@end









