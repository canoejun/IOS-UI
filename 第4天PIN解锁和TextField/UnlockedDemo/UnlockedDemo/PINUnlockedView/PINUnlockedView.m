//
//  PINUnlockedView.m
//  UnlockedDemo
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "PINUnlockedView.h"

#define kTextPadding 80
#define kPasswordPadding 50

@interface PINUnlockedView()
@property (nonatomic,strong) UILabel * MessageLabel;
@property (nonatomic,strong) UITextField * passwordTextFiled;
@property (nonatomic,strong) NSString * originPassword;
@property (nonatomic,strong) NSString * tempPassword;
@property (nonatomic,strong) NSString * firstpassword;
@end



@implementation PINUnlockedView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = [UIColor redColor];
        self.originPassword = [NSString string];
        self.tempPassword = [NSString string];
        
        
//        布局一下
        [self initUI];
    }
    
    return self;
    
}

-(void)initUI{
    
//    设置提示的label
    self.MessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(kTextPadding, 100, self.bounds.size.width-2*kTextPadding, 40)];
    if (0 == self.originPassword.length) {
        if (self.firstpassword.length == 0) {
             _MessageLabel.text = @"请设置密码";
        }else{
            _MessageLabel.text = @"请确认密码";
        }
    }else{
        _MessageLabel.text = @"请输入密码";
    }
    
    
    _MessageLabel.backgroundColor = [UIColor magentaColor];
    _MessageLabel.textColor = [UIColor blueColor];
    _MessageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_MessageLabel];
    
    [self initTextField];
}

-(void)initTextField{
    //    设置输入框
    self.passwordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(kPasswordPadding, 220, self.bounds.size.width-2*kPasswordPadding, 50)];
    
    
//    设置相关的文字
    _passwordTextFiled.placeholder = @"请输入密码";
//    安全输入
    _passwordTextFiled.secureTextEntry = YES;
//    清空再次输入
    _passwordTextFiled.clearsOnBeginEditing = YES;
    _passwordTextFiled.delegate = self;
    
    //    设置左边的解锁图片
    _passwordTextFiled.backgroundColor = [UIColor whiteColor];
    UIView * imagebgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    UIImageView * picImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 25, 25)];
    picImage.image = [UIImage imageNamed:@"iconfont-password"];
    [imagebgView addSubview:picImage];
    _passwordTextFiled.leftView = imagebgView;
    _passwordTextFiled.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    [self addSubview:_passwordTextFiled];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.passwordTextFiled resignFirstResponder];
//
//    _tempPassword =  _passwordTextFiled.text;
//    _passwordTextFiled.text = @"";
//    [self judgePassword];
//}


//一般用不着
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([_MessageLabel.text isEqualToString:@"密码设置失败，请重新设置"]) {
        _MessageLabel.text = @"请设置密码";
    }
    return YES;
}

//开始编辑了  点击输入框 即将开始输入内容
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
//一般用不着
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

//-(void)textFieldDidEndEditing:(UITextField *)textField{
//
//}

//键盘上的return键被点击了    常用
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.passwordTextFiled resignFirstResponder];
    
    _tempPassword =  _passwordTextFiled.text;
    _passwordTextFiled.text = @"";
    [self judgePassword];
    return YES;
}

//很常用  实时监听textfiled上文本内容

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    return YES;
//}


//进行密码的判断
-(void)judgePassword{
    if (_originPassword.length == 0) {
        if (self.firstpassword.length == 0) {
//            第一次设置
            self.firstpassword = [NSString stringWithString:_tempPassword];
            _MessageLabel.text = @"请确认密码";
        }else{
            if ([_firstpassword isEqualToString:_tempPassword]) {
                _MessageLabel.text = @"密码设置成功";
                self.originPassword = [NSString stringWithString:_firstpassword];
            }else{
                _MessageLabel.text = @"密码设置失败，请重新设置";
                NSLog(@"第一次%@  每一次%@",_firstpassword,_tempPassword);
                self.originPassword = @"";
                self.tempPassword = @"";
                self.firstpassword = @"";
            }
        }
    }else{
        if ([_originPassword isEqualToString:_tempPassword]) {
            _MessageLabel.text = @"密码输入正确";
            _tempPassword = @"";
        }else{
            _MessageLabel.text = @"密码输入不正确，请重试";
            _tempPassword = @"";
        }
    }
}


@end











