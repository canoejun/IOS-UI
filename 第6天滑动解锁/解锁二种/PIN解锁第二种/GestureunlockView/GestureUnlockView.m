//
//  GestureUnlockView.m
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "GestureUnlockView.h"
#import "FactoryMethod.h"

#define kHidden YES

@interface GestureUnlockView()
@property (nonatomic,strong) UILabel * alertLabel;
//用来保存这九个点的视图的数组
@property (nonatomic,strong) NSMutableArray * nineDotViewArray;
//保存所有线条的tag值  将长整型封装成NSNumber储存在数组中
@property (nonatomic,strong) NSMutableArray * allLinesTagsArray;
//记录上一个点亮的点的tag值
@property (nonatomic,assign) NSInteger  lastSelectedDotTag;
//记录每次划过的每个点的tag组成的字符串 当做密码
@property (nonatomic,strong) NSMutableString * passwordString;
//记录设置密码中第一次输入的密码字符串
@property (nonatomic,strong) NSString * firstTimePasswordString;
//记录所有点亮的视图
@property (nonatomic,strong) NSMutableArray * allSelectedViewArray;
//保存原有的密码
@property (nonatomic,strong) NSString * originPasswordString;

@end

@implementation GestureUnlockView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //        初始化
        //    属性变量使用之前一定要初始化，否则默认是空，加不进去
        self.nineDotViewArray = [NSMutableArray arrayWithCapacity:9];
        self.allLinesTagsArray = [NSMutableArray arrayWithCapacity:20];
        self.passwordString = [NSMutableString string];
        self.allSelectedViewArray = [NSMutableArray array];
        
//        布局
//    创建默认的点的图片
        [FactoryMethod imageViewWithFrame:CGRectMake((self.frame.size.width - 320)/2.0, 85, 320, 460) name:@"Unlock_DotLock1_Normal" tag:0 hidden:NO container:self ];
        [self initUI];
        
//        添加label
        [self initAlertLabel];
    }
    return self;
}
-(void)initUI{
    
//    布局竖线
    [self initshu_hengxian];
    
//    布局右斜 左斜线
    [self inityou_zuoxie];
//布局九个点
    [self initNinePoint];
}
-(void)initAlertLabel{
    
    self.alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(50,170, self.bounds.size.width-100,50)];
    _alertLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_alertLabel];
    
    //    获取userDefaults里面保存的密码
    NSString * password = [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    if (password.length == 0) {
        //        第一次
        _alertLabel.text = @"请设置密码图案";
    }else{
        //        不是第一次，已经有密码了
        _alertLabel.text = @"请绘制解锁图案";
//        self.originPasswordString = [NSString stringWithString:password];
    }
}


//布局九个点
-(void)initNinePoint{
    NSInteger indextag = 1;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
           ChangeableImageView * dotImageView = [FactoryMethod imageViewWithFrame:CGRectMake(63 + j*99, 250+i*99, 52, 52) normalName:@"Unlock_DotLock1_Selected" wrongName:@"Unlock_DotLock_Wrong1" tag:indextag hidden:kHidden container:self];
            [self.nineDotViewArray addObject:dotImageView];
            indextag++;
        }
    }
    
}

//    布局竖线 横线
-(void)initshu_hengxian{
    NSInteger acrossIndextag = 12;
    NSInteger verticalIndextag = 14;
    /*
     12  23
     45  56
     78  89
     */
//    添加横线
    for (int i = 0; i < 3; i++) {
        CGFloat startX =  70;
        for (int j = 0; j < 2; j++) {
            ChangeableImageView * acrossLineImageView = [FactoryMethod imageViewWithFrame:CGRectMake(startX + j*99, 255+i*99, 120, 37) normalName:@"Unlock_DotLock1_Normal_Highlight1" wrongName:@"Unlock_DotLock1_Wrong_Highlight1" tag:acrossIndextag hidden:kHidden container:self];
//            添加横线的tag值进入数组中
            [self.allLinesTagsArray addObject:[NSNumber numberWithInteger:acrossLineImageView.tag]];
            acrossIndextag += 11;
        }
        acrossIndextag += 11;
    }
    /*
     14 25 36
     47 58 69
     */
//    添加竖线
    for (int i = 0; i < 2; i++) {
        CGFloat startX =  70;
        for (int j = 0; j < 3; j++) {
            ChangeableImageView * verticalLineImageView = [FactoryMethod imageViewWithFrame:CGRectMake(startX + j*99, 255+i*99, 37, 120) normalName:@"Unlock_DotLock1_Normal_Highlight2" wrongName:@"Unlock_DotLock1_Wrong_Highlight2" tag:verticalIndextag hidden:kHidden container:self];
            [self.allLinesTagsArray addObject:[NSNumber numberWithInteger:verticalLineImageView.tag]];
            verticalIndextag += 11;
        }
    }
}

