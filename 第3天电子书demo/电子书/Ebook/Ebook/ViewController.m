//
//  ViewController.m
//  Ebook
//
//  Created by 张俊 on 2018/8/4.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

#define kWidth  (self.view.bounds.size.width-15)
#define kHeight (self.view.bounds.size.height-20-7)



@interface ViewController ()
@property (nonatomic,assign) CGFloat  fontSize;//字体的大小
@property (nonatomic,strong) NSMutableArray * eachPageLocationArray;//储存位置的数组
@property (nonatomic,assign) CGSize  realSize;//自适应后的总的宽度
@property (nonatomic,assign) int  wordCounts;//字数
@property (nonatomic,assign) int  PageCounts;//行数
@property (nonatomic,strong) UILabel * label;
@property (nonatomic,assign) float  eachWord;//每个字稍微调整
@property (nonatomic,strong) NSString * eachPageContent;
@property (nonatomic,strong)  NSString * content ;
@property (nonatomic,assign) int  eachPageWordCount;//每一页字数
@end

@implementation ViewController

- (void)viewDidLoad {
    
    
//    初始化属性
    self.eachPageLocationArray = [NSMutableArray arrayWithObjects:@0, nil];
    [super viewDidLoad];
    self.PageCounts = 0;
    self.fontSize = 17;
    self.eachWord = 3;
    self.eachPageContent = [NSString string];
    self.eachPageWordCount = (int)kWidth/(_fontSize+_eachWord) * (int)kHeight/(_fontSize+_eachWord);
    
    
//   读取文件信息 - 路径
//    沙盒机制  程序的沙盒里面
//    1.获取文件的路径                                 青山磊落险峰行    test
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"青山磊落险峰行" ofType:@".txt"];

//    2.读取文件的内容
    self.content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding  error:nil];
//    NSLog(@"%ld",_content.length);
    
    //    3.将每一页的最后行数记录下来
    [self recordEachPageLocation];
    
//      4.给第一页内容显示
    _eachPageContent = [_content substringWithRange:NSMakeRange(_eachPageWordCount * _PageCounts,_eachPageWordCount)];
    
    
//    5.布局label 初始化显示界面
    [self initLabelText];
}

#pragma mark ------ UILabel的相关处理 ------
//自适应的处理文本
-(void)dealWithLabelHeight{
    
    NSDictionary * contentFontDic = @{NSFontAttributeName:[UIFont systemFontOfSize:_fontSize]};
    self.realSize = [_content boundingRectWithSize:CGSizeMake(self.view.bounds.size.width-10, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:contentFontDic context:nil].size;
}
// 布局label 初始化显示界面
-(void)initLabelText{
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(7.5, 20, kWidth, kHeight)];
    _label.backgroundColor = [UIColor whiteColor];
    _label.text = _eachPageContent;
    _label.font = [UIFont systemFontOfSize:_fontSize];
    _label.numberOfLines = 0;
    
    [self.view addSubview:_label];
}
//记录每一页最后的位置
-(void)recordEachPageLocation{
    while (_wordCounts < _content.length) {
        _wordCounts = (int)kWidth/_fontSize * (int)kHeight/_fontSize + [[_eachPageLocationArray lastObject]intValue];
        [_eachPageLocationArray addObject:[NSNumber numberWithInt:_wordCounts]];
//        调试每一页的字数
//        NSLog(@"%@ %ld",[_eachPageLocationArray lastObject],_eachPageLocationArray.count);
    }
    _eachPageContent = [_content substringWithRange:NSMakeRange(0, _eachPageWordCount)];
}

#pragma mark ------ 触摸事件 ------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    6.获取触摸点
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGRect tempRect = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.bounds.size.height);
    
    //    判断左边需要翻页
    if (CGRectContainsPoint(tempRect, location)) {
//        是否是第一页的翻页
        if (_PageCounts != 0 ) {
            _PageCounts--;
            [UIView animateWithDuration:0.7 animations:^{
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.label cache:YES];
            }];
        }
        _eachPageContent = [_content substringWithRange:NSMakeRange(_eachPageWordCount * _PageCounts,_eachPageWordCount)];
        _label.text = _eachPageContent;
    }else{
        //        右边需要翻页
        [UIView animateWithDuration:0.7 animations:^{
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.label cache:YES];
        }];
        if (_PageCounts <= _eachPageLocationArray.count) {
            _PageCounts++;
            _eachPageContent = [_content substringWithRange:NSMakeRange(_eachPageWordCount * _PageCounts,_eachPageWordCount)];
            _label.text = _eachPageContent;
        }
    }
}






@end








