//
//  ViewController.m
//  QQ聊天界面输入
//
//  Created by 张俊 on 2018/8/17.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "Face.h"

#define kWHlenght 40

@interface ViewController ()<UITextViewDelegate, UIResponderStandardEditActions>
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
@property (weak, nonatomic) IBOutlet UIButton *emotionUpButton;
@property (weak, nonatomic) IBOutlet UIScrollView *expressionScrollView;
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
/** 触摸点的坐标  */
@property (nonatomic,assign)CGPoint location;
/** 存储表情的数组  */
@property (nonatomic,strong) NSArray * expressionArray;
/** 长按事假和滑动选中的按钮  */
@property (nonatomic,strong) NSMutableArray * selectedArray;

@end

@implementation ViewController
#pragma mark ------ 懒加载数据 ------
-(NSArray *)expressionArray{
    if (_expressionArray == nil) {
        _expressionArray =  [Face mj_objectArrayWithFilename:@"face.plist"];
    }
    return _expressionArray;
    
    
}
#pragma mark ------ 主体 ------
- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化
    self.selectedArray  = [NSMutableArray array];
    
//    设置表情弹出来按钮的样式和事件
    [self.emotionUpButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_smile_nor"] forState:UIControlStateNormal];
    [self.emotionUpButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_smile_press"] forState:UIControlStateHighlighted];
    [self.emotionUpButton addTarget:self action:@selector(hideKeyboardAndUpEmotion) forControlEvents:UIControlEventTouchUpInside];
    
//    设置音频输入
    [self.voiceButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_voice_nor"] forState:UIControlStateNormal];
    [self.voiceButton setBackgroundImage:[UIImage imageNamed:@"chat_bottom_voice_press"] forState:UIControlStateHighlighted];
    
//    设置输入框
    self.inputTextView.layer.borderWidth = 1;
    self.inputTextView.layer.borderColor = [UIColor blackColor].CGColor;
    

//    布局表情
    [self initExpression];
//    设置代理
    self.inputTextView.delegate = self;
    
}

#pragma mark ------ 布局表情界面 ------
-(void)initExpression{
//    设置scrollview的分页和背景
    self.expressionScrollView.backgroundColor = [UIColor grayColor];
    self.expressionScrollView.pagingEnabled = YES;
//    首先计算页数
    NSInteger pageCount = self.expressionArray.count/28+1;
    
//                    给scrollview添加长按手势
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    [self.expressionScrollView addGestureRecognizer:longPressGesture];
    
    self.expressionScrollView.contentSize = CGSizeMake(pageCount*_expressionScrollView.frame.size.width, _expressionScrollView.frame.size.height);
    
    Face * emotion = self.expressionArray[0];
//    循环加入布局按钮
    for (int t = 0; t < pageCount; t++) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 7; j++) {
                if ((i*7+j+1 + 27*t)<self.expressionArray.count) {
                    emotion = self.expressionArray[i*7+j + 27*t];
                    UIButton * emotionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    emotionBtn.frame = CGRectMake(52*j+10 + _expressionScrollView.frame.size.width*t,10 + 60*i,kWHlenght,kWHlenght);
                    [emotionBtn setBackgroundImage:[UIImage imageNamed:emotion.png] forState:UIControlStateNormal];
//                    添加tag值
                    emotionBtn.tag = i*7+j+1 + 27*t;
                    emotionBtn.backgroundColor = [UIColor orangeColor];
//                    添加点击输入的手势
                    [emotionBtn addTarget:self action:@selector(addEmotionToTextFieldView:) forControlEvents:UIControlEventTouchUpInside];

                    //                最后一个放删除号
                    if ((i*j)!=18) {
                        [self.expressionScrollView addSubview:emotionBtn];
                    }else{
                        [self addDeleteButton:CGRectMake(52*j+10 + _expressionScrollView.frame.size.width*t,10 + 60*i, 40, 40)];
                    }
                }
            }
        }
    }
    [self addDeleteButton:CGRectMake(52*3+10 + _expressionScrollView.frame.size.width*3,10 +60*2,40,40)];
}
//添加每一页最后的删除按钮
-(void)addDeleteButton:(CGRect)frame{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:@"compose_emotion_delete"] forState:UIControlStateNormal];
    [self.expressionScrollView addSubview:btn];
//    为删除按钮添加事件，点击的时候像系统一样子能够直接调用
    [btn addTarget:self.inputTextView action:@selector(deleteBackward) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark ------ 处理键盘隐藏  表情出来 ------
-(void)hideKeyboardAndUpEmotion{
    [self.inputTextView resignFirstResponder];
//    表情栏上移
    [self changeScrollViewPosition];
}

#pragma mark ------ 触摸事件 ------
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.inputTextView resignFirstResponder];
    [self transformIdentify];
}

