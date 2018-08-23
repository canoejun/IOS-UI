//
//  OperaionView.m
//  QQ表情键盘输入分层次
//
//  Created by 张俊 on 2018/8/18.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "OperaionView.h"
#import "FaceView.h"

typedef enum{
    kKeyBoardTypeKeyBoard, //正常键盘
    kKeyBoardTypeFace//表情键盘
} kKeyBoardType;


@interface OperaionView ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
/** 将scrollview作为operation的一个属性添加上去,表情键盘  */
@property (nonatomic,strong) FaceView * face;
@property (nonatomic, assign) BOOL shouldMove;

@end

@implementation OperaionView
//懒加载创建
-(FaceView *)face{
    self.face = [FaceView faceWithframe:CGRectMake(0, 0, self.frame.size.width, [UIScreen mainScreen].bounds.size.height-self.frame.origin.y-60) andContainer:nil];
    return _face;
}




+(OperaionView*)showOperationViewWithFrame:(CGRect)frame andContainView:(UIView*)container{
//    因为是xib创建，所以需要进行从文件中进行读取
    OperaionView * op = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
//    将参数添加进去
    op.frame = frame;
    [container addSubview:op];
    
    return op;
}

//在awake方法里面进行监听事件
-(void)awakeFromNib{
    [super awakeFromNib];
//    设置键盘的监听事件(这边设置的监听事件在键盘尺寸发生改变的时候就开始进行改变，不需要设置为当显示的时候在进行改变尺寸)
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeKeyboardFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
//    设置代理
    self.textView.delegate = self;
    self.shouldMove = YES;
    
    
}

-(void)changeKeyboardFrame:(NSNotification*)notif{
//    NSLog(@"%@",notif);
//    1.获取userinfo对应的字典高度
    NSDictionary * infoDic = notif.userInfo;
//    2.获取显示的时候字典高度
    CGRect endRect = [[infoDic objectForKey:@"UIKeyboardFrameEndUserInfoKey"]CGRectValue];
//    3.确定操作视图的位置
//    当能够移动的时候再进行移动
    if (self.shouldMove == YES) {
        [UIView animateWithDuration:0.25 animations:^{
            self.frame = CGRectMake(0, endRect.origin.y- self.frame.size.height, endRect.size.width,self.frame.size.height);
        }];
    }
}

//隐藏键盘，恢复原样子
-(void)hidekeyboard{
    self.shouldMove = YES;
    [self.textView resignFirstResponder];
}

#pragma mark ------ 表情按钮点击事件 ------
//切换键盘类型
- (IBAction)changeKeyBoardType:(UIButton *)sender {
//    将键盘隐藏
    [self.textView resignFirstResponder];
    if (sender.tag == kKeyBoardTypeKeyBoard) {
//        正常的键盘
//        切换为表情键盘
        sender.tag = kKeyBoardTypeFace;
        [sender setBackgroundImage:[[UIImage imageNamed:@"keyboard"]stretchableImageWithLeftCapWidth:34 topCapHeight:34] forState:UIControlStateNormal];
//        textView的键盘类型
        self.textView.inputView = self.face;
    }else{
//        表情键盘
//        切换为正常的键盘
        sender.tag = kKeyBoardTypeKeyBoard;
        [sender setBackgroundImage:[[UIImage imageNamed:@"chat_bottom_smile_nor"]stretchableImageWithLeftCapWidth:34 topCapHeight:34] forState:UIControlStateNormal];
        self.textView.inputView = nil;
    }
    
//    添加键盘转体效果
    [UIView animateWithDuration:0.25 animations:^{
        sender.layer.transform = CATransform3DRotate(sender.layer.transform, M_PI, 0, 1, 0);
    }];
    
//    使得键盘弹出来
    [self.textView performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.25];
    
}
#pragma mark ------ 代理方法 ------
-(void)textViewDidBeginEditing:(UITextView *)textView{
    self.shouldMove = NO;
}

@end









