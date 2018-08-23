//
//  PINLockView.m
//  2.PIN解锁版本二
//
//  Created by PengXiaodong on 2018/8/8.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "PINLockView.h"

@interface PINLockView ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *alertLabel;
@property (nonatomic, strong) UITextField *showTextField;
@property (nonatomic, strong) UIView *leftBGView;
@property (nonatomic, strong) UIImageView *lockImageView;
@property (nonatomic, strong) UILabel *placeHolderLabel;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *firstPwdString;
@end

@implementation PINLockView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil){
        //创建图片
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2.0-112/2.0, 60, 112, 112)];
        logoImageView.image = [UIImage imageNamed:@"logo"];
        [self addSubview:logoImageView];
        
        //创建label
        self.alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, frame.size.width, 50)];
        _alertLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_alertLabel];
        
        //1.获取系统自带的NSUserDefaults对象
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        //2.取数据 去密码
        self.password = [userDefaults objectForKey:@"pin"];
        if (_password.length != 0){
            _alertLabel.text = @"请输入密码";
        } else{
            _alertLabel.text = @"请设置密码";
        }
        
        //创建TextField
        self.showTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 278, frame.size.width-20-20, 60)];
        _showTextField.borderStyle = UITextBorderStyleLine;
        _showTextField.secureTextEntry = YES;
        _showTextField.tintColor = [UIColor clearColor];//光标透明
        _showTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _showTextField.layer.borderWidth = 1;
        _showTextField.delegate = self;
        [self addSubview:_showTextField];
        
        //设置文本和边框左边的距离 -》 通过添加一个看不见的视图
        _showTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 1)];
        _showTextField.leftViewMode = UITextFieldViewModeAlways;
        
        //创建背景视图 容纳图片和label
        self.leftBGView = [[UIView alloc] initWithFrame:CGRectMake(30, 292, 70, 32)];
        _leftBGView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_leftBGView];
        
        //添加锁
        self.lockImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        _lockImageView.image = [UIImage imageNamed:@"lock"];
        [self.leftBGView addSubview:_lockImageView];
        
        //密码文字
        self.placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 0, 32, 32)];
        _placeHolderLabel.text = @"密码";
        _placeHolderLabel.font = [UIFont systemFontOfSize:12];
        [self.leftBGView addSubview:_placeHolderLabel];
    }
    return self;
}


//移动
- (void)changePosition:(CGFloat)ty{
    if (ty > 0){
        //下移
        self.placeHolderLabel.textColor = [UIColor blackColor];
        self.lockImageView.image = [UIImage imageNamed:@"lock"];
        self.showTextField.layer.borderColor = [UIColor blackColor].CGColor;
    } else{
        //上移
        self.placeHolderLabel.textColor = [UIColor greenColor];
        self.lockImageView.image = [UIImage imageNamed:@"lock_green"];
        self.showTextField.layer.borderColor = [UIColor greenColor].CGColor;
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        //动画
        self.leftBGView.transform = CGAffineTransformTranslate(self.leftBGView.transform, 0, ty);
    } completion:^(BOOL finished) {
        //完成之后
    }];
}

//键盘弹出  开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //上移
    [self changePosition:-30];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //隐藏键盘
    [textField resignFirstResponder];
    
    //下移
    [self changePosition:30];
    
    //对用户的输入进行比较
    if (self.password.length == 0){
        //设置密码
        //判断是第一次输入还是第二次确认
        if (_firstPwdString.length == 0){
            //保存第一次输入的密码
            self.firstPwdString = self.showTextField.text;
            self.alertLabel.text = @"请确认密码";
        } else{
            //比较
            if ([_firstPwdString isEqualToString:_showTextField.text]){
                self.alertLabel.text = @"密码设置成功";
                
                //保存密码
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                //保存
                [userDefaults setObject:_firstPwdString forKey:@"pin"];
                
                //延迟1秒再回到主界面 告诉主界面
                [self performSelector:@selector(hidePINLockView) withObject:nil afterDelay:1];
            } else{
                self.alertLabel.text = @"两次输入不一致 请重新设置";
                self.firstPwdString = @"";
            }
        }
    } else{
        //确认密码
        if ([_password isEqualToString:_showTextField.text]){
            self.alertLabel.text = @"解锁成功";
            [self performSelector:@selector(hidePINLockView) withObject:nil afterDelay:1];
        }else{
            self.alertLabel.text = @"密码错误 请重新输入";
        }
    }
    
    self.showTextField.text = @"";
    return YES;
}

- (void)hidePINLockView{
    //发送消息
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    NSDictionary *dic = @{@"name":@"jack",@"pwd":@"123"};
    [center postNotificationName:@"testNotificationName" object:dic];
}
@end


























