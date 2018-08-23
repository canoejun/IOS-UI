//
//  OperationView.m
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/18.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "OperationView.h"
#import "FaceView.h"

typedef enum{
    kKeyboardTypeKeyboard,//正常键盘  0
    kKeyboardTypeFace //表情键盘 1
}kKeyboardType;

@interface OperationView ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) FaceView *face;
@property (nonatomic, assign) BOOL shouldMove;
@end

@implementation OperationView

//重写faceView的get方法
- (FaceView *)face{
    if (_face == nil){
        self.face = [FaceView faceViewWithFrame:CGRectMake(0, 0, self.frame.size.width, [UIScreen mainScreen].bounds.size.height - self.frame.origin.y - 60) andContainer:nil selectBlock:^(UIImage *faceImage) {
            //表情按钮被点击了
            [self showImageToTextView:faceImage];
        } deleteBlock:^{
            //删除按钮被点击了
            if (self.textView.text.length > 0){
                //获取原来的内容
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
                
                //删除最后一个字符的内容
                [attr deleteCharactersInRange:NSMakeRange(attr.length-1, 1)];
                
                //显示
                self.textView.attributedText = attr;
            }
        }];
        _face.delegate = self;
    }
    return _face;
}

+ (OperationView *)showOperationViewWithFrame:(CGRect)frame andFather:(UIView *)containerView{
    OperationView *op = [[[NSBundle mainBundle] loadNibNamed:@"OperationView" owner:nil options:nil] firstObject];
    op.frame = frame;
    [containerView addSubview:op];
    
    return op;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    //设置TextView的inputView属性
    //可以通过inputView来设置自定义的键盘
    //当为nil的时候 弹出系统键盘
    //监听键盘弹出或者隐藏的消息
    //self.textView.inputView = self;
    [self keyboardNotifi];
    self.textView.delegate = self;
    
    self.shouldMove = YES;
}

- (void)keyboardNotifi{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardFrameChange:(NSNotification *)notifi{
    //获取键盘弹出之后的y坐标
    //UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
    //1. 获取userInfo 对应的字典
    NSDictionary *infoDic = notifi.userInfo;
    
    //2.获取键盘停止时的坐标
    CGRect endRect = [[infoDic objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    //3.改变操作视图的y坐标 0.25s
    if (_shouldMove == YES){
        [UIView animateWithDuration:0.25 animations:^{
            self.frame = CGRectMake(0, endRect.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }];
    }
}

- (void)hideKeyboard{
    self.shouldMove = YES;
    [self.textView resignFirstResponder];
}

- (IBAction)changeKeyBoardType:(UIButton *)sender {
    //隐藏当前的键盘
    [self.textView resignFirstResponder];
    
    //图片切换
    if (sender.tag == kKeyboardTypeKeyboard){
        //将按钮的图片改为键盘
        [sender setBackgroundImage:[[UIImage imageNamed:@"keyboard"]stretchableImageWithLeftCapWidth:34 topCapHeight:34] forState:UIControlStateNormal];
        
        //切换为表情键盘
        self.textView.inputView = self.face;
        
        sender.tag = kKeyboardTypeFace;
    } else{
        //将按钮图片改为笑脸图片
        [sender setBackgroundImage:[[UIImage imageNamed:@"chat_bottom_smile_nor"] stretchableImageWithLeftCapWidth:34 topCapHeight:34] forState:UIControlStateNormal];
        
        //切换键盘为正常键盘
        self.textView.inputView = nil;
        sender.tag = kKeyboardTypeKeyboard;
    }
    
    //添加立体旋转效果
    [UIView animateWithDuration:0.25 animations:^{
        sender.layer.transform = CATransform3DRotate(sender.layer.transform, M_PI, 0, 1, 0);
    }];
    
    [self performSelector:@selector(showboard) withObject:nil afterDelay:0.25];
}

- (void)showboard{
    [self.textView becomeFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.shouldMove = NO;
}

- (void)faceDidSelected:(UIImage *)faceImage{
    //将图片显示在textView上
    [self showImageToTextView:faceImage];
}

- (void)showImageToTextView:(UIImage *)face{
    //创建图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = face;
    attach.bounds = CGRectMake(0,0,18,18);
    
    //创建可变的属性字符串 保存当前显示的文本内容
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    
    //将图片附件转化为属性字符串
    NSAttributedString *attachStr = [NSAttributedString attributedStringWithAttachment:attach];
    
    //在属性字符串中添加一个图片附件
    [attrStr appendAttributedString:attachStr];
    
    self.textView.attributedText = attrStr;
    self.textView.font = [UIFont systemFontOfSize:20];
}
@end

















