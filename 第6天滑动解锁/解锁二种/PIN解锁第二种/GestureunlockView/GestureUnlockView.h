//
//  GestureUnlockView.h
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompleteBlock) (BOOL success);
@interface GestureUnlockView : UIView
@property (nonatomic,copy) CompleteBlock  block;
@end
