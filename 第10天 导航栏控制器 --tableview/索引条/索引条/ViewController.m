//
//  ViewController.m
//  索引条
//
//  Created by 张俊 on 2018/8/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "XMGCarsGroup.h"
#import "XMGCar.h"


@interface ViewController ()
/** 所有的车模型  */
@property (nonatomic,strong) NSMutableArray * carGroup;

@end

@implementation ViewController
#pragma mark ------ 懒加载数据 ------
-(NSMutableArray *)carGroup{
    if (_carGroup == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"cars.plist" ofType:nil];
        NSArray * tempArr = [NSArray arrayWithContentsOfFile:path];
//       初始化数组储存
        self.carGroup = [NSMutableArray array];
        for (NSDictionary * tempDic in tempArr) {
            [_carGroup addObject:[XMGCarsGroup XMGCarsGroupWith:tempDic]];
        }
    }
    return _carGroup;
}

//    0.首先定义相关的标识
static NSString * ID = @"car";
- (void)viewDidLoad {
    [super viewDidLoad];

//    注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];

//    索引值的文字颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
//    索引值的背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
    
}
//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}


#pragma mark ------ 实现数据源协议的方法 ------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroup.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    XMGCarsGroup * tempCarGroup = self.carGroup[section];
    
    return tempCarGroup.cars.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMGCarsGroup * tempCarGroup = self.carGroup[indexPath.section];

    XMGCar * car = [tempCarGroup.cars objectAtIndex:indexPath.row];

//    1.去缓存池中查找
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:ID];


//    2.如果缓存池中不存在，那么自己重新创建
    if (cell == nil) {
        cell = [UITableViewCell new];
    }
//    3.进行赋值
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     XMGCarsGroup * tempCarGroup = self.carGroup[section];
    
    return tempCarGroup.title;
}


-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray * array = [NSMutableArray array];
//    for (XMGCarsGroup * temp in self.carGroup) {
//        [array addObject:temp.title];
//    }
////    根据位置数据进行匹配
//    return array;
    
//    抽取self.carGroup的灭一个元素的title属性值放在一个新的数组中进行返回
    return [self.carGroup valueForKeyPath:@"title"];
    
}
@end










