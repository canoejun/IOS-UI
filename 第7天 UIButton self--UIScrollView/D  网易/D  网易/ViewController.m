//
//  ViewController.m
//  网易分类
//
//  Created by PengXiaodong on 2018/8/13.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ViewController.h"
#import "ColumnView.h"
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    //创建下拉按钮
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(self.view.frame.size.width - 60, 70, 40, 40);
    [listBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [listBtn addTarget:self action:@selector(listButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:listBtn];
    
    //添加编辑按钮
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    editBtn.frame = CGRectMake(listBtn.frame.origin.x - 50, 70, 50, 40);
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(editButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:editBtn];
}
- (void)listButtonDidClicked:(UIButton *)sender{
    //判断按钮目前的状态 0 隐藏  1 显示
    if(sender.tag == 0){
        sender.tag = 1;
        //显示
        [UIView animateWithDuration:0.5 animations:^{
            sender.transform = CGAffineTransformRotate(sender.transform, 179.999/180.0 * M_PI);
        }];
        
        [ColumnView showColumViewWithFrame:CGRectMake(0, 110, self.view.frame.size.width, self.view.frame.size.height-110)];
    } else{
        sender.tag = 0;
        //隐藏
        [UIView animateWithDuration:0.5 animations:^{
            sender.transform = CGAffineTransformRotate(sender.transform, -179.999/180.0 * M_PI);
        }];
        [ColumnView dismissColumView];
    }
}

- (void)editButtonDidClicked:(UIButton *)sender{
    //切换标题
    BOOL isEditing ;
    if ([sender.titleLabel.text isEqualToString:@"编辑"]){
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        //编辑状态
        isEditing = YES;
    } else{
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
        //正常状态
        isEditing = NO;
    }
    //发送消息
    [[NSNotificationCenter defaultCenter] postNotificationName:kEditStatusNotificationName object:@(isEditing)];
}


@end

























