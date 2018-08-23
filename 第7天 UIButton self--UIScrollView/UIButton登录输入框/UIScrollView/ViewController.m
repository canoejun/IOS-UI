//
//  ViewController.m
//  UIScrollView
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 输入框  */
//@property (nonatomic,strong) UITextField * passwordTextField;
/** 登录按钮  */
@property (nonatomic,strong) UIButton * loginButton;


@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    redView.backgroundColor = [UIColor redColor];
//    [self.testUIScrollVIew addSubview:redView];
//
//    self.testUIScrollVIew.contentSize = CGSizeMake(400, 100);
//
    self.loginButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 90, 50)];
    _loginButton.backgroundColor = [UIColor purpleColor];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.enabled = NO;
    [self.view addSubview:_loginButton];
    
    
     UITextField * passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 40,100, 50)];
    passwordTextField.backgroundColor = [UIColor orangeColor];
//    _passwordTextField.delegate = self;

    //或者是采用 addtarget action forControlEvents
    [passwordTextField addTarget:self action:@selector(change:) forControlEvents:UIControlEventEditingChanged];

    [self.view addSubview:passwordTextField];
    
//    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
//    tf.borderStyle = UITextBorderStyleLine;
//    tf.placeholder = @"密码";
//    //tf.delegate = self;
//    [tf addTarget:self action:@selector(change:) forControlEvents:UIControlEventEditingChanged];
//    [self.view addSubview:tf];

    
}
//- (void)change:(UITextField *)sender{
//    if (sender.text.length == 0) {
//        _loginButton.enabled = NO;
//        _loginButton.backgroundColor = [UIColor grayColor];
//    } else{
//        if (_loginButton.enabled == NO) {
//            _loginButton.enabled = YES;
//            _loginButton.backgroundColor = [UIColor colorWithRed:167/255.0 green:57/255.0 blue:61/255.0 alpha:1];
//        }
//    }
//}


-(void)change:(UITextField *)textField{
    if (textField.text.length == 0) {
        _loginButton.enabled = NO;
        _loginButton.backgroundColor = [UIColor purpleColor];
    }else{
        if (_loginButton.enabled == NO) {
            _loginButton.enabled = YES ;
            _loginButton.backgroundColor = [UIColor greenColor];
            NSLog(@"dgs");
        }
    }
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    if (_passwordTextField.text.length > 0) {
//        _loginButton.enabled = YES;
//        NSLog(@"dgs");
//    }
//}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
/*
    //获取当前textFeild上的内容
    NSString *conent = [textField.text stringByReplacingCharactersInRange:range withString:string];

    if (conent.length == 0){
        //将按钮设为禁用
        _loginBtn.enabled = NO;
        _loginBtn.backgroundColor = [UIColor grayColor];
    } else{
        //可以点击
        if (_loginBtn.enabled == NO) {
            _loginBtn.enabled = YES;
            _loginBtn.backgroundColor = [UIColor colorWithRed:167/255.0 green:57/255.0 blue:61/255.0 alpha:1];
        }
    }
return YES;

*/

//
//    if (string.length == 0) {
//        _loginButton.enabled = NO;
//        _loginButton.backgroundColor = [UIColor purpleColor];
//        NSLog(@"dgs");
//    }else if (string.length > 0){
//        _loginButton.enabled = YES;
//        _loginButton.backgroundColor = [UIColor purpleColor];
//    }
//     return YES;
//}


@end









