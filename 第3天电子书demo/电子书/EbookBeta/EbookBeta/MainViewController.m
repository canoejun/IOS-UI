//
//  MainViewController.m
//  EbookBeta
//
//  Created by 张俊 on 2018/8/5.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "MainViewController.h"


#define kWidth self.view.frame.size.width

@interface MainViewController ()
@property (nonatomic,strong) UILabel * textLabel;//用于显示每一页的数据
@property (nonatomic,strong) NSString * content;//保存小说的具体内容
@property (nonatomic,strong) NSMutableArray * pageRangeArray;//记录每一页的最后一个数字
@property (nonatomic,assign) int  currentPage;//页数
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化数组
    self.pageRangeArray = [NSMutableArray arrayWithObject:[NSValue valueWithRange:NSMakeRange(0, 0)]];
    
//    1.设置标题
    self.title = @"青山磊落险峰行";
    
//    2.设置label
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20+44, self.view.bounds.size.width, self.view.bounds.size.height-20-44)];
    _textLabel.font = [UIFont systemFontOfSize:18];
    _textLabel.numberOfLines = 0;
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_textLabel];
    
//    3.读取数据
    //1.获取文件的路径             获取的沙盒机制
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"青山磊落险峰行" ofType:@".txt"];
    //2.读取文件的内容
    self.content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //3.对数据进行解析
    [self lazyLoad];
   
//    NSLog(@"%@",_pageRangeArray);
//    将第一页显示出来
    NSRange firstPageContent = NSMakeRange([[_pageRangeArray objectAtIndex:1]rangeValue].location-[[_pageRangeArray objectAtIndex:1]rangeValue].length, [[_pageRangeArray objectAtIndex:1]rangeValue].length);
    _textLabel.text = [_content substringWithRange:firstPageContent];
    
}

//    3.读取数据
-(void)lazyLoad{
    NSRange range = NSMakeRange([[_pageRangeArray lastObject]rangeValue].location, 0);
    for (int i = 0; i < _content.length; i++) {
        //1.增加一个字符（起始点长度）
        range.length++;
        //2.计算当前这些字符的高度
        NSString * rangeStr = [_content substringWithRange:range];
        //3.计算这些字符的宽高
        CGSize realSize = [rangeStr boundingRectWithSize:CGSizeMake(kWidth, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size;
        //4.计算出来的高度 判断是否超出label的高度
        if (realSize.height > self.textLabel.frame.size.height) {
            //当前这一页的返回确定了 添加到数组里面 保存这一页的范围
            //将下一页的第一个文字排除 那么这时候的i循环也需要减去这一次的字数
            range.length--;
//            i--;
            //将NSRange转化成OC对象类型
//            NSValue * rgValue = [NSValue valueWithRange:range];
//            [self.pageRangeArray addObject:rgValue];
            
            //为下一页做准备
             NSInteger location = range.location + range.length;
            [_pageRangeArray addObject:[NSValue valueWithRange:NSMakeRange(location, range.length)]];
            range.length = 0;
            break;
        }
    }
    if (range.length != 0) {
//        NSValue * rgValue = [NSValue valueWithRange:range];
//        [self.pageRangeArray addObject:rgValue];
        NSInteger location = range.location + range.length;
        [_pageRangeArray addObject:[NSValue valueWithRange:NSMakeRange(location, range.length)]];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    if (location.x>self.view.center.x) {
//        右边划过去
        self.currentPage ++;
        if (self.currentPage == _pageRangeArray.count) {
            _currentPage --;
            [self lazyLoad];
        }
    }else{
        self.currentPage--;
        if (self.currentPage < 0) {
            _currentPage = 0;
        }
    }
//    [UIView animateWithDuration:0.7 animations:^{
//        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:_textLabel cache:YES];
//    }];
 NSRange tempPageContent = NSMakeRange([[_pageRangeArray lastObject]rangeValue].location-[[_pageRangeArray lastObject]rangeValue].length, [[_pageRangeArray lastObject]rangeValue].length);
    
    _textLabel.text = [_content substringWithRange:tempPageContent];
    NSLog(@"%@",_pageRangeArray);
}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self lazyLoad];
//}



@end


















