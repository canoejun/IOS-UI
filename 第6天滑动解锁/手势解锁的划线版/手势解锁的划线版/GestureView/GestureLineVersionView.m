//
//  GestureLineVersionView.m
//  手势解锁的划线版
//
//  Created by 张俊 on 2018/8/10.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "GestureLineVersionView.h"
#import "FactoryMethod.h"

#define kHidden NO



@interface GestureLineVersionView()
//用来保存这九个点的视图的数组
@property (nonatomic,strong) NSMutableArray * nineDotViewArray;
//用来保存选中的视图
@property (nonatomic,strong) NSMutableArray * selectedViewArray;
//记录手指的坐标
@property (nonatomic,assign) CGPoint  location;
//记录每次划过的每个点的tag组成的字符串 当做密码
@property (nonatomic,strong) NSMutableString * tempPasswordString;
//记录设置密码中第一次输入的密码字符串
@property (nonatomic,strong) NSString * firstTimePasswordString;
//始终记录上一个选中的点的tag值
@property (nonatomic,assign) NSInteger  lastselectedTag;


@end


@implementation GestureLineVersionView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
//        初始化属性变量
        self.nineDotViewArray = [NSMutableArray array];
        self.selectedViewArray = [NSMutableArray array];
        self.tempPasswordString = [NSMutableString string];
        
        [self initUI];
        
        
    }
    return self;
    
}

#pragma mark ------ 布局界面 ------
-(void)initUI{
//    布局九个点
    NSInteger indextag = 1;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            UIImageView * dotImageView = [FactoryMethod imageViewWithFrame:CGRectMake(63 + j*99, 250+i*99, 52, 52) name:@"CheckBox_Normal" tag:indextag hidden:kHidden container:self];
            [self.nineDotViewArray addObject:dotImageView];
            indextag++;
        }
    }
}



#pragma mark ------ 处理触摸事件 ------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    self.location = [touch locationInView:self];
    
    for (UIImageView * dotView in _nineDotViewArray) {
        if (CGRectContainsPoint(dotView.frame, _location) && dotView.hidden == kHidden) {
            dotView.hidden = !kHidden;
            [_selectedViewArray addObject:dotView];
            self.lastselectedTag = dotView.tag;
            [_tempPasswordString appendFormat:@"%ld",_lastselectedTag];
        }
    }
    
    [self setNeedsDisplay];
    
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    self.location = [touch locationInView:self];
    
    for (UIImageView * dotView in _nineDotViewArray) {
        if (CGRectContainsPoint(dotView.frame, _location) && dotView.hidden == kHidden) {
            dotView.hidden = !kHidden;
            [_selectedViewArray addObject:dotView];
            self.lastselectedTag = dotView.tag;
            [_tempPasswordString appendFormat:@"%ld",_lastselectedTag];
        }
    }
    
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UIImageView * dotImageView in _selectedViewArray) {
        dotImageView.hidden = kHidden;
        
    }
    
//    清空路径的话，那么就是将数组清空，重新画图
    [_selectedViewArray removeAllObjects];
    [self setNeedsDisplay];
//    判断密码
    NSLog(@"%@",_tempPasswordString);
}


//重写
//当程序进行起来的时候，就会调用这个方法，当数组没有值的时候，那么就不会调用
-(void)drawRect:(CGRect)rect{
    if (_selectedViewArray.count) {
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        for (int i = 0; i < _selectedViewArray.count; i++) {
            UIImageView * imgView = _selectedViewArray[i];
            if (i == 0) {
                [path moveToPoint:imgView.center];
            }else{
                [path addLineToPoint:imgView.center];
            }
        }
        
        //    绘制到手指的点
        [path addLineToPoint:_location];
        
        [path setLineWidth:10];
        [[UIColor redColor]set];
        
        
        //    线条拐角处的处理
        path.lineCapStyle = kCGLineCapRound;
        //    线条终点处理
        [path setLineJoinStyle:kCGLineJoinRound];
        
        //    绘制路径  绘制线条
        [path stroke];
        
        //    线条的链接后，进行填充
        //    [path fill];
    }
}



@end












