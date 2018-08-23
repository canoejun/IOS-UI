//
//  ViewController.m
//  网易新闻选择小模块
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "ZJModuleView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *attentionView;
@property (weak, nonatomic) IBOutlet UIView *unattentionView;
@property (weak, nonatomic) IBOutlet UIButton *editingButton;
/** 保存关注的数据的数组  */
@property (nonatomic,strong) NSMutableArray * attentionDataArray;
/** 保存没有关注的数据数组  */
@property (nonatomic,strong) NSMutableArray * unattentionDataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    布局显示的界面
    [self setUpModule];
}

#pragma mark ------ 懒加载数据 ------

-(NSMutableArray *)attentionDataArray{
    if (_attentionDataArray == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"attention.plist" ofType:nil];
        NSArray * tempArray = [NSArray arrayWithContentsOfFile:path];
        //    在调用之前去懒加载
        self.attentionDataArray = [NSMutableArray array];
        for (NSString * string in tempArray) {
            [_attentionDataArray addObject:string];
        }
    }
    
    return _attentionDataArray;
}

-(NSMutableArray *)unattentionDataArray{
    if (_unattentionDataArray == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"unattention.plist" ofType:nil];
        NSArray * tempArray = [NSArray arrayWithContentsOfFile:path];
        //    在调用之前去懒加载
        self.unattentionDataArray = [NSMutableArray array];
        for (NSString * string in tempArray) {
            [_unattentionDataArray addObject:string];
        }
    }
    return _unattentionDataArray;
}

#pragma mark ------ 布局视图 ------

-(void)setUpModule{
    /*************************布局**************************/

//    布局关注的
    [self layOutZJModuleView:self.attentionView dataArray:self.attentionDataArray index:0];
//    布局未关注的
    [self layOutZJModuleView:self.unattentionView dataArray:self.unattentionDataArray index:0];
    
}

//重写循环布局的方法，后面会不断调用
-(void)layOutZJModuleView:(UIView*)view dataArray:(NSMutableArray *)array index:(NSInteger)index{
    CGFloat width = 78;
    CGFloat height = 34;
    NSInteger allCols = 4;
    CGFloat widthMargin = (view.frame.size.width-allCols * width)/(allCols+1);
    CGFloat heightMargin = 20;
    for (; index < array.count; index++) {
        CGFloat x = (width + widthMargin)*(index%allCols)+15;
        CGFloat y = (height + heightMargin)*(index/allCols)+3;
        ZJModuleView * moduleView = [ZJModuleView moduleWithString:array[index]];
//        添加监视
        [moduleView addTarget:self action:@selector(addModule:) forControlEvents:UIControlEventTouchUpInside];
        [[moduleView deleteButton] addTarget:self action:@selector(moveTrashModule:) forControlEvents:UIControlEventTouchUpInside];
        
        moduleView.frame = CGRectMake(x, y, width, height);
        [view addSubview:moduleView];
    }
}

#pragma mark ------ 处理点击按钮的事件 ------

- (IBAction)editingViews:(UIButton *)sender {
    
    if ([self.editingButton.titleLabel.text isEqualToString:@"编辑"]) {
        [self.editingButton setTitle:@"完成" forState:UIControlStateNormal];
//        移除的
        for (ZJModuleView * tempView in _attentionView.subviews) {
            [tempView deleteButton].hidden = NO;
        }
    }else{
        [self.editingButton setTitle:@"编辑" forState:UIControlStateNormal];
        for (ZJModuleView * tempView in _attentionView.subviews) {
            [tempView deleteButton].hidden = YES;
        }
//        将plist文件写入到应用程序中去
        
//        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//
//        NSString *filePath = [docPath stringByAppendingPathComponent:@"attention.plist"];
//        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
//        [self.attentionDataArray writeToFile:filePath atomically:YES];
    }
    
}

-(void)moveTrashModule:(UIButton*)sender{
    if ([self.editingButton.titleLabel.text isEqualToString:@"完成"]) {
        ZJModuleView * zjSuperView = sender.superview;
        
        NSInteger index = [_attentionDataArray indexOfObject:zjSuperView.titleLabel.text];
        
        [self.unattentionDataArray addObject:zjSuperView.titleLabel.text];
        [self.attentionDataArray removeObject:zjSuperView.titleLabel.text];
        for (; index < _attentionView.subviews.count; ) {
            [_attentionView.subviews[index] removeFromSuperview];
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            //        [self setUpModule];
            //    布局关注的
            [self layOutZJModuleView:self.attentionView dataArray:self.attentionDataArray index:index];
            //    布局未关注的
            [self layOutZJModuleView:self.unattentionView dataArray:self.unattentionDataArray index:_unattentionDataArray.count-1];
            for (ZJModuleView * tempView in _attentionView.subviews) {
                [tempView deleteButton].hidden = NO;
            }
        }];
    }
}
-(void)addModule:(ZJModuleView*)sender{
    if ([self.editingButton.titleLabel.text isEqualToString:@"完成"]){
        NSInteger index = [_unattentionDataArray indexOfObject:sender.titleLabel.text];
        
        [self.attentionDataArray addObject:sender.titleLabel.text];
        [self.unattentionDataArray removeObject:sender.titleLabel.text];
        for (; index < _unattentionView.subviews.count; ) {
            [_unattentionView.subviews[index] removeFromSuperview];
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            //        [self setUpModule];
            //    布局关注的
            [self layOutZJModuleView:self.unattentionView dataArray:self.unattentionDataArray index:index];
            //    布局未关注的
            [self layOutZJModuleView:self.attentionView dataArray:self.attentionDataArray index:_unattentionDataArray.count-1];
            for (ZJModuleView * tempView in _attentionView.subviews) {
                [tempView deleteButton].hidden = NO;
            }
        }];
    }
}

@end








