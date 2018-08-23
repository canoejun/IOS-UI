//
//  PINUnlockedView.m
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "PINUnlockedView.h"

#define kPadding 40
#define kScaleNum 0.5

@interface PINUnlockedView()<UITextFieldDelegate>
//提示信息栏
@property (nonatomic,strong) UILabel * MessageLabel;
//输入框
@property (strong, nonatomic)  UITextField * passwordTextFiled;
//添加的小锁图片
@property (nonatomic,strong) UIView * imagebgView;
@property (nonatomic,strong) UIImageView * picImage;
@property (nonatomic,strong) UILabel * textLabel;
@property (nonatomic,strong) UIColor * bgColor;//统一全部的背景
//输入密码的相关东西
@property (nonatomic,strong) NSString * originPassword;
@property (nonatomic,strong) NSString * tempPassword;
@property (nonatomic,strong) NSString * firstpassword;
//存放用户数据
@property (nonatomic,strong) NSUserDefaults * userDefaults;

@end



@implementation PINUnlockedView




-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        设置统一颜色
        self.bgColor = [UIColor whiteColor];
        self.backgroundColor = _bgColor;
        
        //    布局textfield
        [self initInputTextField];
        
        //      添加label
        [self initMessageLabel];
        
        //    向textfield左边添加图片
        [self addPicture];
        
        
    }
    return self;
}

#pragma mark ------  布局textfield  ------
-(void)initInputTextField{
    //    布局textfield
    self.passwordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(kPadding, 215, self.bounds.size.width-2*kPadding, 55)];
    
    
    _passwordTextFiled.backgroundColor = _bgColor;
    _passwordTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTextFiled.borderStyle = UITextBorderStyleLine;
    //清除光标
    _passwordTextFiled.tintColor = [UIColor clearColor];
    _passwordTextFiled.secureTextEntry = YES;
    //    安全输入
    _passwordTextFiled.secureTextEntry = YES;
    _passwordTextFiled.delegate = self;
    [self addSubview:_passwordTextFiled];
}

#pragma mark ------ 添加提示文字 ------
-(void)initMessageLabel{
    
    //    设置主题解锁背景
    UIImageView * titleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_passwordTextFiled.center.x-62, 20, 124, 116)];
    titleImageView.image = [UIImage imageNamed:@"icon"];
    [self addSubview:titleImageView];
    
//    设置密码设置提醒
    self.MessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(kPadding+40, _passwordTextFiled.center.y-100, self.bounds.size.width-2*(kPadding+40), 50)];
    
    
    //        1.获取系统自带的NSUserDefaults对象
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    //        2.取密码
    self.originPassword = [_userDefaults objectForKey:@"passwords"];
    
    
    
    
    if (0 == self.originPassword.length) {
        if (self.firstpassword.length == 0) {
            _MessageLabel.text = @"请设置密码";
        }else{
            _MessageLabel.text = @"请确认密码";
        }
    }else{
        _MessageLabel.text = @"请输入密码";
    }
    _MessageLabel.textColor = [UIColor magentaColor];
    _MessageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_MessageLabel];
}

#pragma mark ------ 添加左边的小锁和密码文字 ------
-(void)addPicture{
    //    向textfield左边添加图片
    self.imagebgView = [[UIView alloc]initWithFrame:CGRectMake(kPadding+8, _passwordTextFiled.frame.origin.y+5, 50, 45)];
    self.picImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 21, 24)];
    _picImage.image = [UIImage imageNamed:@"iconfont-password"];
    [_imagebgView addSubview:_picImage];
    _imagebgView.backgroundColor = _bgColor;
    
    [self addSubview:_imagebgView];
    
    
    //    设置显示文字的label
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(kPadding+_imagebgView.bounds.size.width, _passwordTextFiled.frame.origin.y+5, 40, 40)];
    _textLabel.text = @"密码";
    _textLabel.textColor = [UIColor grayColor];
    _textLabel.backgroundColor = _bgColor;
    [self addSubview:_textLabel];
}

