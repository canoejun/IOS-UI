//
//  FactoryMethod.h
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeableImageView.h"

@interface FactoryMethod : NSObject

+(UIImageView *)imageViewWithFrame:(CGRect)frame
                              name:(NSString *)aName
                               tag:(NSInteger)aTag
                            hidden:(BOOL)aHidden
                         container:(UIView *)aContainer;

+ (ChangeableImageView *)imageViewWithFrame:(CGRect)frame
                                 normalName:(NSString*)normal
                                  wrongName:(NSString*)wrong
                                        tag:(NSInteger)tag
                                     hidden:(BOOL)hidden
                                  container:(UIView * )container;
@end
