//
//  OperaionView.h
//  QQ表情键盘输入分层次
//
//  Created by 张俊 on 2018/8/18.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperaionView : UIView


+(OperaionView*)showOperationViewWithFrame:(CGRect)frame andContainView:(UIView*)container;


-(void)hidekeyboard;
@end