#pragma mark ------ 输入结束 ------
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //    添加动画
    [UIView animateWithDuration:0.7 animations:^{
//        _imagebgView.transform = CGAffineTransformScale(_imagebgView.transform, kScaleNum, kScaleNum);
////        _imagebgView.transform = CGAffineTransformMakeTranslation(0, -33);
//        _textLabel.transform = CGAffineTransformScale(_textLabel.transform, kScaleNum, kScaleNum);
//        改变锁的照片
        _picImage.image = [UIImage imageNamed:@"lock2-1"];
//        _textLabel.transform = CGAffineTransformMakeTranslation(-8, -30);
        _passwordTextFiled.layer.borderColor = [UIColor greenColor].CGColor;
        _passwordTextFiled.layer.borderWidth = 2;
        _textLabel.textColor = [UIColor greenColor];
        _imagebgView.transform = CGAffineTransformTranslate(_imagebgView.transform,0, -33);
        _textLabel.transform = CGAffineTransformTranslate(_textLabel.transform,-8, -30);
    }];
    _textLabel.backgroundColor = _bgColor;
    _imagebgView.backgroundColor = _bgColor;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    限制不能够大于6位的密码
    if (_passwordTextFiled.text.length > 5) {
        _passwordTextFiled.text = [_passwordTextFiled.text substringWithRange:NSMakeRange(0, 5)];
    }else{
        _passwordTextFiled.text =  _passwordTextFiled.text;
    }
    return YES;
}

#pragma mark ------ 触摸事件 点击空白处的时候 ------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    点击空白处的时候调用协议方法
    [self textFieldShouldReturn:_passwordTextFiled];
}

#pragma mark ------ 点检回车按钮 ------
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.passwordTextFiled resignFirstResponder];
    
    _tempPassword =  _passwordTextFiled.text;
    _passwordTextFiled.text = @"";
    [self judgePassword];
    //    添加动画 恢复原样
    [UIView animateWithDuration:0.7 animations:^{
        _passwordTextFiled.layer.borderColor = [UIColor blackColor].CGColor;
        _textLabel.textColor = [UIColor grayColor];
        _picImage.image = [UIImage imageNamed:@"iconfont-password"];
        _imagebgView.transform = CGAffineTransformIdentity;
        _textLabel.transform =  CGAffineTransformIdentity;
//        _imagebgView.transform = CGAffineTransformTranslate(_imagebgView.transform,0, 33);
//        _textLabel.transform = CGAffineTransformTranslate(_textLabel.transform,8, 30);
    }];
    return YES;
}

#pragma mark ------ 进行密码的判断 ------
-(void)judgePassword{
    if (_originPassword.length == 0) {
        if (self.firstpassword.length == 0) {
            if (_tempPassword.length > 0) {
                //            第一次设置
                self.firstpassword = [NSString stringWithString:_tempPassword];
                _MessageLabel.text = @"请确认密码";
            }
        }else{
            if ([_firstpassword isEqualToString:_tempPassword]) {
                _MessageLabel.text = @"密码设置成功";
                self.originPassword = [NSString stringWithString:_firstpassword];
                
//                存用户设置的密码
                [_userDefaults setObject:_originPassword forKey:@"passwords"];
//                同步设置
                [_userDefaults synchronize];
                
//                加个延迟 让提示过一会再消失
                [self performSelector:@selector(hideLockView) withObject:nil afterDelay:1];
                

            }else{
                _MessageLabel.text = @"密码设置失败，请重新设置";
                self.originPassword = @"";
                self.tempPassword = @"";
                self.firstpassword = @"";
            }
        }
    }else{
        if ([_originPassword isEqualToString:_tempPassword]) {
            _MessageLabel.text = @"密码输入正确";
            _tempPassword = @"";
            //                加个延迟 让提示过一会再消失
            [self performSelector:@selector(hideLockView) withObject:nil afterDelay:1];
        }else{
            _MessageLabel.text = @"密码输入不正确，请重试";
            _tempPassword = @"";
        }
    }
}

-(void)hideLockView{
    //                告诉主界面
//    self.block(YES);
    self.block(YES);
}


@end


