#pragma mark ------ 表情按钮的点击添加和长按事件 ------
/*************************表情按钮点击事件将表情添加上去**************************/
-(void)addEmotionToTextFieldView:(UIButton*)button{
//    确定原来的光标位置
    NSRange range = self.inputTextView.selectedRange;
    NSTextAttachment * emojiTextAttchment = [NSTextAttachment new];
    emojiTextAttchment.image = button.currentBackgroundImage;
    NSAttributedString * emoji =  [NSAttributedString attributedStringWithAttachment:emojiTextAttchment];
    [self.inputTextView.textStorage insertAttributedString:emoji atIndex:self.inputTextView.selectedRange.location];
//    光标后移
    range.location = range.location + emoji.length;
    self.inputTextView.selectedRange = NSMakeRange(range.location, 0);
    
//    改变文字的大小,使得文字的大小还是原来的那么大
    self.inputTextView.font = [UIFont systemFontOfSize:20];
    
}

//  长按手势 添加放大镜
-(void)longPressGesture:(UILongPressGestureRecognizer*)gesture{
//    UIScrollView * tempScrollview = (UIScrollView*)gesture.view;
//    去的触摸点的坐标
    CGPoint location = [gesture locationInView:self.expressionScrollView];
    NSInteger tempTag = [self calcultateTag:location];
     UIButton * tempBtn = [self.expressionScrollView viewWithTag:tempTag];
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (CGRectContainsPoint(tempBtn.frame, location)) {
            [self addButtonImagePoint:location];
        }
    }else if (gesture.state == UIGestureRecognizerStateChanged){
        location = [gesture locationInView:self.expressionScrollView];
            if (CGRectContainsPoint(tempBtn.frame, location)) {
//                将之前放大镜图imagVIew的隐藏起来
                [self hideSelectedButton];
                [self addButtonImagePoint:location];
            }
        [self addButtonImagePoint:location];
    }else if (gesture.state == UIGestureRecognizerStateEnded){
//      遍历选中表情的的数组，进行查处
        for (UIImageView * imageView  in self.selectedArray) {
            if (imageView != [self.selectedArray lastObject]) {
                [imageView removeFromSuperview];
            }else{
                UIButton * btn = [self.expressionScrollView viewWithTag:imageView.tag];
//                找到最后停止的按钮，然后添加上去
                [self addEmotionToTextFieldView:btn];
                [imageView removeFromSuperview];
            }
        }
        
    }
//    [imageView removeFromSuperview];
}
-(void)addButtonImagePoint:(CGPoint)location{
//    首先计算tag值，找出来那个按钮
   NSInteger tempTag = [self calcultateTag:location];
    UIButton* tempBtn = [self.expressionScrollView viewWithTag:tempTag];
//    添加按钮
    UIImageView * imageView = [[UIImageView alloc]initWithImage:tempBtn.currentBackgroundImage];
    imageView.frame = CGRectMake(0, 0, 70, 70);
    imageView.center = tempBtn.center;
    imageView.tag = tempTag;
    if (CGRectContainsPoint(tempBtn.frame, location)) {
        [self.expressionScrollView addSubview:imageView];
        //    将按钮添加到数组里里面
        [self.selectedArray addObject:imageView];
    }
}
-(void)hideSelectedButton{
//    将不是最后一个的视图全部隐藏起来的
    for (UIImageView * img in self.selectedArray) {
        if (img != [_selectedArray lastObject]) {
            img.hidden = YES;
        }
    }
}
//计算tag值，找到对应的按钮
-(NSInteger)calcultateTag:(CGPoint)location{
    NSInteger pageCount = location.x /self.expressionScrollView.frame.size.width;
    NSInteger rowCount = (location.y-10)/60;
    NSInteger lineCount = (location.x -pageCount*self.expressionScrollView.frame.size.width)/52+1;
    NSInteger tempTag = 27*pageCount + rowCount*7+lineCount;
    return tempTag;
    //        NSLog(@"%ld %ld %ld -----%ld",pageCount,rowCount,lineCount,tempTag);
}

#pragma mark ------ 实现代理方法 ------
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    [self changeScrollViewPosition];
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
//    恢复原样
    [self transformIdentify];
    [self.inputTextView resignFirstResponder];
}
#pragma mark ------ 键盘收缩和展示 ------
-(void)changeScrollViewPosition{
    [UIView animateWithDuration:0.1 animations:^{
        self.containView.transform = CGAffineTransformMakeTranslation(0, -258);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.expressionScrollView.transform = CGAffineTransformMakeTranslation(0, -258);
        }];
    }];
}
//将移动的位置恢复原状
-(void)transformIdentify{
    [UIView animateWithDuration:0.20 animations:^{
        self.expressionScrollView.transform = CGAffineTransformIdentity;
        self.containView.transform = CGAffineTransformIdentity;
    }];
}


@end













