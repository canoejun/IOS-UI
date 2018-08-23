//
//  EbookView.m
//  ebook2
//
//  Created by 张俊 on 2018/8/6.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "EbookView.h"

typedef enum{
    kAnimationTypeUp,
    kAnimationTypeDown
} kAnimationType;

@interface EbookView()
@property (nonatomic,strong) UILabel * label;
@property (nonatomic,strong) NSMutableArray * pageRangeArray;
@property (nonatomic,assign) NSInteger  pageNumbers;

@end

@implementation EbookView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _label.backgroundColor = [UIColor whiteColor];
        _label.numberOfLines = 0;
        _label.font = _fontsize;
        
        [self addSubview:_label];
        
        self.pageRangeArray = [NSMutableArray array];
        
    }
    return self;
    
}


-(void)setText:(NSString *)aText{
    _text = [aText copy];
    
    
    
//    显示第一页的内容
    NSRange firstRange = [self calutatePageRange:0];
    self.label.text = [_text substringWithRange:firstRange];
    
}
-(UIFont *)fontsize{
    if (_fontsize == nil) {
        _fontsize = [UIFont systemFontOfSize:17];
    }
    return _fontsize;
}

-(NSRange)calutatePageRange:(NSInteger)aPageCount{
    NSRange range = NSMakeRange(0, 0);
    if (aPageCount > 0) {
        NSValue *rgValue = [_pageRangeArray objectAtIndex:aPageCount-1];
        NSRange preRange = [rgValue rangeValue];
        
        //记录page也对应的起始位置
        range.location = preRange.location + preRange.length;
    }
    for (int i = 0; i < _text.length; i++) {
        //        改变length的值
        range.length++;
        
        NSString * substring = [_text substringWithRange:range];
        
        //        计算高度
        CGFloat realHeight = [substring boundingRectWithSize:CGSizeMake(_label.frame.size.width, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.fontsize} context:nil].size.height;
        
        //        首先加载两页的内容
        if (realHeight > _label.frame.size.height) {
            //让range保存这一页的长度
            range.length --;
            
            
            NSValue * rgValue = [NSValue valueWithRange:range];
            [_pageRangeArray addObject:rgValue];
            return range;
        }
    }
    //    判断最后一页
    if (range.length > 0) {
        NSValue * rgValue = [NSValue valueWithRange:range];
        [_pageRangeArray addObject:rgValue];
        return range;
    }else{
        return NSMakeRange(0, 0);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch =[touches anyObject];
    CGPoint location = [touch locationInView:self];
    NSRange currentRange = [[_pageRangeArray objectAtIndex:_pageNumbers]rangeValue];
    
//    下一页
    if (location.x > self.center.x) {
        if (currentRange.location+currentRange.length<_text.length) {
            _pageNumbers++;
            [self animateWithType:kAnimationTypeUp];
        }
    }else{
        if (_pageNumbers>0) {
             _pageNumbers--;
            [self animateWithType:kAnimationTypeDown];
        }
    }
    
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
    _label.text = [_text substringWithRange:[self calutatePageRange:_pageNumbers]];
}

@end
















