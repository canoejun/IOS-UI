//
//  ColumItem.h
//  网易分类
//
//  Created by PengXiaodong on 2018/8/13.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface ColumItem : UIButton
//记录显示的栏目名称
@property (nonatomic, strong) NSString  *itemName;
//记录当前的编辑状态
@property (nonatomic, assign) BOOL isEditing;
//记录这个栏目按钮在哪个类型栏目里面
@property (nonatomic, assign) kOperationType type;

@end











