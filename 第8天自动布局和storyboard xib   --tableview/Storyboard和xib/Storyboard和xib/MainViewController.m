//
//  MainViewController.m
//  Storyboard和xib
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "MainViewController.h"
#import "ColumItem.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UISwitch * switchs;

@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
//    ColumItem * item = [[[NSBundle mainBundle]loadNibNamed:@"ColumItem" owner:nil options:nil]lastObject];
//    item.center = CGPointMake(200, 100);
////    设置了大小，还是会按照xib的尺寸进行显示
////    item.frame = CGRectMake(0, 0, 300, 200);
//    [self.view addSubview:item];
    
    
    
}
- (IBAction)sliderValueChanged:(UISlider *)sender {
    float tempValue = sender.value/sender.maximumValue;
    self.progressView.progress = tempValue;
    if (tempValue > 0.5) {
        self.switchs.on = NO;
    }else{
         self.switchs.on = YES;
    }
    
}

@end











