//
//  ChangeableImageView.h
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeableImageView : UIImageView
@property (nonatomic,strong) NSString * noramalImageName;
@property (nonatomic,strong) NSString * wrongImageName;


-(void)showNormalImage;
-(void)showWrongImage;


@end
