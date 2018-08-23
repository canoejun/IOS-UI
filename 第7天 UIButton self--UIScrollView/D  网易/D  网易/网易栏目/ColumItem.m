//
//  ColumItem.m
//  网易分类
//
//  Created by PengXiaodong on 2018/8/13.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ColumItem.h"

@interface ColumItem ()
@property (nonatomic, strong) UIButton *deleteBtn;
@end
@implementation ColumItem

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil){
        //设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"ring"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //添加删除按钮
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(-5, -5, 20, 20);
        [_deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        _deleteBtn.hidden = YES;
        [_deleteBtn addTarget:self.superview.superview action:@selector(itemDeleteButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteBtn];
        
        //给背景按钮加事件
        [self addTarget:self.superview.superview action:@selector(itemButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //监听状态改变的消息
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusChanged:) name:kEditStatusNotificationName object:nil];
    }
    return self;
}

- (void)setIsEditing:(BOOL)isEditing{
    _isEditing = isEditing;
    
    //判断当前这个item在那个栏目里面
    if (self.type == kOperationTypeSelected){
        _deleteBtn.hidden = !_isEditing;
    }
}

- (void)statusChanged:(NSNotification *)notifi{
    self.isEditing = [notifi.object boolValue];
}

- (void)setItemName:(NSString *)itemName{
    _itemName = itemName;
    
    [self setTitle:_itemName forState:UIControlStateNormal];
}
@end
















