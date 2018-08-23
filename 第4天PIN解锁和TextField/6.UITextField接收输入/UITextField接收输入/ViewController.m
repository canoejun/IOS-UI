//
//  ViewController.m
//  UITextField接收输入
//
//  Created by PengXiaodong on 2018/8/7.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *nameTextFiled;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UITextFiled
    self.nameTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    
    //设置边框的类型
    _nameTextFiled.borderStyle = UITextBorderStyleLine;
    
    //设置边框颜色
    _nameTextFiled.layer.borderColor = [UIColor greenColor].CGColor;
    _nameTextFiled.layer.borderWidth = 1;
    
    //安全输入
    _nameTextFiled.secureTextEntry = YES;
    
    //设置默认提示内容
    _nameTextFiled.placeholder = @"请输入名字";
    
    //设置文字的属性
    _nameTextFiled.textColor = [UIColor redColor];
    _nameTextFiled.textAlignment = NSTextAlignmentLeft;
    _nameTextFiled.font = [UIFont systemFontOfSize:16];
    
    //设置键盘的风格
    _nameTextFiled.keyboardType = UIKeyboardTypeDefault;
    
    //设置delegate
    _nameTextFiled.delegate = self;
    
    [self.view addSubview:_nameTextFiled];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //弹出键盘
    [self.nameTextFiled becomeFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //隐藏键盘
    [self.nameTextFiled resignFirstResponder];
}

//配置是否可以输入
//当textField becomeFirstResponder之前会调用这个方法
//YES 可以编辑 可以成为第一响应者
//NO 不可以编辑 不能成为第一响应者
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"是否可以开始编辑");
    return YES;
}

//开始编辑了 点击输入框 即将开始输入内容
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑 textFieldDidBeginEditing ");
}

//配置是否可以取消第一响应者 是否可以停止输入内容
//当textField resignFirstResponder之前会调用这个方法
//YES 可以取消第一响应者
//NO 不可以取消 一直等待输入
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"是否可以停止输入");
    return YES;
}

//停止编辑了
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"停止编辑了");
}

//键盘上的retun按钮被点击了
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"键盘上的return键被点击了");
    [self.nameTextFiled resignFirstResponder];
    return YES;
}

//实时监听textField上文本内容的改变
//range
//string 新输入的字符
//即将用新输入的字符来拼接字符串  注意还没有拼接
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //原来显示的内容
    NSLog(@"改变之前的内容:%@", textField.text);
    //新的内容=用string去替换text上range范围的内容
    NSString *newStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"即将显示的内容:%@", newStr);
    return YES;
}
@end






























