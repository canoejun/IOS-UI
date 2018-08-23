//
//  OperationView.m
//  网易分类
//
//  Created by PengXiaodong on 2018/8/13.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "OperationView.h"
#import "ColumItem.h"
#import "Constants.h"

#define kPadding ((self.frame.size.width-20-80*4)/3)

@interface OperationView ()
@property (nonatomic, strong) NSMutableArray *itemViewsArray;
@property (nonatomic, assign) BOOL isEditing;

@end

@implementation OperationView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil){
        //监听状态变化的消息
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusChanged:) name:kEditStatusNotificationName object:nil];
    }
    return self;
}

//状态切换的消息事件
- (void)statusChanged:(NSNotification *)notifi{
    //解析消息的内容
    self.isEditing = [notifi.object boolValue];
}

//重写set方法
- (void)setItemNamesArray:(NSMutableArray *)itemNamesArray{
    _itemNamesArray = itemNamesArray;
    
    for (ColumItem * item in self.subviews) {
        [item removeFromSuperview];
    }
    
    //创建所有的栏目视图
    self.itemViewsArray = [NSMutableArray array];
    for (NSString *itemName in _itemNamesArray){
        ColumItem *item = [[ColumItem alloc] initWithFrame:CGRectZero];
        item.itemName = itemName;
        item.type = self.type;
        item.isEditing = _isEditing;
        [self addSubview:item];
        
        //将每一个栏目视图添加到数组里面
        [self.itemViewsArray addObject:item];
    }
    //布局子视图
    [self layoutIfNeeded];
}

- (void)layoutSubviews{
    for (int i = 0; i < _itemViewsArray.count; i++) {
        //第几行  第几列
        int row = i / 4;
        int colum = i % 4;
        
        //取出对象
        ColumItem *item = [_itemViewsArray objectAtIndex:i];
        
        item.frame = CGRectMake(10 + (80 + kPadding)*colum, 10+ (35 + 20)*row, 80, 35);
    }
}
@end










