//
//  MainViewController.m
//  ebook2
//
//  Created by 张俊 on 2018/8/6.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "MainViewController.h"
#import "EbookView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.title =@"电子书";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    创建一个ebook 管理相关的界面
    EbookView * ebook = [[EbookView alloc]initWithFrame:CGRectMake(0, 20+44, self.view.bounds.size.width, self.view.bounds.size.height-64)];
//    设置属性
    ebook.text = [self loaddata];
    ebook.fontsize = [UIFont systemFontOfSize:17];
    
    [self.view addSubview:ebook];
}

-(NSString *)loaddata{
    return [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"青山磊落险峰行" ofType:@".txt"] encoding:NSUTF8StringEncoding error:nil];
}





@end















