//
//  EBookView.m
//  电子书
//
//  Created by PengXiaodong on 2018/8/5.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "EBookView.h"

typedef enum{
    kAnimationTypeUp,
    kAnimationTypeDown
} kAnimationType;

@interface EBookView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSMutableArray *pageRangesArray;
@end

@implementation EBookView

//让这个类来管理电子书的显示和操作

//创建一个类 让这个类继承与UIView
//自定义一个控件  通常都是去重写initWithFrame方法
//在这个方法里面实现 视图的布局
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self != nil){
        //创建label用于显示文本信息
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _label.backgroundColor = [UIColor whiteColor];
        _label.numberOfLines = 0;
        _label.font = self.font;
        [self addSubview:_label];
        
        //获取第一页的内容 显示出来
        //不能再这里做 因为initWithFrame的时候text还没有数据
        
        //初始化数组
        self.pageRangesArray = [NSMutableArray array];
        
        self.animated = YES;
    }
    return self;
}

//重写set方法
- (void)setText:(NSString *)aText{
    _text = [aText copy];
    
    //显示第一页的内容
    self.label.font = self.font;
    NSRange firstPageRange = [self calculatePageRange:0];
    self.label.text = [self.text substringWithRange:firstPageRange];
}

//重写font的get方法
- (UIFont *)font{
    if(_font == nil){
        //外部没有设置  给一个默认值
        self.font = [UIFont systemFontOfSize:16];
    }
    return _font;
}

//计算之前得确保是有数据的
- (NSRange)calculatePageRange:(NSInteger)page{
    NSRange range = NSMakeRange(0, 0);
    
    //将上一页的range拿出来
    if (page > 0){
        NSValue *rgValue = [self.pageRangesArray objectAtIndex:page-1];
        NSRange preRange = [rgValue rangeValue];
        
        //记录page也对应的起始位置
        range.location = preRange.location + preRange.length;
    }
    
    for (int i = 0; i < self.text.length; i++) {
        //改变length的值
        range.length++;
        
        //获取当前这个range对应子字符串
        NSString *subString = [self.text substringWithRange:range];
        
        //计算subString的高度
        CGSize realSize = [subString boundingRectWithSize:CGSizeMake(self.label.bounds.size.width, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
        
        //判断是否超过这个显示的高度了
        if (realSize.height > self.label.bounds.size.height){
            //让range保存这一页的长度
            range.length --;

            //保存这个range
            NSValue *rgValue = [NSValue valueWithRange:range];
            [self.pageRangesArray addObject:rgValue];
            
            return range;
        }
    }
    
    //最后一页
    if(range.length > 0){
        //保存这个range
        NSValue *rgValue = [NSValue valueWithRange:range];
        [self.pageRangesArray addObject:rgValue];
        
        return range;
    }else{
        return NSMakeRange(0, 0);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    NSRange currentPageRange = [[self.pageRangesArray objectAtIndex:_currentPage] rangeValue];
    //判断上一页还是下一页
    if (location.x > self.center.x){
        //下一页
        //判断是否越界了
        if (currentPageRange.location + currentPageRange.length < self.text.length){
            [self changePage:_currentPage+1];
        }
    } else{
        //上一页
        if (_currentPage > 0){
            [self changePage:_currentPage-1];
        }
    }
}

//切换页面 如果有了就不用加载  如果没有就需要加载
- (void)changePage:(NSInteger)page{
    //判断数组里面有没有
    NSRange range;
    if (page > self.pageRangesArray.count-1){
        //需要计算下一页的内容
        range = [self calculatePageRange:page];
        if (self.animated){
            [self animateWithType:kAnimationTypeUp];
        }
    } else{
        //数组里面已经计算过了 不需要计算 直接拿出来使用
        range = [[self.pageRangesArray objectAtIndex:page] rangeValue];
        if (self.animated){
            [self animateWithType:kAnimationTypeDown];
        }
    }
    
    self.currentPage = page;
    
    
    self.label.text = [self.text substringWithRange:range];
}

- (void)animateWithType:(kAnimationType)type{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    if (type == kAnimationTypeUp){
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self cache:NO];
    } else{
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self cache:NO];
    }
    [UIView commitAnimations];
}

@end






















