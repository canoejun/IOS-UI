//
//  PINUnlockedView.h
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/7.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompleteBlock) (BOOL success);

@interface PINUnlockedView : UIView
@property (nonatomic,copy) CompleteBlock  block;
@end
