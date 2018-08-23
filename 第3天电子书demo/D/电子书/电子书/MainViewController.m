//
//  MainViewController.m
//  电子书
//
//  Created by PengXiaodong on 2018/8/5.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "MainViewController.h"
#import "EBookView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

#pragma mark ------- initUI ---------
- (void)initUI{
    //设置标题
    self.title = @"电子书";
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建一个电子书
    EBookView *bookView = [[EBookView alloc] initWithFrame:CGRectMake(0, 20+44, self.view.bounds.size.width, self.view.bounds.size.height - 20-44)];
    bookView.text = [self loadData];
    bookView.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:bookView];
}

- (NSString *)loadData{
    //从文件读取数据
    //获取路径m
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"登山拜师.txt" ofType:nil];
    
    //读取文件的内容
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

@end







