//
//  TestLine.m
//  手势解锁的划线版
//
//  Created by 张俊 on 2018/8/10.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "TestLine.h"

@interface TestLine()
@property (nonatomic,assign) CGPoint  location;

@end

@implementation TestLine

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    self.location = location;
    [self setNeedsDisplay];
    
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    self.location = location;
    [self setNeedsDisplay];
}

//重写
-(void)drawRect:(CGRect)rect{
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 30)];
    [path addLineToPoint:_location];
    
    [path setLineWidth:10];
    [[UIColor redColor]set];
    
    
    [path stroke];
    
    
}


@end










