//
//  FactoryMethod.h
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactoryMethod : NSObject

+(UIImageView *)imageViewWithFrame:(CGRect)frame
                              name:(NSString *)aName
                               tag:(NSInteger)aTag
                            hidden:(BOOL)aHidden
                         container:(UIView *)aContainer;

@end