//    布局右斜线
-(void)inityou_zuoxie{
    int rightindex = 15;
    int leftindex = 24;
    for (int i = 0; i < 2; i++) {
        CGFloat startX = 70;
        for (int j = 0; j < 2; j++) {
            ChangeableImageView * rightSlopeLine = [FactoryMethod imageViewWithFrame:CGRectMake(startX + j*99, 255+i*99,120, 120) normalName:@"Unlock_DotLock1_Normal_Highlight3" wrongName:@"Unlock_DotLock1_Wrong_Highlight3" tag:rightindex hidden:kHidden container:self];
            [self.allLinesTagsArray addObject:[NSNumber numberWithInteger:rightSlopeLine.tag]];
            
            rightindex +=11;
            
            ChangeableImageView * leftSlopeLine = [FactoryMethod imageViewWithFrame:CGRectMake(startX +15+j*99, 255+i*99,120, 120) normalName:@"Unlock_DotLock1_Normal_Highlight4" wrongName:@"Unlock_DotLock1_Wrong_Highlight4" tag:leftindex hidden:kHidden container:self];
            [self.allLinesTagsArray addObject:[NSNumber numberWithInteger:leftSlopeLine.tag]];
            
            leftindex +=11;
        }
        rightindex +=11;
        leftindex += 11;
    }
}

#pragma mark ------ 处理触摸事件 ------

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    获取触摸点的坐标
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    //    判断location是否在某一个dotView上
    for (ChangeableImageView * dotView in _nineDotViewArray) {
        if (CGRectContainsPoint(dotView.frame, location)) {
            NSLog(@"---%ld",dotView.tag);
            //            点亮第一个点
            dotView.hidden = NO;
            //            记录这个点的tag
            self.lastSelectedDotTag = dotView.tag;
            //            记录密码
            [self.passwordString appendFormat:@"%ld",dotView.tag];
            //            记录点亮的视图
            [self.allSelectedViewArray addObject:dotView];
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    获取触摸点的坐标
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    //    判断location是否在某一个dotView上
    for (ChangeableImageView * dotView in self.nineDotViewArray) {
        if (CGRectContainsPoint(dotView.frame, location)) {
            //            判断是不是第一个点
            if(self.lastSelectedDotTag == 0){
                //                第一个点 直接点亮
                dotView.hidden = NO;
                self.lastSelectedDotTag = dotView.tag;
                //            记录密码
                [self.passwordString appendFormat:@"%ld",dotView.tag];
                //            记录点亮的视图
                [self.allSelectedViewArray addObject:dotView];
            }else{
                //            判断路径是否可达 两个点的tag值来判断 small*10+big
                NSInteger lineTag = _lastSelectedDotTag > dotView.tag ? dotView.tag*10+_lastSelectedDotTag : _lastSelectedDotTag*10+dotView.tag;
//                NSLog(@"%ld",lineTag);
                if ([self.allLinesTagsArray containsObject:[NSNumber numberWithInteger:lineTag]]) {
                    //                     判断点和线是否被点亮，没有则点亮
                    UIImageView * lineView =[self viewWithTag:lineTag];
                    //                    if (dotView.hidden == YES || lineView.hidden == YES){
                    if (dotView.hidden == YES){
                        //                     路径可达
                        //                     点亮点 点亮线
                        dotView.hidden = NO;
                        
                        lineView.hidden = NO;
                        //            记录密码
                        [self.passwordString appendFormat:@"%ld",dotView.tag];
                        //            记录点亮的视图
                        [self.allSelectedViewArray addObject:dotView];
                        //                        记录点亮的线
                        [self.allSelectedViewArray addObject:lineView];
                        _lastSelectedDotTag = dotView.tag;
                    }
                }
            }
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    判断之前有没有设置过密码
    if (self.originPasswordString.length == 0) {
        //         开始设置密码
        //    判断是不是设置密码的第一次
        if (self.firstTimePasswordString.length == 0) {
            //        第一次
            self.firstTimePasswordString = [NSString stringWithString:self.passwordString];
            //        隐藏点亮的视图s
            [self hideAllSelectedView];
            //        提示用户确认密码图案
            self.alertLabel.text = @"请确认密码图案";
        }else{
            //        判断第一次和第二次是否一致
            if ([self.passwordString isEqualToString:self.firstTimePasswordString]  ) {
                _alertLabel.text = @"密码设置成功";
                //          保存密码
                NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:self.passwordString forKey:@"password"];
                [userDefaults synchronize];//等待同步存密码，后运行
                
                [self hideLockView];
            }else{
                _alertLabel.text = @"密码不一致，请再次绘制";
                self.firstTimePasswordString = @"";
                [self changeToWrongImage];
            }
        }
    }else{
        if ([self.originPasswordString isEqualToString:self.passwordString]) {
            _alertLabel.text = @"解锁成功";
            [self hideAllSelectedView];
            //            进入主界面
        }else{
            _alertLabel.text = @"解锁失败，请重试";
            [self changeToWrongImage];
        }
    }
}

-(void)changeToWrongImage{
    for (ChangeableImageView * selectedImageView in self.allSelectedViewArray) {
        [selectedImageView showWrongImage];
    }
    //    过几秒再消失  运行某个函数 传参数 延迟几秒
    [self performSelector:@selector(hideAllSelectedView) withObject:nil afterDelay:1];
}

-(void)changeToNormalImage{
    for (ChangeableImageView * selectedImageView in self.allSelectedViewArray) {
        [selectedImageView showNormalImage];
    }
}
//隐藏所有点亮的视图
-(void)hideAllSelectedView{
    for (ChangeableImageView * selectedView in self.allSelectedViewArray) {
        selectedView.hidden = YES;
        [selectedView showNormalImage];
    }
    [self.passwordString setString:@""];
    self.lastSelectedDotTag = 0;
}




-(void)hideLockView{
    self.block(YES);
}
@end



















