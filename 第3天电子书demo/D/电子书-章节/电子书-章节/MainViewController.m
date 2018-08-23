//
//  MainViewController.m
//  电子书-章节
//
//  Created by PengXiaodong on 2018/8/5.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
//用于显示每一页的内容
@property (nonatomic, strong) UILabel *textLabel;
//保存小说的具体内容
@property (nonatomic, strong) NSString *contentStr;
//保存每一页的范围NSRange
@property (nonatomic, strong) NSMutableArray *pageRangesArray;
//记录当前这一页的索引值
@property (nonatomic, assign) NSInteger currentPage;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.设置标题
    self.title = @"第一章";
    
    //2.创建Label
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20+44, self.view.frame.size.width, self.view.frame.size.height-20-44)];
    _textLabel.font = [UIFont systemFontOfSize:18];
    _textLabel.numberOfLines = 0;
    [self.view addSubview:_textLabel];
    
    //3.数据处理
    //3.1获取文件的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"登山拜师" ofType:@".txt"];
    
    //3.2读取文件的内容
    self.contentStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //3.3对数据进行解析
    //初始化数组
    self.pageRangesArray = [NSMutableArray array];
    
    //定义一个NSRange结构体用于随时记录每一页的具体位置和长度
    NSRange range = NSMakeRange(0, 0);
    for (int i = 0; i < _contentStr.length; i++){
        //1.增加一个字符 （起始点，长度）NSRange（location length）
        range.length ++;
        
        //2获取新的range对应的字符串
        NSString *rangeStr = [self.contentStr substringWithRange:range];
        
        //3.计算当前这些字符的宽高
        CGSize realSize = [rangeStr boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size;
        
        //4.计算高度是否超出label的显示高度
        if (realSize.height > self.textLabel.frame.size.height){
            //当前这一页的返回确定了 添加到数组里面 保存这一页的范围
            //将下一页的第一个文字 排除
            range.length --;
            
            //将NSRange转化为OC对象类型
            NSValue *rgValue = [NSValue valueWithRange:range];
            
            [self.pageRangesArray addObject:rgValue];
            
            //为下一页的计算做准备工作
            range.location = range.location + range.length;
            range.length = 0;
        }
    }
    
    //判断最后一页是否有内容
    if (range.length !=  0){
        //最后一页还有内容
        //将NSRange转化为OC对象类型
        NSValue *rgValue = [NSValue valueWithRange:range];
        
        [self.pageRangesArray addObject:rgValue];
    }
    
    //显示第一页
    //取出这一页对应的range
    NSValue *rgValue = [self.pageRangesArray objectAtIndex:0];
    NSRange firstPageRange = [rgValue rangeValue];
    
    self.textLabel.text = [self.contentStr substringWithRange:firstPageRange];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸点的坐标位置
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self.view];
    
    //判断是下一页还是上一页
    if (location.x > self.view.center.x){
        //下一页
        self.currentPage++;
        
        //判断时候已经是最后一页
        if (self.currentPage == self.pageRangesArray.count){
            _currentPage--;
        }
    } else{
        //上一页
        self.currentPage--;
        
        //判断是不是超出第一页了
        if (self.currentPage < 0){
            _currentPage = 0;
        }
    }
    
    //获取currentPage对应的内容
    //取出这一页对应的range
    NSValue *rgValue = [self.pageRangesArray objectAtIndex:_currentPage];
    NSRange range = [rgValue rangeValue];
    
    self.textLabel.text = [self.contentStr substringWithRange:range];
}
@end


















