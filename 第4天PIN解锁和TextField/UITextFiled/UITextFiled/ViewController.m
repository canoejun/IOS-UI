//
//  ViewController.m
//  UITextFiled
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    程序加载起来的时候  直接弹出来键盘  或者在viewDidappear里面写   弹出来键盘
    [self.nameTextField becomeFirstResponder];
    
//    输入不同的东西  那么直接给用户不同的键盘
//    self.nameTextField.keyboardType = UIKeyboardTypeNumberPad;
//    self.nameTextField.keyboardType = UIKeyboardTypeURL;
//    self.nameTextField.keyboardAppearance = UIKeyboardAppearanceDark;
    
//    背景图片   当borderStyle为roundRect的时候，那么不会显示出来背景
    
    
//    设置边框类型
    self.nameTextField.borderStyle = UITextBorderStyleLine;
    
}


//触摸事件这时候是用于判断是否在View上面，也就是判断View是否是第一响应者
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    隐藏键盘
    [self.nameTextField resignFirstResponder];
}

//配置输入的开始  能不能现在开始输入
//当textfield  becomefirstResponder之前会调用这个方法  yes可以编辑，可以成为第一响应者  no不可以编辑，不能够成为第一响应者
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    点击开始的时候，开始编辑
}

//配置是否可以结束
//当textfield  resignfirstResponder之前会调用这个方法  yes可以结束，可以停止 no不可以结束，一直输入
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

//停止编辑
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"---%@--",string);
    return YES;
    
}

@end








