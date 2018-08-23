//
//  FaceView.m
//  QQ聊天
//
//  Created by PengXiaodong on 2018/8/18.
//  Copyright © 2018年 PengXiaodong. All rights reserved.
//

#import "FaceView.h"
#import "FaceModel.h"
#import "GlassView.h"

#define kPadding ((self.frame.size.width-7*35)/8)

@interface FaceView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageCtrl;
@property (nonatomic, strong) NSMutableArray *faceModelsArray;
@property (nonatomic, copy) SelectBlock block;
@property (nonatomic, copy) DeleteBlock deleteBlock;
@property (nonatomic, strong) GlassView *glass;
@end

@implementation FaceView
- (GlassView *)glass{
    if (_glass == nil){
        self.glass = [GlassView glassViewWithFrame:CGRectMake(0, 0, 64, 91) container:self.scrollView];
    }
    _glass.hidden = NO;
    return _glass;
}

+ (FaceView *)faceViewWithFrame:(CGRect)frame andContainer:(UIView *)contatinerView selectBlock:(SelectBlock)aBlock deleteBlock:(DeleteBlock)dBlock{
    FaceView *fv = [[[NSBundle mainBundle] loadNibNamed:@"FaceView" owner:nil options:nil] firstObject];
    fv.delegate = self;
    fv.block = aBlock;
    fv.deleteBlock = dBlock;
    [contatinerView addSubview:fv];
    
    return fv;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    //加载数据
    [self loadFaceData];
    
    //显示表情
    [self initUI];
    
    self.scrollView.delegate = self;
}

- (IBAction)longPressGesture:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        //结束了
        //隐藏放大镜
        self.glass.hidden = YES;
        
        self.block(_glass.faceImageView.image);
    } else{
        //改变位置
        CGPoint location = [sender locationInView:_scrollView];
        
        self.glass.center = CGPointMake(location.x, location.y - 45.5);
        
        //计算当前应该显示那张图片
        int page = location.x / self.scrollView.frame.size.width;
        
        int row = (location.y - 10) / (32 + 20);
        
        int colum = (location.x - page *self.scrollView.frame.size.width -10) / (32 + 20);
        
        int index = page *27 + row *7 + colum;
        
        //获取index对应的图片
        FaceModel *model = [self.faceModelsArray objectAtIndex:index];
        UIImage *face = [UIImage imageNamed:model.imageName];
        
        //显示到放大镜上
        self.glass.faceImageView.image = face;
    }
}
- (IBAction)pageControlerValueChange:(UIPageControl *)sender {
    [self.scrollView setContentOffset:CGPointMake(sender.currentPage * _scrollView.frame.size.width, 0) animated:YES];
}

- (void)initUI{
    self.pageCtrl.numberOfPages = _faceModelsArray.count / 27 + 1;
    for (int i = 0; i < _faceModelsArray.count; i++){
        //获取这个i对应的表情的模型
        FaceModel *model = [self.faceModelsArray objectAtIndex:i];
        
        //计算x y坐标
        int page = i / 27;
        int row = (i - page * 27) / 7;
        int column = i - page * 27 - row * 7;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(page * self.scrollView.frame.size.width + kPadding + (35+kPadding)*column, kPadding + (35 + kPadding)*row, 35, 35)];
        [btn setImage:[UIImage imageNamed:model.imageName] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(faceButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
    }
    
    for (int i = 0; i < _faceModelsArray.count / 27 + 1; i++){
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((i+1) * self.scrollView.frame.size.width - kPadding - 36 , kPadding+(kPadding+32)*3, 36, 32)];
        [btn setImage:[UIImage imageNamed:@"compose_emotion_delete_highlighted"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(deleteButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
    }
    //设置scrollView的contentsize
    self.scrollView.contentSize = CGSizeMake((_faceModelsArray.count / 27 + 1) * _scrollView.frame.size.width, self.scrollView.frame.size.height);
    
   
}
- (void)deleteButtonDidClicked{
    self.deleteBlock();
}

- (void)faceButtonDidClicked:(UIButton *)sender{
    //将当前的这个按钮的图片传递给operationView的textView做显示
//    if ([self.delegate respondsToSelector:@selector(faceDidSelected:)]){
//        [self.delegate faceDidSelected:sender.imageView.image];
//    }
    
    self.block(sender.imageView.image);
}


- (void)loadFaceData{
    //读取表情信息 短语 图片
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"face" ofType:@"plist"];
    
    //读取文件的内容
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    //对读取的内容进行解析
    self.faceModelsArray = [NSMutableArray array];
    for (NSDictionary *faceDic in array){
        NSString *imageName = [faceDic objectForKey:@"png"];
        
        //将这个数据封装成对象
        FaceModel *model = [FaceModel new];
        model.imageName = imageName;
        
        //将封装的对象添加到数组里面 保存起来
        [self.faceModelsArray addObject:model];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    [self.pageCtrl setCurrentPage:page];
}
@end




















