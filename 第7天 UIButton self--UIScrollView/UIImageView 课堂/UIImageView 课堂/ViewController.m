//
//  ViewController.m
//  UIImageView 课堂
//
//  Created by 张俊 on 2018/8/12.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 添加的图片  */
@property (nonatomic,strong) UIImageView * imageView;

/** 进度条随着滑动条变化值  */
@property (nonatomic,strong) UIProgressView * progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sierra21"]];
    _imageView.frame = self.view.bounds;
    
//    图片的拉伸模式
    /*
     UIViewContentModeRedraw,
     
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,
     UIViewContentModeScaleAspectFill,
     
     UIViewContentModeCenter,
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     *//*
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    
//    允许用户进行手势交互
    _imageView.userInteractionEnabled = YES;
    
    
    
    [self.view addSubview:_imageView];
    
//    添加手势(点击手势)
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scale:)];
    tap.numberOfTapsRequired = 2;  //点击的次数
    tap.numberOfTouchesRequired = 1; //触摸的手指数
    [_imageView addGestureRecognizer:tap];
    
//    捏合手势
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(scale_1:)];
    [_imageView addGestureRecognizer:pinch];
    
//    滑动手势
    UISwipeGestureRecognizer * swap = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(scale_2:)];
    [_imageView addGestureRecognizer:swap];
//    长按手势
    */
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(80, 100, 150, 46);
//    UIImage * image = [UIImage imageNamed:@"EditAlbum_Btn_Delete"];
//    CGFloat imageHeight = image.size.height;
//    CGFloat imageWidth = image.size.width;
//    UIImage * resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight*0.5, imageWidth*0.5, imageHeight*0.5-1, imageWidth*0.5-1) resizingMode:UIImageResizingModeTile];
////    [btn setImage:resizableImage forState:UIControlStateNormal];
//    [btn setBackgroundImage:resizableImage forState:UIControlStateNormal];
//
//    [self.view addSubview:btn];
    
    
    
    
    
    
//  滑动条
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 50, self.view.bounds.size.width-20, 3)];
    
//    滑动条的最大最小值
    slider.minimumValue = 0;
    slider.maximumValue = 10000;
//    滑动过后的滑动条颜色变化
    slider.minimumTrackTintColor = [UIColor orangeColor];
    slider.maximumTrackTintColor = [UIColor purpleColor];
    
//    滑动条的最开始处的图片
    slider.minimumValueImage =  [UIImage imageNamed:@"EditAlbum_Btn_Delete"];
//    slider.maximumValueImage = [UIImage imageNamed:@"EditAlbum_Btn_Delete"];
//    slider.maximumValueImage = [UIImage imageNamed:@"Sierra21"];
    
//    添加监听事件
    [slider addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
     
    
//    进度条
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(50, 100, 250, 50)];
    
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    _progressView.progressTintColor = [UIColor orangeColor];
    
    _progressView.progress = 0.0;
    
    [self.view addSubview:_progressView];
    
    
//    开关
    UISwitch * sw = [[UISwitch alloc]initWithFrame:CGRectMake(50, 150, 200, 50)];
    [sw addTarget:self action:@selector(test_1:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw];
    

    
    
}
#pragma mark ------ 界面搭建起来以后才会显示 ------

-(void)viewDidAppear:(BOOL)animated{
    /*************************不能写在didload里面，因为这个方法只有在界面加载起来以后再调用**************************/
    [super viewDidAppear:animated];
    
    
    
    //  提示的控制器  提示用户做出来什么东西
//    UIAlertControllerStyleActionSheet         只是在底部进行提示
//    UIAlertControllerStyleAlert               在中间弹出来提示
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"测试标题" message:@"提示内容" preferredStyle:UIAlertControllerStyleAlert];
    
    
//    添加确定和取消按钮
    /*
     title：界面上按钮显示的内容
     style: UIAlertActionStyleDefault
            UIAlertActionStyleCancel
            UIAlertActionStyleDestructive
     handler:点击按钮以后要做的事情
     */
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        这边是点击确定按钮以后准备要做什么事情
        NSLog(@"hievfe");
    }];
    [alertController addAction:sureAction];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //        这边是点击确定按钮以后准备要做什么事情
        NSLog(@"取消");
    }];
    [alertController addAction:cancelAction];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    
    /*
     *  The next two methods are replacements for presentModalViewController:animated and
     dismissModalViewControllerAnimated: The completion handler, if provided, will be invoked after the presented
     controllers viewDidAppear: callback is invoked.
     
     The completion handler, if provided, will be invoked after the dismissed controller's viewDidDisappear: callback is invoked.
     */
    [self presentViewController:alertController animated:YES completion:nil]; 
}


-(void)test_1:(UISwitch *)sender{
    NSLog(@"%d",sender.on);
}


-(void)test:(UISlider *)sender{
//    NSLog(@"%f",sender.value);
    [self.progressView setProgress:(sender.value/sender.maximumValue) animated:YES];
}



-(void)scale:(UITapGestureRecognizer *)targetGesture{
//    双击手势
    [UIView animateWithDuration:1 animations:^{
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 0.8, 0.8);
    }];
}

-(void)scale_1:(UIPinchGestureRecognizer *)targetGesture{
    //    捏合手势
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 0.8, 0.8);
    targetGesture.scale = 1;
//    如果不加上这句话，那么每一次缩放都是相对于上一步而言，那么就是立方的乘积
}

-(void)scale_2:(UISwipeGestureRecognizer *)targetGesture{
    NSLog(@"hedfs");
}


@end








