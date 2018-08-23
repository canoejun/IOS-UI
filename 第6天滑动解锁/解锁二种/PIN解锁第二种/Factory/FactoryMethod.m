//
//  FactoryMethod.m
//  PIN解锁第二种
//
//  Created by 张俊 on 2018/8/9.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "FactoryMethod.h"

@implementation FactoryMethod

+(UIImageView *)imageViewWithFrame:(CGRect)frame
                              name:(NSString *)aName
                               tag:(NSInteger)aTag
                            hidden:(BOOL)aHidden
                         container:(UIView *)aContainer{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:aName];
    imageView.tag = aTag;
    imageView.hidden = aHidden;
    [aContainer addSubview:imageView];
    
    return imageView;
}

+ (ChangeableImageView *)imageViewWithFrame:(CGRect)frame
                                 normalName:(NSString*)normal
                                  wrongName:(NSString*)wrong
                                        tag:(NSInteger)tag
                                     hidden:(BOOL)hidden
                                  container:(UIView * )container{
    ChangeableImageView * imageView = [[ChangeableImageView alloc]initWithFrame:frame];
    imageView.noramalImageName = normal;
    imageView.wrongImageName = wrong;
    imageView.tag = tag;
    imageView.hidden = hidden;
    [container addSubview:imageView];
    [imageView showNormalImage];
    return imageView;
    
    
    
    
}
@end
