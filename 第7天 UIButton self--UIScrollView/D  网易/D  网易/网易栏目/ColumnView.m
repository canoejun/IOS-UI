//
//  ColumnView.m
//  网易分类
//
//  Created by PengXiaodong on 2018/8/13.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ColumnView.h"
#import "AppDelegate.h"
#import "OperationView.h"
#import "ColumItem.h"

//下拉的整体宽单例对象
static ColumnView *instance = nil;
@interface ColumnView ()
//管理已经选择的栏目视图
@property (nonatomic, strong) OperationView *selectedOperationView;
//管理没有选择的栏目视图
@property (nonatomic, strong) OperationView *moreOperationView;
//保存栏目数据
@property (nonatomic, strong) NSMutableArray *selectedArray;
@property (nonatomic, strong) NSMutableArray *moreArray;
@end

@implementation ColumnView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.backgroundColor = [UIColor grayColor];
        
        //创建已经显示的栏目视图
        self.selectedOperationView = [[OperationView alloc] initWithFrame:CGRectZero];
        _selectedOperationView.backgroundColor = [UIColor whiteColor];
        _selectedOperationView.type = kOperationTypeSelected;
        [self addSubview:_selectedOperationView];
        
        //创建还没有添加的栏目视图
        self.moreOperationView = [[OperationView alloc] initWithFrame:CGRectZero];
        _moreOperationView.backgroundColor = [UIColor whiteColor];
        _moreOperationView.type = kOperationTypeMore;
        [self addSubview:_moreOperationView];
        
        self.backgroundColor = [UIColor greenColor];
        
        //加载数据
        [self loadData];
    }
    return self;
}

- (void)loadData{
    self.selectedArray = [NSMutableArray arrayWithArray:@[@"体育", @"房产", @"NBA", @"娱乐", @"科技", @"游戏", @"军事", @"直播", @"音乐"]];
    self.moreArray = [NSMutableArray arrayWithArray:@[@"历史", @"影视", @"时尚", @"财经", @"数码", @"汽车"]];
    
    self.selectedOperationView.itemNamesArray = self.selectedArray;
    self.moreOperationView.itemNamesArray = self.moreArray;
    
    //对子视图进行布局
    [self layoutIfNeeded];
}

//在布局的时候进行是视图大小的设置
- (void)layoutSubviews{
    //对子视图重新布局 frame
    //计算选择的栏目视图的frame -> height
    unsigned long row1 = (_selectedArray.count-1) / 4 + 1;
    self.selectedOperationView.frame = CGRectMake(0, 0, self.frame.size.width, row1 * 55 + 10);
    
    unsigned long row2 = (_moreArray.count-1) / 4 + 1;
    self.moreOperationView.frame = CGRectMake(0, _selectedOperationView.frame.origin.y + _selectedOperationView.frame.size.height + 30, self.frame.size.width, row2 * 55 + 10);
}

//提供一个类方法 显示视图
+ (void)showColumViewWithFrame:(CGRect)frame{
    //创建这个对象
    instance = [[ColumnView alloc] initWithFrame:frame];
    instance.frame = CGRectMake(0, frame.origin.y, frame.size.width, 1);
    
    //1.找到应用程序的代理
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //2.得到window对应的试图控制器的view
    [appDelegate.window.rootViewController.view addSubview:instance];
    
    //动画出现
    [UIView animateWithDuration:0.7 animations:^{
        instance.frame = frame;
    }];
}

//提供一个类方法 隐藏视图
+ (void)dismissColumView{
    [UIView animateWithDuration:0.7 animations:^{
        instance.frame = CGRectMake(0, instance.frame.origin.y, instance.frame.size.width, 1);;
    } completion:^(BOOL finished) {
        [instance removeFromSuperview];
    }];
}

//item上删除按钮被点击
- (void)itemDeleteButtonDidClicked:(UIButton *)sender{
    ColumItem *columButton = (ColumItem *)sender.superview;
    
    //1.获取点击的item在数组里面的索引值index
    NSInteger index = [self.selectedArray indexOfObject:columButton.titleLabel.text];
    
    //2.删除more里面的index对象
    [self.selectedArray removeObjectAtIndex:index];
    
    //3.在selected里面添加这个对象
    [self.moreArray addObject:columButton.titleLabel.text];
    
    //4.将这个item移动到上方
    self.selectedOperationView.itemNamesArray = self.selectedArray;
    self.moreOperationView.itemNamesArray = self.moreArray;
    

    if (_selectedArray.count != 0) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

//item按钮被点击
- (void)itemButtonDidClicked:(ColumItem *)sender{
    if (sender.type == kOperationTypeMore){
        //需要添加栏目
        //1.获取点击的item在数组里面的索引值index
        NSInteger index = [self.moreArray indexOfObject:sender.titleLabel.text];
        
        //2.删除more里面的index对象
        [self.moreArray removeObjectAtIndex:index];
        
        //3.在selected里面添加这个对象
        [self.selectedArray addObject:sender.titleLabel.text];
        
        //4.将这个item移动到上方
        self.selectedOperationView.itemNamesArray = self.selectedArray;
        self.moreOperationView.itemNamesArray = self.moreArray;
        
//
        if (_moreArray.count != 0) {
            [self setNeedsLayout];
            [self layoutIfNeeded];
        }
    }
}
@end













