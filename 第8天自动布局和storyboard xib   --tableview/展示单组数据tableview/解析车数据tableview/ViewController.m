//
//  ViewController.m
//  解析车数据tableview
//
//  Created by 张俊 on 2018/8/14.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "ViewController.h"
#import "ZJWine.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 酒数据  */
@property (nonatomic,strong) NSMutableArray * wineArray;

@end

@implementation ViewController
//懒加载
-(NSMutableArray *)wineArray{
    if (!_wineArray) {
        self.wineArray = [NSMutableArray array];
        NSArray * tempArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"wine.plist" ofType:nil]];
        for (NSDictionary * dic in tempArray) {
            [_wineArray addObject:[ZJWine wineWithDic:dic]];
        }
    }
    
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
//    NSLog(@"%@",self.wineArray);
//    设置每一行的高度
    self.tableView.rowHeight = 60;
//    每一组的头部高度
    self.tableView.sectionHeaderHeight = 40;
//    每一组的尾部高度
    self.tableView.sectionFooterHeight = 40;
    
    
    
//    分割线的颜色   设置为clearcolor那么就是隐藏分割线了
//    self.tableView.separatorColor =  [UIColor redColor];
    
//    none隐藏分割线
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    整个组的头部和尾部
//    头部是放广告的
//    self.tableView.tableHeaderView =
//    尾部是放查看更多的
//    self.tableView.tableFooterView =
    
    
    #pragma mark ------ 设置代理 ------
    self.tableView.delegate = self;
    
    
    
    
    
}
#pragma mark ------ UITableView的delegate协议方法 ------
//选中了某一行cell就会调用这个方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了：%ld",indexPath.row);
}
//取消选中了某一行cell就会调用这个方法
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"取消选中了：%ld",indexPath.row);
}
//表示显示每一组的头部控件   当显示头部控件后，那么就不会出现头部的标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIButton buttonWithType:UIButtonTypeInfoLight];
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//}

//返回的是哪一组的头部标题的高度（有的组需要特定的高度）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}
//返回值的是哪一组的提示高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//}

//表示的是特定的哪一行的高度     cell的属性里面设置的高度是每一行的
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}












#pragma mark ------ UITableView的dataSource协议方法 ------
// 如果不实现的话，那么默认是一组
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//     return 1;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    cell的显示样式  必须是初始化的时候就设置
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
//    设置箭头
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    ZJWine * wine = self.wineArray[indexPath.row];
    cell.textLabel.text = wine.wineNameString;
    cell.imageView.image = [UIImage imageNamed:wine.iconNameString];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@",wine.price];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    
    #pragma mark ------ cell的基本属性 ------
//    右边的显示标识
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    右边的显示视图，比显示标识优先级高
    cell.accessoryView = [[UISwitch alloc]init];
//    tableviewcell被选中的样式   如果是style设置为none的话，那么selectbgview也不会出现
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView * selbgView = [[UIView alloc]init];
    selbgView.backgroundColor = [UIColor purpleColor];
    cell.selectedBackgroundView = selbgView;
    
//    背景和背景视图  背景视图的优先级最高
//    UIView * uv = [[UIView alloc]init];
//    uv.backgroundColor = [UIColor blueColor];
//    cell.backgroundView = uv;
//    背景
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"WINE";
}
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"WINE";
}

@end





