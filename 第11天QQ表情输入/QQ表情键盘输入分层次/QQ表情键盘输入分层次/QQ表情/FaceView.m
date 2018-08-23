//
//  FaceView.m
//  QQ表情键盘输入分层次
//
//  Created by 张俊 on 2018/8/19.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "FaceView.h"
#import "MJExtension.h"
#import "FaceModel.h"

#define kWHlenght 35

@interface FaceView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 储存模型数据的数组  */
@property (nonatomic,copy) NSArray * dataArray;

@end

@implementation FaceView
//懒加载数据
-(NSArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSArray array];
        //    读取数据
        _dataArray = [FaceModel mj_objectArrayWithFilename:@"face.plist"];
    }
    return _dataArray;
}


+(FaceView*)faceWithframe:(CGRect)frame andContainer:(UIView*)containerView{
//    创建scrollview
    FaceView * face = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
    face.frame = frame;
    [containerView  addSubview:face];
    
    return face;
}

-(void)awakeFromNib{
    [super awakeFromNib];
//    布局
    [self initUI];
    
    NSLog(@"-------%@",self.dataArray);
    
}

-(void)initUI{
//    设置分页
    self.scrollView.pagingEnabled = YES;
//    布局
    self.pageControl.numberOfPages = self.dataArray.count / 27 + 1;
    self.scrollView.contentSize = CGSizeMake(self.pageControl.numberOfPages * _scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    FaceModel * emotion = self.dataArray[0];
    
    //    循环加入布局按钮
    for (int t = 0; t < self.pageControl.numberOfPages; t++) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 7; j++) {
                if ((i*7+j+1 + 27*t)<self.dataArray.count) {
                    emotion = self.dataArray[i*7+j + 27*t];
                    UIButton * emotionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    emotionBtn.frame = CGRectMake(52*j+10 + _scrollView.frame.size.width*t,10 + 60*i,kWHlenght,kWHlenght);
                    [emotionBtn setBackgroundImage:[UIImage imageNamed:emotion.png] forState:UIControlStateNormal];
                    //                    添加tag值
                    emotionBtn.tag = i*7+j+1 + 27*t;
                    emotionBtn.backgroundColor = [UIColor orangeColor];
                    //                    添加点击输入的手势
                    [emotionBtn addTarget:self action:@selector(addEmotionToTextFieldView:) forControlEvents:UIControlEventTouchUpInside];
                    
                    //                最后一个放删除号
                    if ((i*j)!=18) {
                        [self.scrollView addSubview:emotionBtn];
                    }else{
                        [self addDeleteButton:CGRectMake(52*j+10 + _scrollView.frame.size.width*t,10 + 60*i, kWHlenght, kWHlenght)];
                    }
                }
            }
        }
    }
    [self addDeleteButton:CGRectMake(52*3+10 + _scrollView.frame.size.width*3,10 +60*2,kWHlenght,kWHlenght)];
}
//添加每一页最后的删除按钮
-(void)addDeleteButton:(CGRect)frame{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_delete"] forState:UIControlStateNormal];
    [self.scrollView addSubview:btn];
}
@end







