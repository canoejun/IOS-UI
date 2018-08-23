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
    
    
//    抖动动画
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotate.z"];
//    animation.fromValue = [NSNumber numberWithFloat:-0.1];
//    animation.toValue = [NSNumber numberWithFloat:0.1];
//    animation.duration = 0.1;
//    animation.repeatCount = 10;
//    animation.autoreverses = YES;
//    [self.view.layer addAnimation:animation forKey:@""];
    
    
    
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
/*
-(void)loadModuleDataPath:(NSString*)file dataArray:(NSMutableArray*)array{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * path = [docPath stringByAppendingPathComponent:file];
    NSArray * tempArray = [NSArray arrayWithContentsOfFile:path];
//    这一步是为了删除原来的内容
    [array removeAllObjects];
    for (NSString * string in tempArray) {
        [array addObject:string];
    }
}
 */

#pragma mark ------ 布局视图 ------

-(void)setUpModule{
//    布局关注的
    [self layOutZJModuleView:self.attentionView dataArray:self.attentionDataArray index:0];
//    布局未关注的
    [self layOutZJModuleView:self.unattentionView dataArray:self.unattentionDataArray index:0];
    
}

//重写循环布局的方法，后面会不断调用
-(void)layOutZJModuleView:(UIView*)view dataArray:(NSMutableArray *)array index:(NSInteger)index{
    CGFloat width = 80;
    CGFloat height = 35;
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
        //        将plist文件写入到应用程序中去         路径
//  /Users/jun/Library/Developer/CoreSimulator/Devices/EAEC502C-E0B1-4DEB-ABF0-CBAA326BCD55/data/Containers/Data/Application/8F455C2D-4CF6-449F-BD3B-46353E157947/Documents
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        
        NSString *attentionFilePath = [docPath stringByAppendingPathComponent:@"attention.plist"];
        NSString * unattentionFilePath = [docPath stringByAppendingPathComponent:@"unattention.plist"];
//        写入包内的文件
        [self.attentionDataArray writeToFile:attentionFilePath atomically:YES];
        [self.attentionDataArray writeToFile:unattentionFilePath atomically:YES];
        /*    麻烦的方式
         //        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
         //        [self.attentionDataArray writeToFile:filePath atomically:YES];
         */
    }
    
}

#pragma mark ------ 删除的动画效果 ------
-(void)againLayoutModuleView:(UIView*)view addArray:(NSMutableArray *)addArray deleteArray:(NSMutableArray*)deleteArrray zjSuperView:(ZJModuleView*)zjSuperView{
    zjSuperView.hidden = YES;
    [UIView animateWithDuration:0.7 animations:^{
        NSInteger index = [deleteArrray indexOfObject:zjSuperView.titleLabel.text];
        CGPoint tempPoint2 = CGPointMake(0, 0);
        CGPoint tempPoint1 = view.subviews[index].center;
        //            删除注意模块    if毁一生。。。。。。。。。。
//        if (index < deleteArrray.count-1) {
            for (; index < deleteArrray.count-1; index++) {
                tempPoint2 = view.subviews[index+1].center ;
                view.subviews[index+1].center = tempPoint1;
                tempPoint1 = tempPoint2;
            }
            [zjSuperView removeFromSuperview];
            [deleteArrray removeObject:zjSuperView.titleLabel.text];
            [addArray addObject:zjSuperView.titleLabel.text];
//        }
    }];
}

//删除已经关注的
-(void)moveTrashModule:(UIButton*)sender{
    if ([self.editingButton.titleLabel.text isEqualToString:@"完成"]) {
        ZJModuleView * zjSuperView = (ZJModuleView *)sender.superview;
        
        [self againLayoutModuleView:self.attentionView addArray:_unattentionDataArray deleteArray:_attentionDataArray zjSuperView:zjSuperView];
        [self layOutZJModuleView:_unattentionView dataArray:_unattentionDataArray index:_unattentionDataArray.count-1];
        [self test];
    }
}

//添加未关注的
-(void)addModule:(ZJModuleView*)sender{
    if ([self.editingButton.titleLabel.text isEqualToString:@"完成"]){
        if ([sender deleteButton].hidden == YES) {
            [self againLayoutModuleView:_unattentionView addArray:_attentionDataArray deleteArray:_unattentionDataArray zjSuperView:sender];
            [self layOutZJModuleView:_attentionView dataArray:_attentionDataArray index:_attentionDataArray.count-1];
            [self test];
        }
    }
}

//重新调整每个界面的button显示
-(void)test{
    for (ZJModuleView * tempVIew in _attentionView.subviews) {
        [tempVIew deleteButton].hidden = NO;
        tempVIew.hidden = NO;
    }
    for (ZJModuleView * tempVIew in _unattentionView.subviews) {
        [tempVIew deleteButton].hidden = YES;
        tempVIew.hidden = NO;
    }
}

@end








