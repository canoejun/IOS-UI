//
//  OperationView.h
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/18.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceView.h"

@interface OperationView : UIView<FaceSelectDelegate>

/** 创建一个OperationView*/
+ (OperationView *)showOperationViewWithFrame:(CGRect)frame andFather:(UIView *)containerView;

- (void)hideKeyboard;

@end














