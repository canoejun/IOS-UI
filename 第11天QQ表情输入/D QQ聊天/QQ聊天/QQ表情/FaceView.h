//
//  FaceView.h
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/18.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectBlock)(UIImage *faceImage);
typedef void(^DeleteBlock)(void);

@protocol FaceSelectDelegate <NSObject>
- (void)faceDidSelected:(UIImage *)faceImage;
@end

@interface FaceView : UIView

@property (nonatomic, assign) id<FaceSelectDelegate> delegate;

+ (FaceView *)faceViewWithFrame:(CGRect)frame andContainer:(UIView *)contatinerView selectBlock:(SelectBlock)block deleteBlock:(DeleteBlock)dBlock;

@end















